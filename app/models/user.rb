class User < ApplicationRecord
  include UserConcern

  has_many :messages
  has_many :webhooks
  has_many :scheduled_webhooks

  before_create :assign_api_key

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
