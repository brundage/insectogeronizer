Insects = new Meteor.Collection("insect")

Insects.allow({

  insert: (userId, insect) -> false

  remove: (userId, insects) -> false

  update: (userId, insects, fields, mongo_mods) -> false

})

Meteor.publish("insects", () -> Insects.find({}, { fields: creator: 0}) )

Meteor.methods({
  newInsect: (args) ->
#    throw new Meteor.Error(403, "You must be logged in") unless this.userId
    Insects.insert({
      commonName: args.commonName,
      creator: this.userId,
      scientificName: args.scientificName
    })
})

