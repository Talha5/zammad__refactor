class Controllers::CFacebookControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.channel_facebook')
end
