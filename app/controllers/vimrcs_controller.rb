class VimrcsController < ApplicationController
  def index
    @vimrcs = Repository.display_with_vote_count
  end

  def update
    Rails.logger.info params
    @vimrc = Repository.find(params[:id])
    @vimrc = @vimrc.vote(current_user)
    Rails.logger.info @vimrc
    if @vimrc.save
      render :json => @vimrc
    else
      render :json => @event.errors, status: :unprocessable_entity
    end
  end
end
