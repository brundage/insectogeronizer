Template.addControl.events
  'click .add' : (event, template) ->
    this.add(event, template) if this.add?
    this.showForm(event, template) if this.showForm?

Template.okCancelControl.events
  'click .cancel' : (event, template) ->
    this.cancel(event, template) if this.cancel?
    this.hideForm(event, template) if this.hideForm?

  'click .submit' : (event, template) ->
    this.submit(event, template) if this.submit?
    this.hideForm(event, template) if this.hideForm?
