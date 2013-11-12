class Comment < ActiveRecord::Base
    belongs_to :movie

    validates_length_of :body, within: 5..500, too_long: 'write a shorter body', too_short: 'write a longer body'
    validates_presence_of :body
end
