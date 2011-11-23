BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.VimrcView extends Backbone.View
  template: JST["backbone/templates/vimrcs/vimrc"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this