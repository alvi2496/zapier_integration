class CreateScheduledWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :scheduled_webhooks do |t|
      t.belongs_to :user
      t.belongs_to :webhook
      t.string :object_class
      t.integer :object_id
      t.integer :status, default: 0
      t.integer :deliveries, default: 0
      t.datetime :next_retry_at
      t.timestamps
    end
  end
end
