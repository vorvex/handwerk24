//Burger Menu in Mobile
if($(window).width() <= 904 ) {
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
  
} 
if(($('.search').length) && ($(window).width() <= 904)){
      console.log("Test");
      $('#nav-icon1').toggleClass('open');
      $('.menu').slideToggle(300);
      $('#toggle').delay(250).slideToggle(50); 
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
// Zeigt die Anzahl der Ausgewählten Leistungen im Such Button an
$(document).ready(function() {
  $('#click').click(function(event) {
    var Leistung = document.forms[0];
    var count = 0;
    var i;
    for (i = 0; i < Leistung.length; i++) {
        if (Leistung[i].checked) {
            count += +Leistung[i].value
        }
    }
    var outputSucheCount = "Suche (" + count + ")"
    document.getElementById("Suche").innerHTML= outputSucheCount;
  });
});
//Prevent Default für Form
function preventDefault() {
  event.preventDefault();
}
//Collects Data
function getValues() {
  var formValue = document.forms[0];
  var x;
  var y = formValue.length;
  var FormLength = y - 2;
  UserInput[0] = formValue[0].value;
  for (x = 1; x < FormLength; x++) {
    if (formValue[x].checked) {
      UserInput[x] = true;
    }
  }
  var Leistung = document.forms[0];
  var count = 0;
  var i;
  for (i = 0; i < Leistung.length; i++) {
      if (Leistung[i].checked) {
          count += +Leistung[i].value;
      }
  }
  console.log(UserInput);
}
//POST Method
function posting() {
  $.ajax({
    url: '/json/ServerImitate.js',
    type: 'POST',
    data: {'postleitzahl': UserInput[0]},
    dataType: 'json',
    success: function(data) {
      data = JSON.parse(data);
    },
    error: function(data) {
      alert('Es ist ein Fehler aufgetreten, bitte versuchen Sie es noch einmal!');
    }
  });
}

//Loading Animation
$(document).ready(function() {
  var rotation = function (){
     $("#loadingAnimation").rotate({
        angle:0,
        animateTo:360,
        callback: rotation,
        easing: function (x,t,b,c,d){        // t: current time, b: begInnIng value, c: change In value, d: duration
            return c*(t/d)+b;
        }
     });
  }
  rotation();
});

//Suche Clicked
$(document).ready(function() {
  $('#Suche').click(function(event) {
    getValues();
    $('.loading').fadeIn('fast', function() {
        $('.loading').css('display', 'flex');
    });

  });
});
