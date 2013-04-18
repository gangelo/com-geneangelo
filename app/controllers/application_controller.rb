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
    @contact_email = 'me(at)geneangelo(dot)com'
  end

  # Sets the background image.
  def set_background_image
    random = Random.new
    image_index = random.rand(0..4)

    @background_image = 'background-' + image_index.to_s + '-top.jpg'
    @background_image_blur = 'background-' + image_index.to_s + '-top-blur.jpg'

    @background_image_bottom = 'background-' + image_index.to_s + '-bottom.jpg'
    @background_image_blur_bottom = 'background-' + image_index.to_s + '-bottom-blur.jpg'
  end

  # Gets the last updated date for the view relating to the current action.
  def set_view_last_modified_date
    date_format = '%-m/%-d/%Y'

    @view_last_modified_date = DateTime.new(2013, 1, 1).strftime(date_format)

    template_name = lookup_context.find_template("#{controller_path}/#{action_name}")
    unless template_name.nil?
      @template_path = template_name.identifier
      File.exists? @template_path ?
                       @view_last_modified_date = File.mtime(@template_path).strftime(date_format) :
                       @view_last_modified_date
    end
  end
end
