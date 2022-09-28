class Channel::Filter::Icinga < Channel::Filter::MonitoringBase
  def self.integration_name
    'icinga'
  end
end
