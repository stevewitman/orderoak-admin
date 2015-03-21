class AddMenugroupsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :menugroups, :string, null: false, default: ""
  end
end
