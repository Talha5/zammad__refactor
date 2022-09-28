class Issue3759CacheClear < ActiveRecord::Migration[6.0]
  def change
    return if !Setting.exists?(name: 'system_init_done')

    Rails.cache.clear
  end
end
