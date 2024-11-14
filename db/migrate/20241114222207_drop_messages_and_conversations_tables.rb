class DropMessagesAndConversationsTables < ActiveRecord::Migration[7.2]
  def change
    drop_table :messages, if_exists: true
    drop_table :conversations, if_exists: true
  end
end
