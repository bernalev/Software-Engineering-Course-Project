class Rating < ApplicationRecord
	belongs_to :note
	belongs_to :user
end
