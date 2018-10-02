RSpec.describe CargoTask::Services::Distance do
  context 'with existing cities' do
    before do
      distance_api_response('Санкт-Петербург', 'Москва', 'distance/successful')
    end
    it 'gets distance from google api' do
      distance_service = described_class.new
      expect(distance_service.call('Санкт-Петербург', 'Москва')).to eq(714)
      expect(distance_service.distance).to eq(714)
    end
  end

  context 'when origin not found' do
    before do
      distance_api_response('a', 'b', 'distance/origin_not_found')
    end
    it 'raises exception' do
      distance_service = described_class.new
      expect { distance_service.call('a', 'b') }.to \
        raise_error('Не найден город отправления: a')
    end
  end

  context 'when destination not found' do
    before do
      distance_api_response('a', 'b', 'distance/destination_not_found')
    end
    it 'raises exception' do
      distance_service = described_class.new
      expect { distance_service.call('a', 'b') }.to \
        raise_error('Не найден город назначения: b')
    end
  end
end
