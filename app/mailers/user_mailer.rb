class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def signup_confirmation(user)
      @user = user
      @greeting = "Hi"
      mail to: user.email, subject: "Thank You for Signing up...."
  end
end
