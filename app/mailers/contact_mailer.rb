require 'email_address'

class ContactMailer < ActionMailer::Base

  attr_accessor :from,
                :to,
                :subject,
                :message,
                :telephone_number,
                :cc,
                :bcc

  # @param [Contact] contact
  def contact_email(contact)
    initialize_instance_vars(contact)
    #to = contact.to.email_address_with_name unless contact.to.nil? and not contact.to.respond_to?(:email_address_with_name)
    #to ||= ActionMailer::Base.default[:to]
=begin
    mail(from: contact.from.email_address_with_name,
         to: to,
         subject: contact.subject,
         message: contact.message,
         cc: contact.cc,
         bcc: contact.bcc)
=end
    mail(from: @from,
         to: @to,
         subject: @subject,
         message: @message,
         cc: @cc,
         bcc: @bcc)
  end

  protected

  def initialize_instance_vars(object)
    attributes = object.to_hash if object.respond_to?(:to_hash)

    unless attributes.nil?
      attributes.each do |name, value|
        send("#{name}=", value)
      end

      @from = @from.email_address_with_name unless @from.nil? and not @from.respond_to?(:email_address_with_name)
    end

    @to = @to.email_address_with_name unless @to.nil? and not @to.respond_to?(:email_address_with_name)
    @to ||= ActionMailer::Base.default[:to]
  end
end
