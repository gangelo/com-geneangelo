require 'email_module'
require 'telephone_number_module'

class Contact
  include EmailModule
  include TelephoneNumberModule

  def initialize(from, to, subject, message, content_type="text/html", telephone_number=nil, cc=nil, bcc=nil)
    @from = from
    @to = to
    @subject = subject
    @message = message

    # Params with defaults.
    @content_type = content_type
    @telephone_number = telephone_number
    @cc = cc
    @bcc = bcc
  end
end