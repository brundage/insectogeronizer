Session.set 'addingInsect', null

Template.addInsect.controlCallbacks =
  add : (event, template) ->
    Session.set 'addingInsect', true
    Session.set 'addInsectErrors', null
 
  cancel : (event, template) ->
    Session.set 'addingInsect', null
    Session.set 'addInsectErrors', null

  submit : (event, template) ->
    attrs =
      commonName : DomUtils.find(document, 'input#commonName').value
      scientificName : DomUtils.find(document, 'input#scientificName').value
    errors = Insects.validate attrs
    if errors.count() == 0
      Session.set 'addingInsect', null
      Meteor.call 'newInsect', attrs
    else
      Session.set 'addInsectErrors', errors


Template.addInsect.addingInsect = ->
  Session.get 'addingInsect'


Template.addInsect.events
  'keyup #scientificName, keyup #commonName' : (event, template) ->
    if event.which == 13
      this.submit()

Template.addInsect.errors = ->
  errors = Session.get('addInsectErrors')
  errors.errors if errors?
