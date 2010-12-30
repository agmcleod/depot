ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "your.host.name",
  :user_name            => "name",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}