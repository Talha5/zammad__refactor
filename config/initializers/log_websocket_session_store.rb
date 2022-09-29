if Rails.application.config.websocket_session_store.eql? :redis
  Rails.logger.info 'Using Redis as web socket session store.'
else
  Rails.logger.info 'Using File as web socket session store.'
end
