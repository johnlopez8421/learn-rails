class UserMailer < ApplicationMailer
  default from: "do-not-reply@example.com"

  def contact_email(contact)
    @contact = contact
    Rails.logger.debug "DEBUG: env: " + Rails.env
    Rails.logger.debug "DEBUG: owner_email: " + Rails.application.secrets.owner_email
    Rails.logger.debug "DEBUG: contact: " + @contact
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, :subject => "Website Contact")
  end
end
