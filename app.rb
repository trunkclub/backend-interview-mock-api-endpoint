require "sinatra"
require "sinatra/activerecord"
require 'json'
require './shirt'
require './shoe'

set :database, "sqlite3:products.sqlite3"

# Return shirts or shoes
# Return products filtered on true or false availability
# Group products by color
get '/products/:type' do
  type = params['type']

  if  params['available'] == "true"
    filter_available = true
  else
    filter_available = false
  end

  shirts_to_return = []
  shoes_to_return = []

  if type == 'shoes'
    Shoe.all.each do |shoe|
      if shoe.available == filter_available
        shoes_to_return << shoe
      end
    end
  else
    Shirt.all.each do |shirt|
      if shirt.available == filter_available
        shirts_to_return << shirt
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

  return products_to_return.to_json
end
