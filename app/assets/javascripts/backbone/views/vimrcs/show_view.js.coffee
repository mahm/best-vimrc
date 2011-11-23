BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.ShowView extends Backbone.View
  template: JST["backbone/templates/vimrcs/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this