class Railsbone.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  tagName: "ul"

  collection: null

  initialize: ->
    console.log("init", @collection)
    @listenTo(@collection, "add",    @onAdd);
    @listenTo(@collection, "remove", @onRemove);
    @listenTo(@collection, "change", @onChange);

  onAdd: (model, collection, options)->
    console.log("View onAdd")
    @render()

  onRemove: (model, collection, options)->
    console.log("View onRemove")
    @render()

  onChange: (model, options)->
    console.log("View onChange")
    @render()

  render: ->
    html = @template(users: @collection.toJSON())
    @$el.html(html);
    return this;
