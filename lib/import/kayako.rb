module Import
  class Kayako < Import::Base
    include Import::Mixin::Sequence

    def start
      process
    end

    def sequence_name
      'Import::Kayako::Full'
    end
  end
end
