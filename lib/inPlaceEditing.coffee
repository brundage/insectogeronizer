#///////// Helpers for in-place editing //////////

#/ Returns an event map that handles the "escape" and "return" keys and
#/ "blur" events on a text input (given by selector) and interprets them
#/ as "ok" or "cancel".
okCancelEvents = (selector, callbacks) ->
  cancel = callbacks.cancel || () ->
  ok = callbacks.ok || () ->
  events = {}
  events['keyup '+selector+', keydown '+selector+', focusout '+selector] = (evt) ->
    if evt.type == "keydown" && evt.which == 27
      cancel.call this, evt
    else if evt.type == "keyup" && evt.which == 13 || evt.type == "focustou"
      value = String(evt.target.value || "")
      if value then ok.call this, value, evt else cancel.call this, evt
  events

activateInput = (input) ->
  if input
    input.focus()
    input.select()
