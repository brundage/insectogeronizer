Session.set 'showAddForm', null

Template.addInsect.controlCallbacks =
  add : (event, template) ->
    Session.set 'showAddForm', true
    Session.set 'addInsectErrors', null
    Meteor.setTimeout ->
      i = DomUtils.find(document, 'input#scientificName')
      if i?
        i.focus()
    , 500
      
  cancel : (event, template) ->
    Session.set 'showAddForm', null
    Session.set 'addInsectErrors', null

  submit : (event, template) ->
    attrs =
      commonName : DomUtils.find(document, 'input#commonName').value
      scientificName : DomUtils.find(document, 'input#scientificName').value
    errors = Insects.validate attrs
    if errors.count() == 0
      Session.set 'showAddForm', null
      Meteor.call 'newInsect', attrs
    else
      Session.set 'addInsectErrors', errors


Template.addInsect.addingInsect = ->
  Session.get 'showAddForm'


Template.addInsect.events
  'keyup #scientificName, keyup #commonName' : (event, template) ->
    if event.which == 13
      this.submit()
    else if event.which == 27
      this.cancel()


Template.addInsect.errors = ->
  errors = Session.get('addInsectErrors')
  errors.errors if errors?


Template.addInsect.addControlVisibility = ->
  if Session.get('showAddForm')? then 'invisible' else ''


Template.addInsect.formVisibility = ->
  if Session.get('showAddForm')? then '' else 'invisible'
