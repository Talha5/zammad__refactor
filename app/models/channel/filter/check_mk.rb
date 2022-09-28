class Channel::Filter::CheckMk < Channel::Filter::MonitoringBase
  def self.integration_name
    'check_mk'
  end
end
