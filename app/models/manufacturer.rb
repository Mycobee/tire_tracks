class Manufacturer < ApplicationRecord
    validates :name, presence: true
    validates :city, presence: true
    validates :year_founded, presence: true, numericality: {greater_than: 1900, less_than: 2020, only_integer: true}

    has_many :cars

    def car_count
        cars.count
    end
end