class GenericValidator
  constructor: ->
    this.attrs = arguments

  validate: (record,errors) ->
    throw 'subclasses must implement validate'
