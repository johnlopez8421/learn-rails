class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      Rails.logger.debug "DEBUG: ContactsController: #{@contact}"
      UserMailer.contact_email(@contact).deliver_now
      flash[:notice] = "Message sent from #{@contact.name}."
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
