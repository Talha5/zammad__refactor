module ApplicationController::Klass
  extend ActiveSupport::Concern

  included do
    def klass
      @klass ||= controller_path.classify.constantize
    end
  end
end
