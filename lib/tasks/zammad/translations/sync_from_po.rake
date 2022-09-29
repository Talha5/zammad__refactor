namespace :zammad do

  namespace :translations do

    desc 'Synchronize latest translations from i18n/*.po to the database.'
    task sync: :environment do
      puts 'Synchronizing the latest translations from i18n/*.po to the database...'
      Translation.sync
      puts 'done.'
    end
  end
end
