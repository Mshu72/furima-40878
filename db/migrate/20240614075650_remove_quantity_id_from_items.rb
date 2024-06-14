class RemoveQuantityIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :quantity_id, :integer
  end
end
