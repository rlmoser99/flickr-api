class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    return if photo_params.empty?

    begin
      flickr = Flickr.new ENV['flickr_key'], ENV['flicker_secret']
      @photos = flickr.photos.search(user_id: photo_params[:flickr_id])
    rescue StandardError => e
      flash[:alert] = "#{e.message}. So please try a different one."
      redirect_to root_path
    end
  end

  private

  def photo_params
    params.permit(:flickr_id)
  end
end
