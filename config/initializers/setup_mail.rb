ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "your.host.name",
  :user_name            => "sircoolguy99",
  :password             => "k0enigs3gg",
  :authentication       => "plain",
  :enable_starttls_auto => true
}