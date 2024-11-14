class CreateAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.string :subject
      t.string :week_number
      t.date :due_date
      t.string :related_link

      t.timestamps
    end
  end
end
