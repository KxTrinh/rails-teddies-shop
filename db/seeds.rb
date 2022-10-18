puts 'Cleaning database...'
Teddy.destroy_all
Category.destroy_all

puts 'Creating categories...'
geek = Category.create!(name: 'geek')
kids = Category.create!(name: 'kids')

puts 'Creating teddies...'
Teddy.create!(price: 10, sku: 'original-teddy-bear', name: 'Teddy bear', category: kids, photo_url: 'https://www.yarnplaza.fr/resize/teddy_2_2.jpg/0/1100/True/t-e-teddy-2.jpg')

Teddy.create!(price_cents: 950, sku: 'jean-mimi', name: 'Jean-Michel - Le Wagon', category: geek, photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large')
Teddy.create!(price: 12, sku: 'octocat',   name: 'Octocat -  GitHub',      category: geek, photo_url: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/suzumidokoro/20160413/20160413220730.jpg')
puts 'Finished!'
