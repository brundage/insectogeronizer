Insects = new Meteor.Collection I.collections.insects

if Meteor.isClient
  Meteor.subscribe I.subscriptions.insects


_.extend Insects,

  validate : (attrs) ->
    errors =
      commonName : []
      scientificName : []

    errors.commonName.push 'must be present' unless attrs.commonName?

    errors.scientificName.push 'must be present' unless attrs.scientificName?

    existing = this.findOne { scientificName : attrs.scientificName }
    errors.scientificName.push 'must be unique' if existing?

    _.each  _.pairs(errors), (pair,index,list) ->
      key = pair[0]
      value = pair[1]
      delete errors[key] if _.isEmpty value

    unless _.isEmpty(errors)
      errors

  writableAttributes : [ 'commonName', 'scientificName' ]
