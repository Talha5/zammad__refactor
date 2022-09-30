module TranslationHelper
  def tts_translate(string, *args)
    Translation.translate(system_locale_via_uri&.locale, string, *args)
  end

  alias tts_t tts_translate
end
