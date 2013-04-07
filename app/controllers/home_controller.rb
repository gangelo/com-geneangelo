class HomeController < ApplicationController
  def index
  end

  def profile
  end

  def resume
  end

  def contact
    @contact_model = ContactModel.new
    @contact_model.first_name ='Gene Angelo';
    @contact_model
  end
end
