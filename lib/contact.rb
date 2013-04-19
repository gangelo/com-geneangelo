require 'email_module'
require 'telephone_number_module'

class Contact
  include EmailModule
  include TelephoneNumberModule

  def initialize(from, to, subject, message_body, telephone_number=nil, cc=nil, bcc=nil)
    @from = from
    @to = to
    @subject = subject
    @message_body = message_body

    # Params with defaults.
    @telephone_number = telephone_number
    @cc = cc
    @bcc = bcc
  end

  def to_hash
    hash = {}
    self.instance_variables.each { |var| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
    hash
  end
end