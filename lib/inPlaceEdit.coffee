InPlaceEdit = {

  activateInput : (args) ->
    input = args.template.find args.selector
    if input
      input.focus()
      input.select()

  editField : (args) ->
    Session.set args.sessionTag, args.record._id
    Meteor.setTimeout(
      () -> InPlaceEdit.activateInput(args)
      this.timeout )

  okCancelEvents : (selector, callbacks) ->
    cancel = callbacks.cancel || () ->
    ok = callbacks.ok || () ->
    events = {}
    events['keyup '+selector+', keydown '+selector+', focusout '+selector] = (evt) ->
      if evt.type == "keydown" && evt.which == 27
        cancel.call this, evt
      else if evt.type == "keyup" && evt.which == 13 || evt.type == "focusout"
        value = String(evt.target.value || "")
        if value then ok.call this, value, evt else cancel.call this, evt
    events

  timeout : 200

}
