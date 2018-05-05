class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :list_all_name, ->{select :name}
  scope :sort_alpha, ->{order name: :asc}

  include Category
end
