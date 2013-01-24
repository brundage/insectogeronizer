RecordError = () ->
  this.errors = {}
  this

RecordError.prototype =
  add: (attrName, message) ->
    if this.errors[attrName]?
      this.errors[attrName].push message
    else
      this.errors[attrName] = [message]

  count: (attr) ->
    if attr?
      return this.countErrorsOn(attr)
    else
      c = 0
      for prop of this.errors
        c = c + this.countErrorsOn(prop) if this.errors.hasOwnProperty(prop)
      return c

  countErrorsOn: (attr) ->
    if(attr? && this.errors[attr]?) then this.errors[attr].length else 0

  merge: (other) ->
    for attr of other.errors
      for message in other.errors[attr]
        this.add attr, message
