GhcModView = require './ghc-mod-view'

module.exports =
  ghcModView: null

  activate: (state) ->
    @ghcModView = new GhcModView(state.ghcModViewState)

  deactivate: ->
    @ghcModView.destroy()

  serialize: ->
    ghcModViewState: @ghcModView.serialize()
