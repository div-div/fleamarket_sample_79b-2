$(function(){
  $(".Base__body__area__item__informationArea__space").on('keyup', function(){
    $(".Base__body__area__item__informationArea__number").text($(this).val().length + "/1000");
  });
  
  $("#price").change(function(){
    var price = $("#price").val();
    var priceI = parseInt(price);
    var fee = priceI / 10;
    var profit = priceI - fee
    var feeRadix = parseInt(fee, 10);
    var profitRadix = parseInt(profit, 10);

    $(".Base__body__area__price__chargeArea__calculate").html(feeRadix);
    $(".Base__body__area__price__profitArea__calculate").html(profitRadix);
  });
})