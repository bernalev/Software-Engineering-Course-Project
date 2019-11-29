class TutorAd < ApplicationRecord
  belongs_to:user
  enum ad_type: [:wanted, :offering]


  include PgSearch::Model
  pg_search_scope :search, :against => [:title,:description]
end
