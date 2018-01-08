require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create( email: Faker::Internet.email,
                 password: "password")
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "returns true if password is correct" do
      expect(user.is_password?("password")).to eq(true)
    end

    it "returns false if password is incorrect" do
      expect(user.is_password?("notpassword")).to eq(false)
    end
  end
end
