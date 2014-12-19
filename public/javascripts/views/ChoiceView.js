console.log('Required view')

var ChoiceView = Backbone.View.extend({
  template: function() { return _.template($('#choice-template').html()) },
  tagName: 'span',
  className: "choice",
  render: function(){
    this.$el.html(this.template()(this.model.toJSON()));
    return this;
  }
})