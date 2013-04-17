require 'test_helper'
require 'contact'
require 'email_address'

class ContactMailerTest < ActionMailer::TestCase
  tests ContactMailer
  test "contact_email text/html" do
    from = EmailAddress.new("from@from.com", "From", "Email")
    to = EmailAddress.new("to@to.com", "To", "Email")
    subject = "Email Subject"
    message = "Email Message"
    contact = Contact.new(from, to, subject, message, "text/html")

    # Send the email, then test that it got queued
    email = ContactMailer.contact_email(contact).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [from.email_address], email.from
    assert_equal [to.email_address], email.to
    assert_equal subject, email.subject
    assert_equal read_fixture('contact_email').join, email.body.to_s
  end

  test "contact_email text/plain" do
    from = EmailAddress.new("from@from.com", "From", "Email")
    to = EmailAddress.new("to@to.com", "To", "Email")
    subject = "Email Subject"
    message = "Email Message"
    contact = Contact.new(from, to, subject, message, "text/plain")

    # Send the email, then test that it got queued
    email = ContactMailer.contact_email(contact).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [from.email_address], email.from
    assert_equal [to.email_address], email.to
    assert_equal subject, email.subject
    assert_equal read_fixture('contact_email').join, email.body.to_s
  end
end