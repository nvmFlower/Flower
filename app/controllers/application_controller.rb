class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  before_action :set_locale
  before_action :logged_in_user

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

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
    end
  end


end
