BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.VimrcView extends Backbone.View
  template: JST["backbone/templates/vimrcs/vimrc"]

  tagName: "div"

  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this
