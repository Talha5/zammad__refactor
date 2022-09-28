class CoreWorkflow::Result::SetMandatory < CoreWorkflow::Result::Backend
  def run
    @result_object.result[:mandatory][field] = true
    true
  end
end
