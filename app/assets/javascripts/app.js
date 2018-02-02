var cbxCount;
function Count() {
  var KButton = $('#KonButton');
  KButton.text("Kontaktanfrage senden (" + cbxCount + ")");
}

function KonButton() {
  $('.ergebnisContainer').hide();
  $('#show').show();
  
}


jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
      window.location = $(this).data("href");
    });
  
    $("#Konbutton").click(function() {
      $('.ergebnisContainer').hide();
      $('#show').show();
    });
  
    $("*[id*=cbx]").click(function() {
    var this1 = $(this).val();
    if (this1 == "1") {
      $(this).val("0");
      cbxCount--;
      Count();
    } else {
      $(this).val("1");
      cbxCount++;
      Count();
    }});
});