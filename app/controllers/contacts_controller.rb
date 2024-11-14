class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.with(contact: @contact).contact_form_submission.deliver_now
      flash[:notice] = "Your message has been sent successfully."
      UserMailer.reply_email(@contact.email, "Your message has been received.").deliver_now
      redirect_to root_path # Adjust this to where you want to redirect after submission
    else
      flash[:alert] = "There was an error sending your message. Please try again."
      redirect_to root_path # Adjust this to show the form again or where appropriate
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
