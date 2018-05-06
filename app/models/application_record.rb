class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Category
end
