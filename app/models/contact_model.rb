# ContactModel class for the contacts view.

require 'active_model'

class ContactModel
  extend ActiveModel::Naming
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActionView::Helpers::UrlHelper

  # For before_validation
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  validates_presence_of :first_name, :last_name, :email_address, :email_address_confirmed, :subject, :contact_message
  validates_format_of :email_address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # TODO: validate email and email confirmation.

  before_validation :strip_whitespace

  attr_accessor :first_name, :last_name, :email_address, :email_address_confirmed,
                :telephone_number, :subject, :contact_message

  validates_each :first_name,
                 :last_name,
                 :email_address,
                 :email_address_confirmed,
                 :subject,
                 :contact_message do |record, attr, value|
    record.errors.add attr, 'is required.' if value.to_s.blank?
  end

  def initialize(options={})

    @first_name = options[:first_name] if options.has_key?(:first_name)
    @last_name = options[:last_name] if options.has_key?(:last_name)
    @email_address = options[:email_address] if options.has_key?(:email_address)
    @email_address_confirmed = options[:email_address_confirmed] if options.has_key?(:email_address_confirmed)
    @telephone_number = options[:telephone_number] if options.has_key?(:telephone_number)
    @subject = options[:subject] if options.has_key?(:subject)
    @contact_message = options[:contact_message] if options.has_key?(:contact_message)
  end

  def persisted?
    false
  end

  private
  def strip_whitespace
    strip @first_name
    strip @last_name
    strip @email_address
    strip @email_address_confirmed
    strip @telephone_number
    strip @subject
    strip @contact_message
  end

  def strip(property)
    property.to_s.strip! if property.respond_to?(:to_s) && property.respond_to?(:strip!)
  end
end