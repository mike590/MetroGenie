console.log('Required view')

var ChoiceView = Backbone.View.extend({
  template: function() { 
    var choiceType = this.model.attributes.type;
    if(choiceType === "money"){
        return _.template($('#money-choice-template').html()) 
    } else if(choiceType === "weekly"){
        return _.template($('#weekly-choice-template').html())
    } else if(choiceType === "monthly"){
        return _.template($('#monthly-choice-template').html())
    } else if(choiceType === "hybrid"){
        return _.template($('#hybrid-choice-template').html())
    }
  },
  tagName: 'span',
  className: "choice",
  render: function(){
    this.$el.html(this.template()(this.model.toJSON()));
    return this;
  }
})