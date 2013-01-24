Template.addControl.events
  'click .add' : (event, template) ->
    this.add(event, template) if this.add?
