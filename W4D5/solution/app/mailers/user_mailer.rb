class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: user.username, subject: 'Welcome to 99Cats')
  end
end
