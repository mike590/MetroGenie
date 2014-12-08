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
    submitData();
  });
});
  
function submitData(){
  $.ajax({
    url: '/calculate',
    method: 'GET',
    dataType: 'JSON',
    data: {start_date: $startDate.val(), end_date: $endDate.val(), weekday_rides: $weekdayRides.val(), weekend_rides: $weekendRides.val()},
    success: function(data){
      $dateArray = $(data);
    }
  });
}