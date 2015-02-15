class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :picture_id
      t.integer :user_id
      t.string :coordinate
      t.text :note
      t.integer :status

      t.timestamps
    end
  end
end
