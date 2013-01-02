class PresenceValidator extends GenericValidator
  present: (value) ->
    return false unless value?
    if typeof value == 'string'
      return false if value.length == 0
    true

  validate: (record,errors) ->
    this.errors = errors || new RecordError()
    for attr in this.attrs
      this.errors.add(attr, 'must be present') unless this.present record[attr]
    this.errors
