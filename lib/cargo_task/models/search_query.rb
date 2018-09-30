module CargoTask
  class SearchQuery < Sequel::Model
    # created_at - время запроса
    # length - длина
    # width - ширина
    # height - высота
    # total_weight - общий вес
    # total_volume - общий объём
    # price - расчитаная стоимость
    # city_name_from - город отправки
    # city_name_to - город назначения
  end
end