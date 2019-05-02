class Car < ApplicationRecord
     validates :name, presence: true
     validates :year, presence: true, numericality: {greater_than: 1800, less_than: 2020, only_integer: true}

     belongs_to :manufacturer
end