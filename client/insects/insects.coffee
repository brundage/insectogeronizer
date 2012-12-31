Insects = new Meteor.Collection("insect")

Meteor.subscribe("insects")

Session.set 'editingCommonName', null
Session.set 'editingScientificName', null

Template.listInsects.insects = () -> Insects.find()

Template.listInsects.events({

  'dblclick .commonName, tap .commonName': (event, template) ->
    InPlaceEdit.editField({ record: this, sessionTag: 'editingCommonName', selector: "#commonNameInput", template: template })

  'dblclick .scientificName, tap .scientificName': (event, template) ->
    InPlaceEdit.editField({ record: this, sessionTag: 'editingScientificName', selector: "#scientificNameInput", template: template })

})


Template.insectItem.events InPlaceEdit.okCancelEvents( "#commonNameInput", {
    cancel: () -> Session.set "editingCommonName", null
    ok: (value) ->
      Insects.update this._id, { $set: { commonName: value } }
      Session.set "editingCommonName", null
  })


Template.insectItem.events InPlaceEdit.okCancelEvents( "#scientificNameInput", {
    cancel: () -> Session.set "editingScientificName", null
    ok: (value) ->
      Insects.update this._id, { $set: { scientificName: value } }
      Session.set "editingScientificName", null
  })


Template.insectItem.editingCommonName = ->
  Session.equals 'editingCommonName', this._id


Template.insectItem.editingScientificName = ->
  Session.equals 'editingScientificName', this._id
