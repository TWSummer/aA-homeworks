class User < ApplicationRecord
  attr_reader :password
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  before_validation do
    ensure_session_token
  end
  validates :password, length: { minimum: 6 }, allow_nil: true

#   Write ::find_by_credentials
# This method takes in a username and a password and returns the user that matches
# Write ::generate_session_token
# This is a helper method I like to write that uses SecureRandom::urlsafe_base64 and returns a 16-digit pseudorandom string
# Write #reset_session_token!
# This method resets the user's session_token and saves the user
# Write #ensure_session_token
# This method makes sure that the user has a session_token set, setting one if none exists
# Write #password=
# This method sets @password equal to the argument given so that the appropriate validation can happen
# This method also encrypts the argument given and saves it as this user's password_digest
# Remember: you have to add an attr_reader for password for the validation to occur!


  def self.find_by_credentials(username, password)
    cur_user = User.find_by(username: username)
    pw_digest = BCrypt::Password.new(cur_user.password_digest)
    return cur_user if pw_digest == password
    false
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = nil
    save
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
end
