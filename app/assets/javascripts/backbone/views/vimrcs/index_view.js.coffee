BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.IndexView extends Backbone.View
  template: JST["backbone/templates/vimrcs/index"]

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')

    @options.vimrcs.bind('reset', @addAll)

  addAll: () ->
    @options.vimrcs.each(@addOne)

  addOne: (vimrc) ->
    view = new BestVimrc.Views.Vimrcs.VimrcView({model : vimrc})
    @$("#vimrcs-list").append(view.render().el)

  render: ->
    $(@el).html(@template(vimrcs: @options.vimrcs.toJSON() )).fadeIn(3000)
    @addAll()

    return this

  changeTabToPushedAt: ->
    $("li#pushed-at").addClass("active")
    $("li#score").removeClass("active")

  changeTabToScore: ->
    $("li#pushed-at").removeClass("active")
    $("li#score").addClass("active")
