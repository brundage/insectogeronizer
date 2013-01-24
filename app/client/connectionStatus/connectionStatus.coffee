Template.connectionStatus.status = () ->
  status = Meteor.status().status
  return "reconnecting"  if status == "connecting" 
  return "disconnected"  if status == "waiting" 
  # return if status == "connected"

Template.connectionStatus.connected = () -> Meteor.status().connected
