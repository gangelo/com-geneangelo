# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ComGeneangelo::Application.initialize!

# Setup ActionMailer on Heroku to use Google smtp
=begin
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    :address  => "smtpout.secureserver.net",
    :port  => 80,
    :domain => "xxxxxx.com",
    :user_name  => "xxxxx",
    :password  => "xxxxxx",
    :authentication  => :plain
}
=end

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
}


# Default to address
ActionMailer::Base.default to: 'Gene M. Angelo, Jr. <me@geneangelo.com>'
