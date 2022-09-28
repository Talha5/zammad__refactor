class DropSettingUiClientStorage < ActiveRecord::Migration[6.1]
  def change
    return if !Setting.exists?(name: 'system_init_done')

    Setting.find_by(name: 'ui_client_storage')&.destroy
  end
end
