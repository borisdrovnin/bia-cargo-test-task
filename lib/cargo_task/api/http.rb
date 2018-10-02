module CargoTask
  module API
    class HTTP
      get '/' do
        erb :index
      end

      post '/price' do
        distance_service = Services::Distance.new
        Services::CalculatePrice
          .new(params, distance_service)
          .call
          .to_json
      end
    end
  end
end
