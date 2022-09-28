class Channel::Filter::Monit < Channel::Filter::MonitoringBase
  def self.integration_name
    'monit'
  end
end
