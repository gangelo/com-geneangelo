class HomeController < ApplicationController
  def index
  end

  def profile
  end

  def resume
  end

  def contact
    @contact_model = ContactModel.new
  end
end
