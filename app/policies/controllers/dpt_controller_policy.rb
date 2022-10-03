class Controllers::DptControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.data_privacy')
end
