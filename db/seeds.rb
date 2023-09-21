# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'test@test',
  password: 'testtest'
  )
  
Order.create!(
  customer_id: '1',
  payment_method: 'transfer',
  postage: '800',
  billing_amount: '1000',
  status: 'unpaid',
  zip_code: '111-1111',
  shipping_address: '日本',
  shipping_name: '平成太郎'
  )
#   Character.create(name: 'Luke', movie: movies.first)
