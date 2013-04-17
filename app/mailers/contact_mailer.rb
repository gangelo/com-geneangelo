require 'email_address'

class ContactMailer < ActionMailer::Base

  # @param [Contact] contact
  def contact_email(contact)
    to = contact.to.email_address_with_name unless contact.to.nil? and not contact.to.respond_to?(:email_address_with_name)
    mail(from: contact.from.email_address_with_name,
         to: to,
         subject: contact.subject,
         message: contact.message,
         content_type: contact.content_type,
         cc: contact.cc,
         bcc: contact.bcc)
  end
end
