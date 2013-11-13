class Movie < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_many :casts, dependent: :destroy
end
