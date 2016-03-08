class UserMailer < ApplicationMailer
  default from: "do-not-reply@example.com"

  def contact_email(contact)
    @contact = contact
    Rails.logger.debug "DEBUG: UserMailer: env: " + Rails.env
    #Rails.logger.debug "DEBUG: UserMailer: owner_email: " + Rails.application.secrets.owner_email
    #Rails.logger.debug "DEBUG: UserMailer: contact: " + contact
    mail(to: ENV["OWNER_EMAIL"], from: @contact.email, :subject => "Website Contact") #Rails.application.secrets.owner_email
  end
end
