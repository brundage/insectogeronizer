DocumentTitle = {

  contexts: new Meteor.deps._ContextSet()

  get: ->
    this.contexts.addCurrentContext()
    this.title

  set: (value) ->
    if value != this.title
      this.title = value
      this.contexts.invalidateAll()

  title:  ""

}


Meteor.startup ->
  Meteor.autorun renderDocumentTitle


Template.pageTitle.title = ->
  DocumentTitle.get()


renderDocumentTitle = ->
  if DocumentTitle.get()
    document.title = DocumentTitle.get() + " -- Insectogeronizer"
  else
    document.title = "Insectogeronizer"
