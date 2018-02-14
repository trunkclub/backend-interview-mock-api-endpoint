(1..100).to_a.map do |num|
  Shirt.create!(
    available: [true, false].sample,
    name: "#{num}",
    price: "#{num}",
    sku: "#{num}",
    size: "#{num}",
    color: ['red', 'blue', 'green'].sample
  )
end

(1..100).to_a.map do |num|
  Shoe.create!(
    available: [true, false].sample,
    name: "#{num}",
    price: "#{num}",
    sku: "#{num}",
    size: "#{num}",
    color: ['red', 'blue', 'green'].sample,
    category: ['clog', 'sneaker', 'heels', 'dress'].sample.to_s
  )
end
