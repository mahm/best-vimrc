class VimrcsController < ApplicationController
  def index
    @vimrcs = Repository.display_order_by_score
  end

  def update
    @vimrc = Repository.find(params[:id])
    @vimrc = @vimrc.vote(current_user)
    if @vimrc.save
      render :json => @vimrc
    else
      render :json => @event.errors, status: :unprocessable_entity
    end
  end
end
