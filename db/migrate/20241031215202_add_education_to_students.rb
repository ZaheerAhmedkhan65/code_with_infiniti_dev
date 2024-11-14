class AddEducationToStudents < ActiveRecord::Migration[7.2]
  def change
    add_column :students, :education, :string
  end
end
