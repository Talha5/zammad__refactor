class CoreWorkflow::Result::SetReadonly < CoreWorkflow::Result::Backend
  def run
    @result_object.result[:readonly][field] = true
    true
  end
end
