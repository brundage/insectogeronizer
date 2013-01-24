class Validatable
  constructor: (@attrs) ->
    this.validators = []
    this

  addValidator: (validator) ->
    this.validators.push validator

  isValid: () ->
    this.validate()
    this.errors.count() == 0

  setAttributes: (attrs) ->
    this.attrs = attrs
    attrs

  validate: () ->
    this.errors = new RecordError()
    for validator in this.validators
      this.errors.merge validator.validate this.attrs
    this.errors
