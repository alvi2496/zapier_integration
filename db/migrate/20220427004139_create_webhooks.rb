class CreateWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks do |t|
      t.belongs_to :user
      t.integer :topic
      t.string :address
      t.timestamps
    end

    add_index :webhooks, [:user_id, :topic], unique: true
  end
end
