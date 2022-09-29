class Controllers::MacrosControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit! ['admin.macro']

  permit! %i[index show], to: ['admin.macro', 'ticket.agent']
end
