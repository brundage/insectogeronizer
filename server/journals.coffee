Meteor.publish I.subscriptions.journals, () -> Journals.find({}, { fields: creator: 0})

Journals.allow

  insert: (userId, journal) -> false

  remove: (userId, journal) -> true

  update: (userId, journal, fields, mongo_mods) -> false

Meteor.methods
  destroyJournal: (id) ->
#    throw new Meteor.Error(403, "You must be logged in") unless this.userId
    Journals.remove id
  
  newJournal: (args) ->
#    throw new Meteor.Error(403, "You must be logged in") unless this.userId
    errors = Journals.validate args
    unless errors
      Journals.insert
        name: args.name,
        creator: this.userId,

  updateJournal: (args) ->
#    throw new Meteor.Error(403, "You must be logged in") unless this.userId
    selector =
      _id : args.id
    updates = _.pick args.attrs, Journals.writableAttributes
    Journals.update selector, { $set: updates }, args.options, args.callback
