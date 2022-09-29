class CoreWorkflow::Result::Hide < CoreWorkflow::Result::Backend
  def run
    @result_object.result[:visibility][field] = 'hide'
    true
  end
end
