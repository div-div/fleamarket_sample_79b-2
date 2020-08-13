$(document).on('turbolinks:load',function(){

  Payjp.setPublicKey('pk_test_6d3eda6cd26e4304e429dc59');

  var form = $(".form");

  $("#charge-form").click(function() {

    form.find("input[type=submit]").prop("disabled", true);

    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    };
    
    Payjp.createToken(card, function(status, response) {
      console.log(response)
      if (response.error){
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }
      else {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        var token = response.id;
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      };
    });
  });
});
