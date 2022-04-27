require 'rails_helper'

RSpec.describe Webhook, type: :model do

  before(:all) do
    @user = User.create(
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "Creates a new webhook if parameters are valid" do
    webhook = @user.webhooks.new(
      topic: "message_created",
      address: "http://localhost:3000/webhooks/message_created"
    )
    expect(webhook.save).to be true
  end

  it "Prevents saving duplicate webhooks under same user" do
    webhook_1 = @user.webhooks.new(
      topic: "message_created",
      address: "http://localhost:3000/webhooks/message_created"
    )

    webhook_1.save

    webhook_2 = @user.webhooks.new(
      topic: "message_created",
      address: "http://localhost:3000/webhooks/message_created"
    )

    expect(webhook_2.save).to be false
  end

  it "Raise error and rollback when topic is missing" do
    webhook = @user.webhooks.new(
      address: "http://localhost:3000/webhooks/message_created"
    )
    expect(webhook.save).to be false
  end

  it "Raise error and rollback when address is missing" do
    webhook = @user.webhooks.new(
      topic: "message_created"
    )
    expect(webhook.save).to be false
  end
end
