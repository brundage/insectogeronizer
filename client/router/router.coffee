Meteor.Router.add

  '/': ->
    Session.set 'showAddForm', null
    'listInsects'

  '/journals': ->
    Session.set 'showAddForm', null
    'listJournals'
