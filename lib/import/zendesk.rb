module Import
  class Zendesk < Import::Base
    include Import::Mixin::Sequence

    def start
      process
    end

    def sequence_name
      'Import::Zendesk::Full'
    end
  end
end
