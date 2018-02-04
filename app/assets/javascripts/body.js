//Burger Menu in Mobile
  $.when( $.ready ).then(function() {
    $('#nav-icon1').toggleClass('open');
    console.log('test1');
  });
  $(document).ready(function(){
    $('#nav-icon1').click(function(){
      $(this).toggleClass('open');
      $('.menu').slideToggle(300);
      $('#toggle').delay(250).slideToggle(50);
    });
  });
if(($('.search').length) && ($(window).width() <= 904)){
  $(document).ready(function(){    
      console.log("Test");
      $('#nav-icon1').toggleClass('open');
      $('.menu').slideToggle(300);
      $('#toggle').delay(250).slideToggle(50); 
  })
}




//Pattern while Background Image Loads

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