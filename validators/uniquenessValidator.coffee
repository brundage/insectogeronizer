class UniquenessValidator extends GenericValidator
  constructor: (klass,attrs...) ->
    this.klass = klass
    this.attrs = attrs

  validate: (record,errors) ->
    this.errors = errors || new RecordError()
    for attr in this.attrs
      query = {}
      query[attr] = record[attr]
      existing = this.klass.findOne query
      this.errors.add(attr, 'must be unique') if existing
    this.errors
