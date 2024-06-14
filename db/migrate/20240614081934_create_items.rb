class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title, presence: true
      t.text :detale, presence: true
      t.integer :price, presence: true
      t.references :user, null: false, foreign_key: true
      t.integer :category_id, presence: true
      t.integer :prefecture_id, presence: true
      t.integer :shipping_fee_id, presence: true
      t.integer :delivery_scheduled_id, presence: true
      t.integer :status_id, presence: true
      t.timestamps
    end
  end
end
