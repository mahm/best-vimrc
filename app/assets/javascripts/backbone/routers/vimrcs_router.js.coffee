class BestVimrc.Routers.VimrcsRouter extends Backbone.Router
  initialize: (options) ->
    @vimrcs = new BestVimrc.Collections.VimrcsCollection()
    @vimrcs.reset options.vimrcs

  routes:
    "/index"           : "index"
    "/:id/edit"        : "edit"
    "/:id"             : "show"
    ".*"               : "index"
    # "/index/score"     : "indexByScore"
    "/index/pushed-at" : "indexByPushedAt"

  index: ->
    @vimrcs.setSortType("score")
    @view = new BestVimrc.Views.Vimrcs.IndexView(vimrcs: @vimrcs)
    @view.changeTabToScore()
    $("#vimrcs").html(@view.render().el)

  indexByPushedAt: ->
    @vimrcs.setSortType("pushed-at")
    @view = new BestVimrc.Views.Vimrcs.IndexView(vimrcs: @vimrcs)
    @view.changeTabToPushedAt()
    $("#vimrcs").html(@view.render().el)

  show: (id) ->
    vimrc = @vimrcs.get(id)

    @view = new BestVimrc.Views.Vimrcs.ShowView(model: vimrc)
    $("#vimrcs").html(@view.render().el)

  edit: (id) ->
    vimrc = @vimrcs.get(id)

    @view = new BestVimrc.Views.Vimrcs.EditView(model: vimrc)
    $("#vimrcs").html(@view.render().el)

