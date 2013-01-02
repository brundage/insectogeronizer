Insects = new Meteor.Collection I.collections.insects

if Meteor.isClient
  Meteor.subscribe I.subscriptions.insects


_.extend Insects,

  validate : (attrs) ->
    validator = new Validatable(attrs)
    validator.addValidator new PresenceValidator('commonName', 'scientificName')
    validator.addValidator new UniquenessValidator(Insects,'scientificName')
    validator.validate()

  writableAttributes : [ 'commonName', 'scientificName' ]
