class ContactMailer < ApplicationMailer
    default from: 'your_email@example.com' 
  
    def contact_form_submission
      @contact = params[:contact]
      mail(to: 'ranazaheerahmed65@gmail.com', subject: 'New Contact Form Submission')
    end
  end
  