class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :repository_link
      t.string :page_link
      t.string :phone

      t.timestamps
    end
  end
end
