Template.addControl.events
  'click .add' : (event, template) ->
    context = Session.get('context')
    return unless context?
    Session.set 'editing' + context, true

Template.okCancelControl.events
  'click .cancel' : (event, template) ->
    context = Session.get('context')
    return unless context?
    Session.set 'editing' + context, false

  'click .submit' : (event, template) ->
    context = Session.get('context')
    return unless context?
    Session.set 'editing' + context, false
