module Import
  class Freshdesk < Import::Base
    include Import::Mixin::Sequence

    def start
      process
    end

    def sequence_name
      'Import::Freshdesk::Full'
    end
  end
end
