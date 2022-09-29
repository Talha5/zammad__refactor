class ApplicationPolicy
  class Scope
    include PunditPolicy

    attr_reader :scope

    def initialize_context(scope)
      @scope = scope
    end
  end
end
