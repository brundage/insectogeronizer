Session.set 'editingCommonName', null
Session.set 'editingScientificName', null

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
