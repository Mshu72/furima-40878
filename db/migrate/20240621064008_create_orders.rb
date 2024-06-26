class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :item,   null: false, foreign_key: true, type: :bigint
      t.references :user,    null: false, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end
