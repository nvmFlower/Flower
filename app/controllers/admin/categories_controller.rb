class Admin::CategoriesController < Admin::ApplicationController
  def index
    @colors = Color.list_all_name.sort_alpha.limit Settings.number_categories
    @kinds = Kind.list_all_name.sort_alpha.limit Settings.number_categories
    @designs = Design.list_all_name.sort_alpha.limit Settings.number_categories
    @occasions = Occasion.list_all_name.sort_alpha.limit Settings.number_categories
  end
end
