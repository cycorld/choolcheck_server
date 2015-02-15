class CreateClassbooks < ActiveRecord::Migration
  def change
    create_table :classbooks do |t|
      t.integer :klass_id
      t.integer :user_id

      t.timestamps
    end
  end
end
