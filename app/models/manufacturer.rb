class Manufacturer < ApplicationRecord
    validates :name, presence: true
    validates :city, presence: true
    validates :year_founded, presence: true, numericality: {greater_than: 1900, less_than: 2020, only_integer: true}

    has_many :cars

    def car_count
        cars.size
    end

    def self.avg_year_founded
        Manufacturer.pluck(:year_founded).sum / Manufacturer.pluck(:year_founded).count
    end
end