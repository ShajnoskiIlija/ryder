# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action { @pagy_locale = params[:locale] }

  def default_url_options
    { locale: (I18n.locale == I18n.default_locale ? nil : I18n.locale) }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name address phone_number])
  end

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end
end
