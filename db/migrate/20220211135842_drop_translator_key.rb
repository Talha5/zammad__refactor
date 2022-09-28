class DropTranslatorKey < ActiveRecord::Migration[6.0]
  def change
    # return if it's a new setup
    return if !Setting.exists?(name: 'system_init_done')

    Setting.find_by(name: 'translator_key')&.destroy
  end
end
