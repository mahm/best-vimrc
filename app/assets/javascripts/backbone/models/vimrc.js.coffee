class BestVimrc.Models.Vimrc extends Backbone.Model
  paramRoot: 'vimrc'

  defaults:
    vote_count: null
    url: null
    username: null
    homepage: null
    name: null
    description: null
    watchers: null
    followers: null
    forks: null
    repos_created_at: null
    repos_pushed_at: null

class BestVimrc.Collections.VimrcsCollection extends Backbone.Collection
  model: BestVimrc.Models.Vimrc
  url: '/vimrcs'
