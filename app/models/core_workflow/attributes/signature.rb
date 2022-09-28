class CoreWorkflow::Attributes::Signature < CoreWorkflow::Attributes::Base
  def values
    @values ||= Signature.all.pluck(:id)
  end
end
