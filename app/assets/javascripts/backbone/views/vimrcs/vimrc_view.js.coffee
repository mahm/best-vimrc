BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.VimrcView extends Backbone.View
  template: JST["backbone/templates/vimrcs/vimrc"]

  events :
    "click .button.vote" : "vote"

  tagName: "div"

  vote: ->
    @model.save(null,
      success: (vimrc) =>
        @model.attributes.vote_count += 1
        $("#{@model.id}").html(@render())

      error: (vimrc, jqXHR) =>
        $("#dialog").dialog({
          title: "HOW TO VOTE THIS VIMRC?"
          buttons: {
            OK: ->
              $(this).dialog("close")
          }
        })
    )

  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this
