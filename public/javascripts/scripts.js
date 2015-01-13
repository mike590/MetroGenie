var $startDate;
var $endDate;
var $weekdayRides;
var $weekendRides;
var $newCard
var $submit;
var $dateArray;
var choices;
var choiceList;
var choiceListView;

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

// $(document).scroll(function(){
//     if($(this).scrollTop() > t)
//     {   
//         $('#voice2').css({"border-bottom":"2px solid #f4f5f8"});
//         $('#voice3').css({"border-bottom":"2px solid #2e375b"});
//     }
// });

function submitData(){
  console.log("submit data");
  $newCard = $('input:checked')
  choiceList = new ChoiceList()
  choiceList.reset();
  choiceList.fetch({
    data: {start_date: $startDate.val(), 
           end_date: $endDate.val(), 
           weekday_rides: $weekdayRides.val(), 
           weekend_rides: $weekendRides.val(),
           new_card: $newCard.val() 
    },
    success: function(){
      choiceListView = new ChoiceListView({
        collection: choiceList,
        el: $('#choices-container')
      })
      choiceListView.render();
    }    
  })
}