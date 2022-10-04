class Controllers::CwControllerPolicy < Controllers::ApplicationControllerPolicy
  permit! :perform, to: ['ticket.agent', 'ticket.customer']
  default_permit!('admin.core_workflow')
end
