BestVimrc.Views.Vimrcs ||= {}

class BestVimrc.Views.Vimrcs.VimrcView extends Backbone.View
  template: JST["backbone/templates/vimrcs/vimrc"]

  events :
    "click .button.vote" : "vote"

  tagName: "div"

  vote: ->
    @model.save(null,
      success: (vimrc) =>
        $("#{@model.id}").html(@render())

      error: (vimrc, jqXHR) =>
        # unauthorized
        if jqXHR.status == 401
          @unauthorized()
        # bad request
        else if jqXHR.status == 400
          @onlyOneTime()
        else
          @unprocessed()
    )

  unauthorized: ->
    $("#unauthorized-dialog").dialog({
      buttons: {
        OK: ->
          $(this).dialog("close")
      }
    })

  onlyOneTime: ->
    $("#onlyonetime-dialog").dialog({
      buttons: {
        OK: ->
          $(this).dialog("close")
      }
    })

  unprocessed: ->
    $("#unprocessed-dialog").dialog({
      buttons: {
        OK: ->
          $(this).dialog("close")
      }
    })

  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this
