Session.set 'addingInsect', false

Template.addInsect.controlConfig =
  add : (event, template) ->
    Session.set 'addInsectErrors', null
 
  cancel : (event, template) ->
    Session.set 'addInsectErrors', null

  errors : () ->
    Session.get 'addInsectErrors'

  formTemplate : this

  hideForm : (event, template) ->
    Session.set 'addingInsect', false unless this.errors()?

  showForm : (event, template) ->
    Session.set 'addingInsect', true

  submit : (event, template) ->
    console.log 'sub template', template
    attrs =
      commonName : this.formTemplate.find('input#commonName').value
      scientific : this.formTemplate.find('input#scientificName').value
    errors = Insects.validate attrs
    Session.set 'addInsectErrors', errors
    unless errors?
      Meteor.call 'newInsect', attrs


Template.addInsect.addingInsect = ->
  Session.get 'addingInsect'
