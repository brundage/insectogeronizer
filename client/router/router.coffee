Meteor.Router.add

  '/': ->
    DocumentTitle.set(null)
    '/'

  '/insects': ->
    'listInsects'

  '/journals': ->
    'listJournals'
