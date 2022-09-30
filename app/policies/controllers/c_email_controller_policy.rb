class Controllers::CEmailControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.channel_email')
end
