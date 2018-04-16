class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  before_action :read_menu

  def read_menu
    @occasions = Occasion.all
    @type_flower = TypeFlower.all
     @design = Design.all
    end
end
