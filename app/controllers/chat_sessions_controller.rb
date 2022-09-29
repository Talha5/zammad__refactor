class ChatSessionsController < ApplicationController
  prepend_before_action { authentication_check && authorize! }

  def show
    model_show_render(Chat::Session, params)
  end

end
