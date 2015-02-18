class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string "name"
      t.text "description"
      t.integer "price"
      t.boolean "in_stock"
    end
  end
end
