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
var sectionPosition = "top";
var slidePosition = 0;

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
    }

    if ($endDate.val() === ""){
      // generate error
      proceed = false
    }

    if ($weekdayRides.val() === "Choose"){
      // generate error
      proceed = false
    }

    if ($weekendRides.val() === "Choose"){
      // generate error
      proceed = false
    }
    
    if (proceed){
      submitData();
    }
  });
});

function moveDown(){
  $('.results').show(function(){
    sectionPosition = "bottom";
    $.fn.fullpage.moveSectionDown();
  });
}

function submitData(){
  if(sectionPosition === "top"){
    moveDown()
  } else{
    $.fn.fullpage.moveSlideRight();
  }
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
      if (slidePosition === 0){
        choiceListView = new ChoiceListView({
          collection: choiceList,
          el: $('.left-choices')
        })
        choiceListView.render();
      } else{
        choiceListView = new ChoiceListView({
          collection: choiceList,
          el: $('.right-choices')
        })
        choiceListView.render();
      }
    }    
  })
}