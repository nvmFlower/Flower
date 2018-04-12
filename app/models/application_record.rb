class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :sort_alpha, ->{order name: :asc}
  scope :list_categories, ->{select :name}
end
