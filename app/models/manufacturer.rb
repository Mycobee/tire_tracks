class Manufacturer < ApplicationRecord
    validates :name, presence: true
    validates :city, presence: true
    validates :year_founded, presence: true, numericality: {greater_than: 1850, less_than: 2020, only_integer: true}

    has_many :cars

    def car_count
        cars.size
    end

    def self.avg_year_founded
        Manufacturer.average(:year_founded)
    end

    def self.unique_cities
        Manufacturer.select(:city).distinct.pluck(:city)
    end
end