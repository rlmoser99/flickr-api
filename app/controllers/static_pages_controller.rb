class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new ENV['flickr_key'], ENV['flicker_secret']
    @picture = flickr.photos.getInfo(:photo_id => "3839885270")
  end
end
