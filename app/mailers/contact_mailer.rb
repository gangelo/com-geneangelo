require 'email_address'

class ContactMailer < ActionMailer::Base

  attr_accessor :from,
                :to,
                :subject,
                :message_body,
                :telephone_number,
                :cc,
                :bcc

  # @param [Contact] contact
  def contact_email(contact)
    initialize_instance_vars(contact)
    mail(from: @from,
         to: @to,
         subject: @subject,
         message: @message_body,
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
