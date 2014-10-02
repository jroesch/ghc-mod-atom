{$, BufferedProcess} = require 'atom'
GhcModView = require './ghc-mod-view'

module.exports =
  ghcModView: null

  activate: (state) ->
    self = this
    @ghcModView = view = new GhcModView(state.ghcModViewState)
    atom.workspaceView.command 'ghc-mod:type', ->
      console.log "Toggled!"

    atom.workspaceView.eachEditorView (editorView) ->
      if editorView.editor.getGrammar().name is "Haskell"
        editorView.command 'ghc-mod:toggle', =>
          editor = editorView.editor
          range = editor.getSelectedBufferRange()
          path = editor.buffer.file.path
          modname = editor.getTitle().replace(".hs", "")
          lineno = range.start.row + 1
          colno = range.start.column + 1
          console.log range
          self.checkType(path, modname, lineno, colno)
      else
        console.log "not in Haskell window"

  deactivate: ->
    @ghcModView.destroy()

  serialize: ->
    ghcModViewState: @ghcModView.serialize()

  # checkSyntax: (filename) ->
    # out = (output) ->
      # console.log output

    # err = (output) ->
      # onsole.log err
      # ghcMod = new BufferedProcess({'ghc-mod', ['check', filename], out, err, exit})

  checkType: (filename, module, lineno, colno) ->
    stdout = (output) ->
      console.log output

    stderr = (err) ->
      console.log err

    exit = ->
      console.log "Process is gone YOLO!"

    command = 'ghc-mod'
    args = ['type', filename, module, lineno, colno]
    console.log args
    ghcMod = new BufferedProcess({command, args, stdout, stderr, exit})
