require "fileutils"

class ApplicationController < ActionController::Base
  layout 'application'

  protect_from_forgery

  before_filter :set_title
  before_filter :set_contact_email
  before_filter :set_background_image
  before_filter :set_view_last_modified_date

  private

  # Sets the site-wide title.
  def set_title
    @title = 'Gene M. Angelo, Jr.'
  end

  # Sets the site-wide contact email.
  def set_contact_email
    @contact_email = 'public(dot)gma(at)gmail(dot)com'
  end

  # Sets the background image.
  def set_background_image
    image_index = rand(0..3)

    @background_image = 'background-' + image_index.to_s + '-top.jpg'
    @background_image_blur = 'background-' + image_index.to_s + '-top-blur.jpg'

    @background_image_bottom = 'background-' + image_index.to_s + '-bottom.jpg'
    @background_image_blur_bottom = 'background-' + image_index.to_s + '-bottom-blur.jpg'
  end

  # Gets the last updated date for the view relating to the current action.
  def set_view_last_modified_date
    date_format = '%-m/%-d/%Y'

    @template_path = lookup_context.find_template("#{controller_path}/#{action_name}").identifier
    File.exists? @template_path ?
                     @view_last_modified_date = File.mtime(@template_path).strftime(date_format) :
                     @view_last_modified_date = DateTime.new(:month => 1, :day => 1, :year => 2013).strftime(date_format)
  end
end
