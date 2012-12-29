Template.currentPage.connectionStatus = () ->
  if Meteor.status().status == "connected" then "" else Meteor.status().status
