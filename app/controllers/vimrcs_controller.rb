class VimrcsController < ApplicationController
  def index
    @vimrcs = Repository.all
  end
end
