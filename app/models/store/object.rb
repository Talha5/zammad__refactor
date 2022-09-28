class Store < ApplicationModel
  class Object < ApplicationModel
    include ChecksHtmlSanitized

    validates :name, presence: true

    sanitized_html :note
  end
end
