class CoreWorkflow::Result::UnsetReadonly < CoreWorkflow::Result::Backend
  def run
    @result_object.result[:readonly][field] = false
    true
  end
end
