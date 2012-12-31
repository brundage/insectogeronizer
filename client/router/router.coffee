Meteor.Router.add({

  '/': () ->
    Session.set 'context', null
    '/'

  '/insects': () ->
    Session.set 'context', 'insects'
    'listInsects'
})
