### Тестовое задание

#### Установка и запуск

 - `vagrant up && vagrant ssh`
 - выполнить миграции `rake db:migrate` и `RACK_ENV=test rake db:migrate`
 - запустить тесты `bundle exec rspec`
 - запустить приложение `bundle exec ruby app.rb`
 
Для корректной работы требуется задать переменную окружения `API_KEY`, api ключ для доступа к google distance matrix api. Подробнее https://developers.google.com/maps/documentation/distance-matrix/start
 
#### Описание

http://localhost:4000/ - страница для рассчёта стоимости

http://localhost:4000/top3 - топ три отправителя (откуда)
