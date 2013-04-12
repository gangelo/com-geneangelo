class ContactMailer < ActionMailer::Base
  default from: "me@geneangelo.com"
  default to: "me@geneangelo.com"
  default subject: "You've received an email from www.geneangelo.com."

  def contact_email(model)
    if (model.is_a? ContactModel)
      #mail(to: :to, subject: :subject, from: model.email_address)
      mail(from: model.email_address, subject: model.subject)
    end
  end
end
