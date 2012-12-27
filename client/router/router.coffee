Meteor.Router.add({

  '/': () ->
    Template.currentPage.pageName = 'root'
    '/'

  '/insects': () ->
    Template.currentPage.pageName = 'insects'
    'listInsects'
})

Meteor.Router.to('/')
