class ApplicationPolicy
  include PunditPolicy

  attr_reader :record

  def initialize_context(record)
    @record = record
  end
end
