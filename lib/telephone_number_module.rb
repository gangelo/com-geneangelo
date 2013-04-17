module TelephoneNumberModule
  attr_accessor :telephone_number

  def has_telephone_number?
    not @telephone_number.nil?
  end
end