class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      Rails.logger.debug "DEBUG: ContactsController: #{@contact}"
      Rails.logger.debug "DEBUG: ContactsController: MC API KEY:" + ENV["MAILCHIMP_API_KEY"]
      #Rails.logger.debug "DEBUG: ContactsController: contact.name: #{@contact.name}"
      #UserMailer.contact_email(@contact).deliver_now
      #flash[:notice] = "Message sent from #{@contact.name}."
      #Rails.logger.debug "DEBUG: ContactsController: done"
      redirect_to root_path
    else
      Rails.logger.debug "DEBUG: ContactsController: not valid"
      render :new
    end
  end

  private
  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
