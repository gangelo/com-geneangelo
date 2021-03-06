# Contact controller
class ContactController < ApplicationController
  def new
    @contact_model = ContactModel.new(params[:contact_model])
  end

  def create
    contact_model_params = params[:contact_model]

    # Can only come from a post.
    if contact_model_params.nil?
      redirect_to action: :new
      return
    end

    @contact_model = ContactModel.new(contact_model_params)

    if @contact_model.valid?
      # Send the contact email out...
      from = EmailAddress.new(@contact_model.email_address, @contact_model.first_name, @contact_model.last_name)
      subject = @contact_model.subject
      message = @contact_model.message
      telephone_number = @contact_model.telephone_number
      contact = Contact.new(from, nil, subject, message, telephone_number)

      begin
        ContactMailer.contact_email(contact).deliver
      rescue Timeout::Error
        flash.now[:error] = "Yikes! Error sending email. A Timeout occurred.  Please try again later."
        render :new
      rescue Net::SMTPAuthenticationError,
          Net::SMTPServerBusy,
          Net::SMTPSyntaxError,
          Net::SMTPFatalError,
          Net::SMTPUnknownError
        flash.now[:error] = "Yikes! There was a problem sending your mail."
        render :new
      rescue Exception
        flash.now[:error] = "Yikes! There was a problem sending your mail: An unexpected error occurred."
        render :new
      else
        redirect_to root_path, {notice: "Yippie! Your email's on it's way!  Thank you!"}
      end
    else
      # TODO: The below is to handle a bug that doesn't display notices when render is used.
      # See http://stackoverflow.com/questions/4770762/how-to-render-edit-view-and-post-flash-message-in-rails3
      flash.now[:alert] = "Oops! we couldn't send your email.  Are you missing something?"
      render :new
    end
  end
end
