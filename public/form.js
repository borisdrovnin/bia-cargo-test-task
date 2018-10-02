(function() {
  'use strict';
  window.addEventListener('load', function() {
    var frm = $('#calculate');
    frm.submit(function (e) {
      // отмена отправки формы
      e.preventDefault();
      e.stopPropagation();

      let from = $('#from').val();
      let to = $('#to').val();

      if(frm.get(0).checkValidity()){
        // в случае успеха, данные отправляются на сервер
        // результат отобразится в элементе #result
        $.ajax({
          dataType: 'json',
          type: frm.attr('method'),
          url: frm.attr('action'),
          data: frm.serialize(),
          success: function (data) {
            $('#result').html(`Расстояние: ${data.distance} км. Стоимость: ${data.price} р.`);
          },
          error: function (data) {
            console.log('Error', data);
            $('#result').html(data.responseJSON.error);
          },
        });
      }

      // подсветка валидации
      frm.addClass('was-validated');
    });
  }, false);
})();
