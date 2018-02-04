function KonButton() {
  $('.ergebnisContainer').fadeToggle(100);
  $('#show').fadeToggle(100);
  $('#KonButton').fadeToggle(100);
}


jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
      window.location = $(this).data("href");
    });
    
    $("#Konbutton").click(function() {
      $('.ergebnisContainer').fadeToggle(100);
      $('#show').fadeToggle(100);
      $('.buttonstyle4').toggle();
    });

    $("#Konbutton").touch(function() {
      $('.ergebnisContainer').fadeToggle(100);
      $('#show').fadeToggle(100);
      $('.buttonstyle4').toggle();
    });
  
    $("#hideKontakt").click(function() {
      $('.ergebnisContainer').fadeToggle(100);
      $('#show').fadeToggle(100);
      $('.buttonstyle4').toggle();
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

