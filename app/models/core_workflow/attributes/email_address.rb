class CoreWorkflow::Attributes::EmailAddress < CoreWorkflow::Attributes::Base
  def values
    @values ||= EmailAddress.all.pluck(:id)
  end
end
