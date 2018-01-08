require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(email: "user@hotmail.com", password: "password")}

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "should return false for incorrect password" do
      expect(user.is_password?("not_password")).to be false
    end

    it "should return true for correct password" do
      expect(user.is_password?("password")).to be true
    end
  end

  describe "#reset_session_token!" do
    it "resets users session token" do
      token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(token)
    end
  end

  describe "::find_by_credentials" do
    before(:example) { user.save }
    it "should find a user by credentials" do
      expect(User.find_by_credentials(email: "user@hotmail.com", password: "password")).to eq(user)
    end

    it "should return nil when no user is found" do
      expect(User.find_by_credentials(email: "user@gmail.com", password: "password")).to be nil
    end

    it "should return nil when the password is incorrect" do
      expect(User.find_by_credentials(email: "user@hotmail.com", password: "not_password")).to be nil
    end
  end
end
