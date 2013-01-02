Journals = new Meteor.Collection I.collections.journals

if Meteor.isClient
  Meteor.subscribe I.subscriptions.journals

_.extend Journals,

  validate : (attrs) ->
    unless this.validator?
      this.validator = new Validatable(attrs)
      this.validator.addValidator new PresenceValidator('name')
      this.validator.addValidator new UniquenessValidator(Journals,'name')
    this.validator.validate()


  writableAttributes : [ 'name' ]
