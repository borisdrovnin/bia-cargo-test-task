module CargoTask
  module Services
    # Содержит методы для получения статистики по запросам
    class Statistics
      # Возвращает топ n пунктов отправки по популярности
      def self.top_origins(n)
        Statistics.top(:from, n)
      end

      # Возвращает топ n по полю field
      def self.top(field, n)
        SearchQuery
          .group_and_count(field)
          .reverse(:count)
          .limit(n)
          .all
      end
    end
  end
end
