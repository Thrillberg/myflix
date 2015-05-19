class ReviewsController < ApplicationController
  def create
    video = Video.find(params[:video_id])
    video.reviews.create(params[:review].merge!(user: current_user))
    redirect_to video
  end

end