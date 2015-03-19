class CreateMenuitems < ActiveRecord::Migration
  def change
    create_table :menuitems do |t|
      t.belongs_to :store
      t.string :menugroup
      t.string :name
      t.text :description
      t.integer :price
      t.boolean :in_stock
      t.string :photo
      t.integer :position
    end
  end
end
