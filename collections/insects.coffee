Insects = new Meteor.Collection I.collections.insects

if Meteor.isClient
  Meteor.subscribe I.subscriptions.insects


_.extend Insects,

  validate : (attrs) ->
    if this.validator?
      this.validator.setAttributes attrs
    else
      this.validator = new Validatable(attrs)
      this.validator.addValidator new PresenceValidator('commonName', 'scientificName')
      this.validator.addValidator new UniquenessValidator(Insects,'scientificName')
    this.validator.validate()

  writableAttributes : [ 'commonName', 'scientificName' ]
