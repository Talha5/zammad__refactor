class CoreWorkflow::Result::Remove < CoreWorkflow::Result::Backend
  def run
    @result_object.result[:visibility][field] = 'remove'
    true
  end
end
