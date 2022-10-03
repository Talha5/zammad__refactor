class Controllers::DPTControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.data_privacy')
end
