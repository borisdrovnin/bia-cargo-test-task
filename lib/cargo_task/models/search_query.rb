module CargoTask
  # Предназначен для логгированиея в БД запросов на рассчёт стоимости
  #
  # Имеются поля:
  # created_at - время запроса
  # length - длина
  # width - ширина
  # height - высота
  # weight - общий вес
  # volume - общий объём
  # distance - общий объём
  # price - расчитаная стоимость
  # from - город отправки
  # to - город назначения
  class SearchQuery < Sequel::Model
    def before_create
      self.created_at ||= Time.now
      super
    end
  end
end
