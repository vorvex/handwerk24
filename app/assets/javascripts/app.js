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
  
    $("#hideKontakt").click(function() {
      $('.ergebnisContainer').fadeToggle(100);
      $('#show').fadeToggle(100);
      $('.buttonstyle4').toggle();
    });
});

//Burger Menu in Mobile
$.when( $.ready ).then(function() {
    $('#nav-icon1').toggleClass('open-menu');
});
$(document).ready(function(){
    $('#nav-icon1').click(function(){
      $(this).toggleClass('open-menu');
      $('.menu').slideToggle(300);
      $('#toggle').delay(250).slideToggle(50);
    });
});

if(($('.search').length) && ($(window).width() <= 904)){
  $(document).ready(function(){    
      console.log("Test");
      $('#nav-icon1').toggleClass('open-menu');
      $('.menu').slideToggle(300);
      $('#toggle').delay(250).slideToggle(50); 
  })
}

//Was ist Gruppe?
function wasGroup() {
    $('.Overlay').fadeToggle(100);
    $('#wasGroup').css('display', 'block');
    $('#wasEinzeln').css('display', 'none');
    $('#Kontaktanfrage').css('display', 'none');
    $('#Close').css('display', 'block');
  }

//Was ist Einzeln?
function wasEinzeln() {
  $('.Overlay').css('display', 'block');
  $('#wasGroup').css('display', 'none');
  $('#wasEinzeln').css('display', 'block');
  $('#Close').css('display', 'block');
}

// Overlay Close
function closeOverlay() {
    $('.Overlay').fadeToggle(100);
    $('#wasGroup').css('display', 'none');
    $('#wasEinzeln').css('display', 'none');
    $('#Kontaktanfrage').css('display', 'none');
    $('#Close').css('display', 'none');
  }