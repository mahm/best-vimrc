class BestVimrc.Routers.VimrcsRouter extends Backbone.Router
  initialize: (options) ->
    @vimrcs = new BestVimrc.Collections.VimrcsCollection()
    @vimrcs.reset options.vimrcs

  routes:
    "/new"      : "newVimrc"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newVimrc: ->
    @view = new BestVimrc.Views.Vimrcs.NewView(collection: @vimrcs)
    $("#vimrcs").html(@view.render().el)

  index: ->
    @view = new BestVimrc.Views.Vimrcs.IndexView(vimrcs: @vimrcs)
    $("#vimrcs").html(@view.render().el)

  show: (id) ->
    vimrc = @vimrcs.get(id)
    
    @view = new BestVimrc.Views.Vimrcs.ShowView(model: vimrc)
    $("#vimrcs").html(@view.render().el)
    
  edit: (id) ->
    vimrc = @vimrcs.get(id)

    @view = new BestVimrc.Views.Vimrcs.EditView(model: vimrc)
    $("#vimrcs").html(@view.render().el)
  