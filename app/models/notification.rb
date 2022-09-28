class Notification < ApplicationModel
  include ChecksHtmlSanitized

  sanitized_html :note
end
