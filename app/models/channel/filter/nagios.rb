class Channel::Filter::Nagios < Channel::Filter::MonitoringBase
  def self.integration_name
    'nagios'
  end
end
