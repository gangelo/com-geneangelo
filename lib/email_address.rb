require 'email_address_module'

class EmailAddress
  include EmailAddressModule

  def initialize(email_address, first_name=nil, last_name=nil)
    @email_address = email_address
    @first_name = first_name
    @last_name = last_name
  end

end