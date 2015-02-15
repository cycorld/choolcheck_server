class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :klass_id

      t.timestamps
    end
  end
end
