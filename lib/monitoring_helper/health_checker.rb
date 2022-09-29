module MonitoringHelper
  class HealthChecker
    include ::Mixin::HasBackends

    attr_reader :response

    def check_health
      response = Response.new

      backends.each do |backend|
        response.merge backend.new.check_health
      end

      @response = response
    end

    def healthy?
      response.issues.none?
    end

    def message
      if healthy?
        return 'success'
      end

      response.issues.join(';')
    end
  end
end
