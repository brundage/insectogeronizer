Session.set 'editingScientificName', null

Template.listInsects.insects = () -> Insects.find()

Template.listInsects.events({

  'dblclick .commonName': (event, template) ->
    Session.set 'editingCommonName', this._id
    Meteor.setTimeout(
      () -> activateInput(template.find("#commonNameInput"))
      200 )

  'dblclick .scientificName': (event, template) ->
    Session.set 'editingScientificName', this._id
    Meteor.setTimeout(
      () -> activateInput(template.find("#scientificNameInput"))
      200 )
})


Template.insectItem.events okCancelEvents( "#commonNameInput", {
    cancel: () -> Session.set "editingCommonName", null
    ok: (value) ->
      Insects.update this._id, { $set: { commonName: value } }
      Session.set "editingCommonName", null
  })


Template.insectItem.events okCancelEvents( "#scientificNameInput", {
    cancel: () -> Session.set "editingScientificName", null
    ok: (value) ->
      Insects.update this._id, { $set: { scientificName: value } }
      Session.set "editingScientificName", null
  })


Template.insectItem.editingCommonName = ->
  Session.equals 'editingCommonName', this._id


Template.insectItem.editingScientificName = ->
  Session.equals 'editingScientificName', this._id
