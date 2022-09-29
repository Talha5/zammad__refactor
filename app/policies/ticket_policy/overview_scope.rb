class TicketPolicy < ApplicationPolicy
  class OverviewScope < BaseScope
    ACCESS_TYPE = :overview
  end
end
