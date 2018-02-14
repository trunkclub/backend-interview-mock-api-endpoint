class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.boolean     :available
      t.text        :name
      t.string      :price
      t.string      :sku
      t.string      :size
      t.string      :category
      t.string      :color
      t.timestamps  null: false
    end
  end
end
