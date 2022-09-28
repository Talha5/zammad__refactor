class Ticket::Flag < ApplicationModel
  belongs_to :ticket

  association_attributes_ignored :ticket
end
