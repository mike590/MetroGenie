var $startDate;
var $endDate;
var $weekdayRides;
var $weekendRides;
var $submit;
var $dateArray;

$(function(){
  $startDate = $('#start-date')
  $endDate = $('#end-date')
  $weekdayRides = $('#weekday-rides')
  $weekendRides = $('#weekend-rides')
  $submit = $('#submit')
  $('#submit').click(function(e) {
    e.preventDefault();
    var proceed = true
    if ($startDate.val() === ""){
      // generate error
      proceed = false
      console.log("This error is for start date value")
    }

    if ($endDate.val() === ""){
      // generate error
      proceed = false
      console.log("This error is for end date value")
    }

    if ($weekdayRides.val() === "Choose"){
      // generate error
      proceed = false
      console.log("This error is for weekday rides value")
    }

    if ($weekendRides.val() === "Choose"){
      // generate error
      proceed = false
      console.log("This error is for weekend rides value")
    }

    if (proceed){
      submitData();
    }
  });
});
  
function submitData(){
  $.ajax({
    url: '/calculate',
    method: 'GET',
    dataType: 'JSON',
    data: {start_date: $startDate.val(), end_date: $endDate.val(), weekday_rides: $weekdayRides.val(), weekend_rides: $weekendRides.val()},
    success: function(data){
      $choices = $(data);
    }
  });
}

function flexible(option1, option2){
  if(option1.weekly + option1.monthly > option2.weekly + option2.monthly){

  }
  elsif(option1.weekly + option1.monthly < option2.weekly + option2.monthly){

  }
  else{

  }
}