module TranslationHelper
  def zammad_translate(string, *args)
    Translation.translate(system_locale_via_uri&.locale, string, *args)
  end

  alias zt zammad_translate
end
