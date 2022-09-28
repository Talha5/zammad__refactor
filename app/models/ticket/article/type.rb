class Ticket::Article::Type < ApplicationModel
  include ChecksHtmlSanitized
  include HasCollectionUpdate

  validates :name, presence: true

  sanitized_html :note
end
