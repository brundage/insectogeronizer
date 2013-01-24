ActionStack =
  endIndex : ->
    this.stack.length - 1

  insertAt : (position, callback) ->
    if position > this.endIndex()
      this.lastActionPointer = this.endIndex()
      this.push callback

    else if position <= 0
      this.stack = [ callback ]
      this.lastActionPointer = this.endIndex()

    else
      this.stack = this.stack.slice(0,position - 1)
      this.lastActionPointer = this.endIndex()
      this.push callback

    callback

  lastAction : ->
    this.stack[this.lastActionPointer]

  lastActionPointer : undefined

  nextAction : ->
    this.stack[this.nextActionPointer()]

  nextActionPointer : ->
    this.lastActionPointer + 1

  pop : ->
    callback = this.stack.pop()
    this.lastActionPointer = this.endIndex()
    callback

  push : (callback) ->
    if this.lastActionPointer == this.endIndex() ||
         this.lastActionPointer == undefined
      this.stack.push callback
      this.lastActionPointer = this.endIndex()

    else
      this.insertAt this.lastActionPointer, callback

    callback

  redo : ->
    action = this.nextAction()
    if action?
      this.lastActionPointer++
      action.call()

  stack : []

  undo : ->
    action = this.lastAction()
    if action?
      if this.lastActionPointer > 0
        this.lastActionPointer = this.lastActionPointer - 1
      action.call()
