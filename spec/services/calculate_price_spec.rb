RSpec.describe CargoTask::Services::CalculatePrice do
  let(:distance_service) do
    instance_double(
      CargoTask::Services::Distance,
      distance: 714,
      call: 714
    )
  end

  context 'with valid params' do
    let(:params) do
      {
        length: 1,
        width: 1,
        height: 1,
        weight: 1,
        volume: 1,
        from: 'a',
        to: 'b'
      }
    end
    it 'calculates price' do
      price_service = described_class.new(params, distance_service)

      # проверка что создаётся запись в бд
      expect { price_service.call }.to change { CargoTask::SearchQuery.count }

      expect(price_service.price).to eq(4070.0)
      expect(price_service.distance).to eq(714)
    end
  end

  context 'with invalid param' do
    let(:params) do
      {
        width: 1,
        height: 1,
        weight: 1,
        volume: 1
      }
    end
    it 'raises error' do
      price_service = described_class.new(params, distance_service)
      expect { price_service.call }.to \
        raise_error("The property '#/' did not contain a required property of 'length'")
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        length: 'adafsdfsdfgsdfgsdfg',
        width: -1,
        height: -1,
        weight: -1,
        volume: -1,
        to: 6,
        from: 9
      }
    end
    it 'raises error' do
      price_service = described_class.new(params, distance_service)
      expect { price_service.call }.to \
        raise_error(JSON::Schema::ValidationError)
    end
  end

  context 'without params' do
    it 'raises error' do
      price_service = described_class.new({}, distance_service)
      expect { price_service.call }.to \
        raise_error(JSON::Schema::ValidationError)
    end
  end
end
