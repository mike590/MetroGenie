console.log('Required list view')


var ChoiceListView = Backbone.View.extend({
  render: function(){
    debugger
    this.$el.empty();
    var choice1View = new ChoiceView({model: this.collection.models[0]});
    var choice2View = new ChoiceView({model: this.collection.models[1]});
    this.$el.append(choice1View.render().$el);
    this.$el.append(choice2View.render().$el);
    return this;
  }  
})