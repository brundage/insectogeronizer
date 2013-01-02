Template.listInsects.insects = -> Insects.find()

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

Template.listInsects.rendered = ->
  DocumentTitle.set 'Insects'
