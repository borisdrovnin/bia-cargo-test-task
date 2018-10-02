module CargoTask
  module Services
    # Сервисный класс для получения расстояния между двумя адресами.
    # Работает при помощи google distance matrix api.
    class Distance
      URL = 'https://maps.googleapis.com/maps/api/distancematrix/json'.freeze

      attr_reader :distance
      attr_reader :from, :to

      def initialize
        @distance = nil
      end

      # Делает запрос и возвращает расстояние в километрах.
      # В случае ошибки или если адрес не найден бросает
      # RuntimeException с описанием.
      def call(from, to)
        @from = from
        @to = to
        fetch_distance_info
        @distance = (@element[:distance][:value] / 1000.0).round if status == 'OK'
      end

      private

      def fetch_distance_info
        LOGGER.info { "Request distance: #{from}, #{to}" }
        response = RestClient.get(URL, params: params)
        @json = JSON.parse(response.body, symbolize_names: true)
        # предположим что в ответе всегда будет 1 row и 1 element
        @element = @json.dig(:rows, 0, :elements, 0)
        LOGGER.info { "Response status: #{status}" }
        return if status == 'OK'
        raise DistanceAPIError, 'Маршрут не найден' if status == 'ZERO_RESULTS'
        raise DistanceAPIError, "Не найден город отправления: #{from}" if origin.empty?
        raise DistanceAPIError, "Не найден город назначения: #{to}" if destination.empty?

        raise DistanceAPIError, "Ошибка запроса расстояния: #{status}"
      end

      def status
        @element[:status]
      end

      def destination
        @json[:destination_addresses][0]
      end

      def origin
        @json[:origin_addresses][0]
      end

      def params
        {
          origins: from,
          destinations: to,
          key: ENV['API_KEY'],
          language: 'ru',
          region: 'ru'
        }
      end
    end

    class DistanceAPIError < RuntimeError
    end
  end
end
