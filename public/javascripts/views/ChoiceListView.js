console.log('Required list view')


var ChoiceListView = Backbone.View.extend({
  render: function(){
    this.$el.empty();
    var choice1View = new ChoiceView({model: this.collection.option_1});
    var choice2View = new ChoiceView({model: this.collection.option_2});
    this.$el.append(choice1View.render().$el);
    this.$el.append(choice2View.render().$el);
    return this;
  }  
})