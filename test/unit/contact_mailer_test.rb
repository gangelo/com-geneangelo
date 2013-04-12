require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  tests ContactMailer
  test "contact_email" do
    contact_model = ContactModel.new(:email_address => 'from@email-address.com',
                                     :subject => 'email subject',
                                     :contact_message => 'email message',
                                     :telephone_number => '(123) 456-7890')

    # Send the email, then test that it got queued
    email = ContactMailer.contact_email(contact_model).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['from@email-address.com'], email.from
    assert_equal ['me@geneangelo.com'], email.to
    assert_equal 'email subject', email.subject
    assert_equal read_fixture('contact_email').join, email.body.to_s
  end
end