module Category extend ActiveSupport::Concern
  module ClassMethods

    def list_all_name
      self.select :id, :name, :created_at, :updated_at
    end

    def sort_alpha
      self.order name: :asc
    end

  end
end
