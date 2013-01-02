Template.listJournals.journals = -> Journals.find()

Template.listJournals.rendered = ->
  DocumentTitle.set 'Journals'

