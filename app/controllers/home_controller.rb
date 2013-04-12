# Home controller.
class HomeController < ApplicationController
  def index
  end

  def profile
  end

  def resume
  end

  def contact
  end


=begin
  def create
    @contact_model = ContactModel.new(:params[:contact_model])
  end
=end

=begin
  def send_email
    contact_model = ContactModel.new(params[:contact_model])
    if (contact_model.valid?)
      redirect_to :acton => :index
    else
      redirect_to :acton => :contact
    end
=end

  # POST /contact_model
  # POST /users.json
  def send_email
    @contact_model = ContactModel.new(params[:contact_model])

    respond_to do |format|
      if @contact_model.valid?
        # Send the contact email out...
        ContactMailer.contact_email(@contact_model).deliver

        format.html { redirect_to({:action => :index}, {notice: 'Your email has been successfully sent.  Thank you!'}) }

        #format.html { redirect_to(@contact_model, notice: 'Email successfully sent.') }
        #format.json { render json: @contact_model, status: :created, location: @contact_model }
      else
        # What to do here?
      end

    end
  end

end
