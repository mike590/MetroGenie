console.log("required collection")

var OptionList = Backbone.Collection.extend({
  model: Option,
  url: "/calculate"
})