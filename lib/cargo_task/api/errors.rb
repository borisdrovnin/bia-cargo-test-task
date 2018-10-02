module CargoTask
  module API
    class HTTP
      error CargoTask::Services::DistanceAPIError do
        status 500
        { error: env['sinatra.error'].message }.to_json
      end

      error JSON::Schema::ValidationError do
        status 422
        msg = env['sinatra.error'].message
        { error: "Ошибка валидации (#{msg})" }.to_json
      end
    end
  end
end
