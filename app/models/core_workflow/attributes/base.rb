class CoreWorkflow::Attributes::Base
  def initialize(attributes:, attribute:)
    @attributes = attributes
    @attribute = attribute
  end

  def values
    []
  end
end
