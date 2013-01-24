Template.okCancelControl.events
  'click .cancel' : (event, template) ->
    this.cancel(event, template) if this.cancel?

  'click .submit' : (event, template) ->
    this.submit(event, template) if this.submit?
