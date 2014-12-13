console.log('Required list view')


var OptionListView = Backbone.View.extend({
  render: function(){
    this.$el.empty();
    var option1View = new OptionView({model: this.collection.option_1});
    var option2View = new OptionView({model: this.collection.option_2});
    this.$el.append(option1View.render().$el);
    this.$el.append(option2View.render().$el);
    return this;
  }  
})