var UserInput = new Array;
//Burger Menu in Mobile
$.when( $.ready ).then(function() {
  $('#nav-icon1').toggleClass('open');
});
$(document).ready(function(){
  $('#nav-icon1').click(function(){
    $(this).toggleClass('open');
    $('.menu').slideToggle(300);
  });
});
//Pattern while Background Image Loads

//Was ist Gruppe?
$(document).ready(function() {
  $('#wasGroup').click(function(event) {
    $('#Overlay').css('display', 'block');
    $('#wasGroup').css('display', 'block');
    $('#wasEinzeln').css('display', 'none');
    $('#Kontaktanfrage').css('display', 'none');
    $('#Close').css('display', 'block');
  });
});
//Was ist Einzeln?
$(document).ready(function() {
  $('#wasGroup').click(function(event) {
    $('#Overlay').css('display', 'block');
    $('#wasGroup').css('display', 'none');
    $('#wasEinzeln').css('display', 'block');
    $('#Kontaktanfrage').css('display', 'none');
    $('#Close').css('display', 'block');
  });
});
//Kontaktanfrage
$(document).ready(function() {
  $('#wasGroup').click(function(event) {
    $('#Overlay').css('display', 'block');
    $('#wasGroup').css('display', 'none');
    $('#wasEinzeln').css('display', 'none');
    $('#Kontaktanfrage').css('display', 'block');
    $('#Close').css('display', 'block');
  });
});
// Overlay Close
$(document).ready(function() {
  $('#wasGroup').click(function(event) {
    $('#Overlay').css('display', 'none');
    $('#wasGroup').css('display', 'none');
    $('#wasEinzeln').css('display', 'none');
    $('#Kontaktanfrage').css('display', 'none');
    $('#Close').css('display', 'block');
  });
});
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
