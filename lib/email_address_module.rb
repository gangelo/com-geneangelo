module EmailAddressModule
  attr_accessor :first_name,
                :last_name,
                :email_address

  def has_first_name?
    not @first_name.nil?
  end

  def has_last_name?
    not @last_name.nil?
  end

  def has_email_address?
    not @email_address.nil?
  end

  def email_address_with_name
    "#{@first_name} #{@last_name} <#{@email_address}>"
  end
end