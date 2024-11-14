class DropHelpRequestsTable < ActiveRecord::Migration[7.2]
  
  def change
    drop_table :help_requests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  
end
