console.log("required collection")

var ChoiceList = Backbone.Collection.extend({
  model: Choice,
  url: "/calculate"
})