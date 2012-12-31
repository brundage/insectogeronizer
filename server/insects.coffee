Insects = new Meteor.Collection I.collections.insects

Meteor.publish I.subscriptions.insects, () -> Insects.find({}, { fields: creator: 0})

Insects.allow({

  insert: (userId, insect) -> false

  remove: (userId, insects) -> false

  update: (userId, insects, fields, mongo_mods) -> false

})

Meteor.methods
  newInsect: (args) ->
#    throw new Meteor.Error(403, "You must be logged in") unless this.userId
    Insects.insert
      commonName: args.commonName,
      creator: this.userId,
      scientificName: args.scientificName

  updateInsect: (args) ->
#    throw new Meteor.Error(403, "You must be logged in") unless this.userId
    selector =
      _id : args.id
    updates = _.pick args.attrs, 'commonName', 'scientificName'
    Insects.update selector, { $set: updates }, args.options, args.callback
