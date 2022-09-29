class BackgroundServices::Service::ProcessScheduledJobs
  class JobExecutor::OneTime < JobExecutor
    def run
      execute
    end
  end
end
