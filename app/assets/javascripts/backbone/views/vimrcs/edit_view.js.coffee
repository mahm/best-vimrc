BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.EditView extends Backbone.View
  template : JST["backbone/templates/vimrcs/edit"]
  
  events :
    "submit #edit-vimrc" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (vimrc) =>
        @model = vimrc
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this