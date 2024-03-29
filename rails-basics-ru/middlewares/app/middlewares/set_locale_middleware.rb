# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    I18n.locale = extract_locale_from_accept_language_header(env)

    @app.call(env)
  end

  private

  def extract_locale_from_accept_language_header(env)
    if env['HTTP_ACCEPT_LANGUAGE'].blank?
      I18n.default_locale
    else
      locale = env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      I18n.available_locales.include?(locale.to_sym) ? locale : I18n.default_locale
    end
  end
  # END
end
