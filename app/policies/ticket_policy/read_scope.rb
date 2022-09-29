class TicketPolicy < ApplicationPolicy
  class ReadScope < BaseScope
    ACCESS_TYPE = :read
  end
end
