class VideosController < ApplicationController

   before_action :authenticate_user!, :except => :index

# update the index page to only show the current user's videos.
  def index
    # @videos = Video.all
    if current_user
    @videos = current_user.videos
    else
    @videos = []
   end
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

# now we need to attach a new video to its creator
# we do this in the controller, right before we save the new video. 
# current_user.id ensures that a user can only create a video for themselves
  def create
    video = Video.new(video_params)
    video.user_id = current_user.id
    video.save
    redirect_to root_path
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to root_path
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :youtube_id)
  end
end
