class ChangeReadAtInMessages < ActiveRecord::Migration[7.2]
  def change
    change_column_default :messages, :read_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
