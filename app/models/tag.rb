class Tag < ApplicationRecord
  include PgSearch::Model


  pg_search_scope :search, against: %i(tags)
end
