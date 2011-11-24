class VimrcsController < ApplicationController
  before_filter :authorized?, :only => :update

  def index
    sort_type = params[:sort]
    if sort_type.nil? || sort_type == "score"
      @vimrcs = Repository.display_order_by_score
    elsif sort_type == "pushed-at"
      @vimrcs = Repository.display_order_by_pushed_at
    else
      @vimrcs = Repository.display_order_by_score
    end
    respond_to do |format|
        format.html
        format.json { render json: @vimrcs }
    end
  end

  def update
    @vimrc = Repository.find(params[:id])
    return render :json => nil, status: :bad_request if @vimrc.voted?(current_user)

    @vimrc = @vimrc.vote(current_user)
    if @vimrc.save
      render :json => @vimrc
    else
      render :json => @event.errors, status: :unprocessable_entity
    end
  end

private
  def authorized?
    render :json => nil, status: :unauthorized unless current_user
  end
end
