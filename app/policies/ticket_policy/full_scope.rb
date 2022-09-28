class TicketPolicy < ApplicationPolicy
  class FullScope < BaseScope
    ACCESS_TYPE = :full
  end
end
