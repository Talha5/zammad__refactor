class CoreWorkflow::Result::Show < CoreWorkflow::Result::Backend
  def run
    @result_object.result[:visibility][field] = 'show'
    true
  end
end
