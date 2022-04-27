require 'rails_helper'

RSpec.describe Message, type: :model do

  before(:all) do
    @user = User.create(
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "Creates new message if the body is provided" do
    message = @user.messages.new(
      body: "Test message body"
    )
    expect(message.save).to be true
  end

  it "Raise error if message body is not provided" do
    message = @user.messages.new
    expect(message.save).not_to be true
  end

end
