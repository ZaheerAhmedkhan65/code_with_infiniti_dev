class CreateLoginHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :login_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :logged_in_at

      t.timestamps
    end
  end
end
