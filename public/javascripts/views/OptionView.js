console.log('Required view')

var OptionView = Backbone.View.extend({
  // template: _.template($('#option-view-template').html()),
  className: "option",
  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
})