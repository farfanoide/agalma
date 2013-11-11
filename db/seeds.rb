# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Branch.create!(name: 'alta sucursal', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, aliquam, magni reiciendis quas voluptatum soluta harum quo dignissimos aut. Veritatis, assumenda distinctio modi dignissimos unde rem enim voluptas consequatur aliquam!')
Branch.create!(name: 'tabajo social', description: 'le faltan cosas donia, nosotro se la conseguimo')
Branch.create!(name: 'mecanica', description: 'le arreglamo el auto donia')

User.create!(name: 'anacleta')
User.create!(name: 'marcela')
User.create!(name: 'veronica')
User.create!(name: 'antonio')

Role.create!(name: 'gil', description: 'es un verdadero gil')
Role.create!(name: 'moderador', description: 'es menos groso')
Role.create!(name: 'admin', description: 'es un groso')