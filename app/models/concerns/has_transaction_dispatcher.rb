module HasTransactionDispatcher
  extend ActiveSupport::Concern

  included do
    after_create  TransactionDispatcher
    before_update TransactionDispatcher
  end

end
