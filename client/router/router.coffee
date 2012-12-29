setTitle = (title) ->
  if title
    document.title = title + " -- Insectogeronizer"
  else
    document.title = "Insectogeronizer"

Meteor.Router.add({

  '/': () ->
    Template.currentPage.pageName = 'root'
    setTitle()
    '/'

  '/insects': () ->
    Template.currentPage.pageName = 'insects'
    setTitle("List Insects")
    'listInsects'
})

setTitle()
Meteor.Router.to('/')
