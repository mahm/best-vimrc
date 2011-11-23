BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.NewView extends Backbone.View    
  template: JST["backbone/templates/vimrcs/new"]
  
  events:
    "submit #new-vimrc": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (vimrc) =>
        @model = vimrc
        window.location.hash = "/#{@model.id}"
        
      error: (vimrc, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this