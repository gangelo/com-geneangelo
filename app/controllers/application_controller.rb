class ApplicationController < ActionController::Base
  layout 'application'

  protect_from_forgery

  before_filter :set_title
  before_filter :set_background_image

  private
  def set_title
    @title = 'Gene M. Angelo, Jr.'
  end

  def set_background_image()
    image_index = rand(0..4)
    @background_image = 'background-' + image_index.to_s + '.jpg'
    @background_image_blur = 'background-' + image_index.to_s + '-blur.jpg'
    # FileTest.exists?("#{@document.name}")
  end
end
