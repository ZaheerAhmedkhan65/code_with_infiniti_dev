class UserMailer < ApplicationMailer
    default from: "ranazaheerahmed65@example.com"

    def reply_email(user_email, message)
      @message = message
      mail(to: user_email, subject: "Reply to Your Contact Us Message")
    end
end
