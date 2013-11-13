class Person < ActiveRecord::Base
    belongs_to :movie
    has_many :casts, dependent: :destroy
end