# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

      @manufacturer_1 = Manufacturer.create!(name: "Triumph", city: "London, UK", year_founded: 1913)
      @manufacturer_2 = Manufacturer.create!(name: "Mercedes", city: "Berlin, Germany", year_founded: 1915)

      @car_1a = @manufacturer_1.cars.create!(name: "car1a", year: 1924)
      @car_1b = @manufacturer_1.cars.create!(name: "car1b", year: 1922)

      @car_2a = @manufacturer_2.cars.create!(name: "car2a", year: "1923")
      @car_2b = @manufacturer_2.cars.create!(name: "car2b", year: "1924")
