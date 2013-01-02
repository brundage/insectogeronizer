Session.set 'addingJournal', null
Session.set 'addJournalErrors', null


Template.addJournal.controlCallbacks =
  add : ->
    Session.set 'addingJournal', true
    Session.set 'addJournalErrors', null

  cancel : ->
    Session.set 'addingJournal', null
    Session.set 'addJournalErrors', null

  submit : ->
    attrs =
      name : DomUtils.find(document, 'input#journalName').value
    errors = Journal.validate attrs
    Session.set 'addJournalErrors', errors
    unless errors?
      Session.set 'addingJournal', null
      Meteor.call 'newJournal', attrs


Template.addJournal.addingJournal = ->
  Session.get 'addingJournal'
