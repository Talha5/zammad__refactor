class CoreWorkflow::Result::RemoveOption < CoreWorkflow::Result::BaseOption
  def run
    @result_object.result[:restrict_values][field] ||= Array(@result_object.payload['params'][field])
    @result_object.result[:restrict_values][field] -= Array(config_value)
    remove_excluded_param_values
    true
  end

  def config_value
    result = Array(@perform_config['remove_option'])
    result -= saved_value
    result
  end
end
