class Railsbone.Views.UsersItem extends Backbone.Marionette.ItemView
  template: JST['users/index_item']
  tagName: "li"

  modelEvents:{
    "change": "onModelChange"
  }
  onModelChange: (model, options)->
    console.log("Item onModelChange")
    @render()

  ui:{
    "deleteButton": ".delete"
  }
  triggers:{
    "click @ui.deleteButton": "deleteButtonClick",
  }
  onDeleteButtonClick: ->
    console.log("Item onDeleteButtonClick", @model.get("id"))
    @model.destroy()


class Railsbone.Views.UsersIndex extends Backbone.Marionette.CollectionView
  tagName: "ul"
  childView: Railsbone.Views.UsersItem
