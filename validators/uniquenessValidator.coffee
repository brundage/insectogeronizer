class UniquenessValidator extends GenericValidator

  validate: (record,errors) ->
    this.errors = errors || new RecordError()
    for attr in this.attrs
      this.errors.add(attr, 'must be present') unless this.present record[attr]
    this.errors
