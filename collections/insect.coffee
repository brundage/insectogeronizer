Insects = new Meteor.Collection("Insect")

if Meteor.isClient
  Meteor.subscribe("insects")


if Meteor.isServer
#  Insects.allow({
#
#    insert: (userId, insect) -> false
#
#    remove: (userId, insects) -> false
#
#  })

  Meteor.publish("insects", () -> Insects.find() )

#  Meteor.methods({
#    newInsect: (args) ->
#      throw new Meteor.Error(403, "You must be logged in") unless this.userId
#      Insects.insert({
#        commonName: args.commonName,
#        creator: this.userId,
#        scientificName: args.scientificName
#      })
#  })
