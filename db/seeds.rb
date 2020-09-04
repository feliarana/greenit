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
Factor.create!(name: '¿Cuantas horas utilizaste tu notebook?',
               emission_source: 'generica', emission_factor: '0.412', unit_meassure: 'KwH',
               emission_per_hour: 0.29664, consumption: 0.72)
Factor.create!(name: '¿Cuantas horas utilizaste tu PC?',
               emission_source: 'generica', emission_factor: '0.412', unit_meassure: 'KwH',
               emission_per_hour: 0.009, consumption: 0.022)

Factor.create!(name: '¿Cuantas veces usaste la pava eléctrica?',
               emission_source: 'pava electrica', emission_factor: '0.022', unit_meassure: 'KwH',
               emission_per_hour: 0.824, consumption: 2)

Factor.create!(name: '¿Cuantas veces usaste el microondas?',
               emission_source: 'pava electrica', emission_factor: '0.412', unit_meassure: 'KwH',
               emission_per_hour: 0.26368, consumption: 0.64)

Factor.create!(name: '¿Cuantas horas estuvo prendida la pantalla de la computadora?',
               emission_source: 'portatil', emission_factor: '0.412', unit_meassure: 'KwH',
               emission_per_hour: 0.009, consumption: 0.022)

# Question.create!(quiz: Quiz.last, name: '¿Tu computadora quedó prendida en el día de ayer?')
Factor.create!(name: '¿Cuantas hojas A4 imprimiste en el dia de hoy?',
               emission_source: 'a4', emission_factor: '1,320', unit_meassure: 'KG',
               emission_per_hour: 0.006072, consumption: 2.3)
Factor.create!(name: '¿Cuantas hojas Oficio imprimiste en el dia de hoy?',
               emission_source: 'oficio', emission_factor: '1,320', unit_meassure: 'KG',
               emission_per_hour: 0.007392, consumption: 2.3)
Question.create!(quiz: Quiz.last, factor_id: 1)
Question.create!(quiz: Quiz.last, factor_id: 2)
Question.create!(quiz: Quiz.last, factor_id: 3)
Question.create!(quiz: Quiz.last, factor_id: 4)
Question.create!(quiz: Quiz.last, factor_id: 5)
Question.create!(quiz: Quiz.last, factor_id: 6)
Question.create!(quiz: Quiz.last, factor_id: 7)
