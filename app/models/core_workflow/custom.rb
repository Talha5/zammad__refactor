class CoreWorkflow::Custom
  include ::Mixin::HasBackends

  def self.list
    backends.map(&:to_s)
  end
end
