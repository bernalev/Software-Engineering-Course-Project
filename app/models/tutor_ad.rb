class TutorAd < ApplicationRecord
  belongs_to:user
  include PgSearch::Model
  pg_search_scope :search, :against => [:title,:description]
end
