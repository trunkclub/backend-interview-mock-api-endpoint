require "sinatra"
require "sinatra/activerecord"
require 'json'
require './shirt'
require './shoe'

set :database, "sqlite3:products.sqlite3"

# Return shirts or shoes
# Return products filtered on availability
# Group products by color and number of items of that color
# Page should display color and item count IE: [{"green":4518,"red":4622,"blue":4472}]

#<Shoe id: 2776, availability: "9,5,6", name: "2776", price: "2776", sku: "2776", size: "2776", category: "clog", color: "blue", created_at: "2018-02-14 21:14:14", updated_at: "2018-02-14 21:14:14">
#<Shirt id: 1, availability: "5,4,7", name: "1", price: "1", sku: "1", size: "1", color: "green", created_at: "2018-02-14 21:14:00", updated_at: "2018-02-14 21:14:00">

get '/products/:type' do
  type = params['type']

  if  params['available'] == "true"
    filter_available = true
  else
    filter_available = false
  end

  shirts_to_return = []
  shoes_to_return = []

  Shoe.all.each do |shoe|
    shoe.availability.split(',').each do |quantitiy|
      if filter_available
        if quantitiy.to_i > 0
          shoes_to_return << shoe
        end
      else
        if quantitiy.to_i == 0
          shoes_to_return << shoe
        end
      end
    end
  end

  Shirt.all.each do |shirt|
    shirt.availability.split(',').each do |quantitiy|
      if filter_available
        if quantitiy.to_i > 0
          shirts_to_return << shirt
        end
      else
        if quantitiy.to_i == 0
          shirts_to_return << shirt
        end
      end
    end
  end

  shirts_to_return = shirts_to_return.group_by do |shirt|
    shirt.color
  end

  shoes_to_return = shoes_to_return.group_by do |shoe|
    shoe.color
  end

  products_to_return = type == 'shoes' ? shoes_to_return : shirts_to_return

  color_and_product_count = products_to_return.each_with_object({}) do |grouped_products, hash|
    color = grouped_products[0]
    products = grouped_products[1]
    hash[color] = products.count
  end

  return [color_and_product_count, products_to_return].to_json
end
