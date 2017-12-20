ActiveRecord::Base.transaction do
  #Destroy all entities in the database

  Review.destroy_all
  Issue.destroy_all
  Product.destroy_all
  Customer.destroy_all

  #Create some customers

  jakub = Customer.create(first_name: 'Jakub', last_name: 'Oblizajek', username: 'philogic',
                          email: 'jakub@example.com', password: 'anypassword')
  peter = Customer.create(first_name: 'Peter', last_name: 'Black', username: 'pblack',
                          email: 'peter@example.com', password: 'anypassword')
  patricia = Customer.create(first_name: 'Patricia', last_name: 'Churchland', username: 'chland',
                          email: 'patricia@example.com', password: 'anypassword')

  #...some products

  wolfen = Product.create(name: 'Wolfenstein', code: 'WLFN', category: 'shooter')
  zombies = Product.create(name: 'Age Of Zombies', code: 'AOZB', category: 'rpg')
  larry = Product.create(name: 'Lounge Larry 2016', code: 'LL16', category: 'arcade')

  #Time for dependent elements. Reviews first:

  Review.create(customer: jakub, product: larry, rating: 4, comment: 'That was a scary experience!')
  Review.create(customer: patricia, product: wolfen, rating: 5, comment: 'Very good game!')
  Review.create(customer: peter, product: zombies, rating: 3, comment: 'Not as sleek as I remember. :-(')

  #...finally let's put some issues

  Issue.create(customer: patricia, product: zombies, severity: 'cosmetic', comment: 'Pixelation at the top corner of the screen')
  Issue.create(customer: peter, product: larry, severity: 'major', comment: 'I can not open door at level 4!')

end
