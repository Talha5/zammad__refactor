module MonitoringHelper
  class HealthChecker
    class Backend
      attr_reader :response

      def initialize
        @response = Response.new
      end

      def check_health
        run_health_check
        response
      end

      protected

      # override in subclass
      def run_health_check; end
    end
  end
end
