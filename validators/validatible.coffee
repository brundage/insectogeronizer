class Validatable
  constructor: (@attrs) ->
    this.validators = []
    this

  addValidator: (validator) ->
    this.validators.push validator

  isValid: (errors) ->
    this.validate(errors)
    this.errors.count() == 0

  validate: (errors) ->
    this.errors = errors || new RecordError()
    for validator in this.validators
      this.errors.merge validator.validate this.attrs
    this.errors
