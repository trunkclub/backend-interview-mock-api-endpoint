(1..5000).to_a.map do |num|
  Shirt.create!(
    availability: (0..10).to_a.sample(3).join(','),
    name: "#{num}",
    price: "#{num}",
    sku: "#{num}",
    size: "#{num}",
    color: ['red', 'blue', 'green'].sample
  )
end

(1..5000).to_a.map do |num|
  Shoe.create!(
    availability: (0..10).to_a.sample(3).join(','),
    name: "#{num}",
    price: "#{num}",
    sku: "#{num}",
    size: "#{num}",
    color: ['red', 'blue', 'green'].sample,
    category: ['clog', 'sneaker', 'heels', 'dress'].sample.to_s
  )
end
