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

_pass = "12345678"
User.create!(name: 'anacleta', email: 'anacleta@esta.com', password: _pass)
User.create!(name: 'marcela', email: 'marcela@esta.com', password: _pass)
User.create!(name: 'veronica', email: 'veronica@esta.com', password: _pass)
User.create!(name: 'antonio', email: 'antonio@esta.com', password: _pass)

Role.create!(name: 'gil', description: 'es un verdadero gil')
Role.create!(name: 'moderador', description: 'es menos groso')
Role.create!(name: 'admin', description: 'es un groso')

Rolification.create!(user: User.find(1), branch: Branch.find(1), role: Role.find(2))
Rolification.create!(user: User.find(3), branch: Branch.find(2), role: Role.find(3))
Rolification.create!(user: User.find(2), branch: Branch.find(3), role: Role.find(2))
Rolification.create!(user: User.find(3), branch: Branch.find(1), role: Role.find(3))
Rolification.create!(user: User.find(2), branch: Branch.find(1), role: Role.find(1))