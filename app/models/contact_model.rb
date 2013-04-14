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

  before_validation :strip_whitespace

  validates_format_of :email_address, :email_address_confirmation, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email_address, :confirmation => true

  attr_accessor :first_name, :last_name, :email_address, :email_address_confirmation,
                :telephone_number, :subject, :message

  attr_reader :property_labels

  validates_each :first_name,
                 :last_name,
                 :email_address,
                 :email_address_confirmation,
                 :subject,
                 :message do |record, attr, value|
    record.errors.add attr, 'is required.' if value.to_s.blank?
  end

  def initialize(options={})
    @email_sent = false

    unless options.nil?
      @first_name = options[:first_name] if options.has_key?(:first_name)
      @last_name = options[:last_name] if options.has_key?(:last_name)
      @email_address = options[:email_address] if options.has_key?(:email_address)
      @email_address_confirmation = options[:email_address_confirmation] if options.has_key?(:email_address_confirmation)
      @telephone_number = options[:telephone_number] if options.has_key?(:telephone_number)
      @subject = options[:subject] if options.has_key?(:subject)
      @message = options[:message] if options.has_key?(:message)
      @email_sent = options[:email_sent] if options.has_key?(:email_sent)
    end
  end

  def email_sent=(value)
    @email_sent = value
  end

  def email_sent?
    @email_sent
  end

  def self.property_labels
    {
        :first_name => 'First Name',
        :last_name => 'Last Name',
        :email_address => 'Email Address',
        :email_address_confirmation => 'Email Address (Confirm)',
        :telephone_number => 'Telephone Number',
        :subject => 'Subject',
        :message => 'Message'
    }
  end

  def persisted?
    false
  end

  private
  def strip_whitespace
    strip @first_name
    strip @last_name
    strip @email_address
    strip @email_address_confirmation
    strip @telephone_number
    strip @subject
    strip @message
  end

  def strip(property)
    property.to_s.strip! if property.respond_to?(:to_s) && property.respond_to?(:strip!)
  end
end