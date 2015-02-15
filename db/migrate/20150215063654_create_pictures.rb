class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :album_id

      t.timestamps
    end
  end
end
