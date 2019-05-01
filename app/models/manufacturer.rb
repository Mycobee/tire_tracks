class Manufacturer < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { maximum: 75 }
    validates :city, presence: true, uniqueness: true, length: { maximum: 75 }
    validates :year_founded, presence: true, numericality: {greater_than: 1900, less_than: 2020, only_integer: true}
end