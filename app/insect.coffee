Insect = new Meteor.Collection('Insect')

if Meteor.isServer
  Meteor.publish('insects', () -> Insect.find() )


if Meteor.isClient
  Meteor.subscribe('insects')
