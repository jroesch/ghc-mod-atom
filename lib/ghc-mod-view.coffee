{EditorView, View} = require 'atom'

module.exports =
class GhcModView extends View
  @content: ->
    @div class: 'ghc-mod overlay from-top', =>
      @div "The GhcMod package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: (text) ->
    console.log "GhcModView was toggled!"
    console.log text

    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
