Journals = new Meteor.Collection I.collections.journals

if Meteor.isClient
  Meteor.subscribe I.subscriptions.journals

_.extend Journals,

  validate : (attrs) ->
    validator = new Validatable(attrs)
    validator.addValidator new PresenceValidator('name')
    validator.addValidator new UniquenessValidator(Journals,'name')
    validator.validate()


  writableAttributes : [ 'name' ]
