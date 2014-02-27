{EditorView, View} = require 'atom'

module.exports =
class GhcModView extends View
  @content: ->
    @div class: 'ghc-mod overlay from-top', =>
      @div "The GhcMod package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "ghc-mod:toggle", => @toggle()
    foo = this
    atom.workspaceView.eachEditorView (editorView) =>
      editorView.command "ghc-mod:toggle", (e) =>
        console.log("FOOBAR")

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "GhcModView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
