require_relative 'calculate_price/search_query_schema'

module CargoTask
  module Services
    # Класс для вычисления стоимости исходя из длины, ширины, высоты,
    # веса, объёма и расстояния, по формуле
    # 500 + (длина + ширина + высота + вес + объём) * расстояние
    class CalculatePrice
      # Коэффициент при рассчете стоимости
      MINIMAL_PRICE = 500
      # Параметры значения которых необходимо распарсить в float
      NUMERIC_PARAMS = %w[length width height weight volume].freeze

      attr_reader :params, :distance_service, :distance

      def initialize(params, distance_service)
        @params = params
        @distance_service = distance_service
      end

      # Вычисляет стоимость
      def call
        map_params!
        validate!
        call_distance_service
        log_request_to_database
        response
      end

      # Вычисляет стоимость по формуле с округлением до 2-х знаков после запятой
      def price
        (MINIMAL_PRICE + attribute_sum * @distance).round(2)
      end

      private

      # Расстояние между двумя точками
      def call_distance_service
        @distance = @distance_service.call(params[:from], params[:to])
      end

      # Заменяет объект params объектом типа Hash.
      # Парсит значения ключи которых перечислены в NUMERIC_PARAMS.
      # Преобразует ключи в символы.
      def map_params!
        @params = @params.each_with_object({}) do |(k, v), h|
          h[k.to_sym] = NUMERIC_PARAMS.include?(k.to_s) ? v.to_f : v
        end
      end

      # Валидирует параметры в соответствие json-схеме SEARCH_QUERY_SCHEMA
      def validate!
        JSON::Validator.validate!(SEARCH_QUERY_SCHEMA, @params)
      end

      # Сумма некоторых атрибутов
      def attribute_sum
        params[:length] + params[:width] + params[:height] +
          params[:weight] + params[:volume]
      end

      # Сохраняет текущие параметры, стоимость и
      # названия городов в нижнем регистре в БД
      def log_request_to_database
        data = params.merge(
          price: price,
          from: params[:from].downcase,
          to: params[:to].downcase
        )
        SearchQuery.create(data)
      end

      # Результат вызова этого сервиса.
      # Стоимость и расстояние.
      def response
        { price: price, distance: @distance }
      end
    end
  end
end
