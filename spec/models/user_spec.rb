require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "creates new user if record is valid" do
    user = User.new(
      email: "test_user@example.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user.save).to be true
  end

  it "automatically creates unique api key for user when user is created" do
    user = User.create(
      email: "test_user@example.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user.api_key).not_to be nil
  end
end
