Meteor.subscribe I.subscriptions.insects

Session.set 'addingInsects', false
Session.set 'editingCommonName', null
Session.set 'editingScientificName', null

Template.listInsects.insects = () -> Insects.find()

Template.listInsects.events
  'dblclick .commonName, tap .commonName': (event, template) ->
    InPlaceEdit.editField
      record: this,
      sessionTag: 'editingCommonName',
      selector: "#commonNameInput",
      template: template

  'dblclick .scientificName, tap .scientificName': (event, template) ->
    InPlaceEdit.editField
      record: this,
      sessionTag: 'editingScientificName',
      selector: "#scientificNameInput",
      template: template


Template.insectItem.events InPlaceEdit.okCancelEvents( "#commonNameInput",
    cancel: () -> Session.set "editingCommonName", null
    ok: (value) ->
      args =
        id : this._id
        attrs : { commonName: value }
      Meteor.call 'updateInsect', args
      Session.set "editingCommonName", null
  )


Template.insectItem.events InPlaceEdit.okCancelEvents( "#scientificNameInput",
    cancel: () -> Session.set "editingScientificName", null
    ok: (value) ->
      args =
        id: this._id
        attrs: { scientificName: value }
      Meteor.call 'updateInsect', args
      Session.set "editingScientificName", null
  )


Template.insectItem.editingCommonName = ->
  Session.equals 'editingCommonName', this._id


Template.insectItem.editingScientificName = ->
  Session.equals 'editingScientificName', this._id


Template.addInsect.events
  'click .add': (event, template) ->
    Session.set 'addingInsect', true

  'click .cancel':  (event, template) ->
    Session.set 'addingInsect', false
    Session.set 'addInsectErrors', null

  'click .submit' : (event, template) ->
    attrs =
      commonName : template.find('input#commonName').value
      scientific : template.find('input#scientificName').value
    errors = Insects.validate attrs
    if errors?
      Session.set 'addInsectErrors', errors
    else
      Meteor.call 'newInsect', attrs
      Session.set 'addingInsect', false


Template.addInsect.addingInsects = ->
  Session.get 'addinginsects'


Template.insectErrors.errors = ->
  Session.get 'addInsectErrors'
