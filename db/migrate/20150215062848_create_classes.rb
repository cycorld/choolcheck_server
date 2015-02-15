class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :title
      t.text :description
      t.string :admin

      t.timestamps
    end
  end
end
