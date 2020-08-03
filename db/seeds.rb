# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.create!(name: 'company test 1', address: '47 867', key: 123) #if Rails.env.development?
User.create!(email: 'a@a.com', password: '123456', password_confirmation: '123456', company: Company.last)
Quiz.create!(name: 'Cuestionario test 1', company: Company.last)
Question.create!(quiz: Quiz.last, name: '¿Que computadoras usaste hoy (notebook o pc)?')
Question.create!(quiz: Quiz.last, name: '¿Cuantas horas la estuviste en uso (pantalla encendida)?')
Question.create!(quiz: Quiz.last, name: '¿Cuantas veces usaste la pava eléctrica?')
Question.create!(quiz: Quiz.last, name: '¿Cuantas veces usaste el microondas?')
Question.create!(quiz: Quiz.last, name: '¿Tu computadora quedó prendida en el día de ayer?')
Question.create!(quiz: Quiz.last, name: 'En el dia de ayer, ¿Apagaste el monitor antes de irte?')
