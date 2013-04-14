# Home controller.
class HomeController < ApplicationController
  def index
  end

  def profile
  end

  def resume
  end

  def contact
    @contact_model ||= ContactModel.new(params[:contact_model])
  end

  # POST /contact_model
  def send_email
    contact_model_params = params[:contact_model]
    @contact_model = ContactModel.new(contact_model_params)

    respond_to do |format|
      if @contact_model.valid?
        # Send the contact email out...
        ContactMailer.contact_email(@contact_model).deliver
        contact_model_params[:email_sent] = true
        format.html { redirect_to({:action => :contact, :contact_model => contact_model_params}, {notice: 'Your email has been successfully sent.  Thank you!'}) }
      else
        contact_model_params[:email_sent] = false
        format.html { redirect_to({:action => :contact, :contact_model => contact_model_params}, {alert: 'Please fill out the required fields.'}) }
      end

    end
  end

end
