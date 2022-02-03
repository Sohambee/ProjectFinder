class Categorie < ApplicationRecord
  include PgSearch::Model


  pg_search_scope :search, against: %i(category)
end
