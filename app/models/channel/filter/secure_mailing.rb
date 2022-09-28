module Channel::Filter::SecureMailing

  def self.run(_channel, mail, _transaction_params)
    ::SecureMailing.incoming(mail)
  end
end
