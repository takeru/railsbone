class Railsbone.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  tagName: "ul"

  collection: null

  initialize: ->
    console.log("init", @collection)
    @listenTo(@collection, "add",    @onAdd);
    @listenTo(@collection, "remove", @onRemove);
    @listenTo(@collection, "change", @onChange);
    @listenTo(@collection, "update", @onUpdate);

  onAdd: (model, collection, options)->
    console.log("View onAdd")
    # @render()

  onRemove: (model, collection, options)->
    console.log("View onRemove")
    # @render()

  onChange: (model, options)->
    console.log("View onChange")
    @render()

  onUpdate: (collection, options)->
    console.log("View onUpdate")
    @render()

  render: ->
    console.log("View render")
    html = @template(users: @collection.toJSON())
    @$el.html(html);
    return this;

  events: {
    "click .delete": "onDeleteClick"
  }

  onDeleteClick: (jqEvent)->
    user_id = $(jqEvent.target).closest("li").attr("user_id")
    console.log("View onDeleteClick", user_id)

    @collection.get(user_id).destroy()
