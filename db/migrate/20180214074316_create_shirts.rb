class CreateShirts< ActiveRecord::Migration
  def change
    create_table :shirts do |t|
      t.boolean     :available
      t.text        :name
      t.string      :price
      t.string      :sku
      t.string      :size
      t.string      :color
      t.timestamps  null: false
    end
  end
end
