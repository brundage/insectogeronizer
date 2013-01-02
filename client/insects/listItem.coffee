Session.set 'editingCommonName', null
Session.set 'editingScientificName', null

Template.insectItem.events InPlaceEdit.okCancelEvents( "#commonNameInput",
    cancel: ->
      Session.set "editingCommonName", null

    ok: (value) ->
      args =
        id : this._id
        attrs : { commonName: value }
      Session.set "editingCommonName", null
      Meteor.call 'updateInsect', args
  )


Template.insectItem.events InPlaceEdit.okCancelEvents( "#scientificNameInput",
    cancel: ->
      Session.set "editingScientificName", null

    ok: (value) ->
      args =
        id: this._id
        attrs: { scientificName: value }
      Session.set "editingScientificName", null
      Meteor.call 'updateInsect', args
  )


Template.insectItem.events
  'click .destroy' : (event, template) ->
    Meteor.call 'destroyInsect', this._id


Template.insectItem.editingCommonName = ->
  Session.equals 'editingCommonName', this._id


Template.insectItem.editingScientificName = ->
  Session.equals 'editingScientificName', this._id
