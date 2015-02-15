class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :title
      t.text :description
      t.string :admin

      t.timestamps
    end
  end
end
