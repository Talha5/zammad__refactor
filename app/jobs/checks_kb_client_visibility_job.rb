class ChecksKbClientVisibilityJob < ApplicationJob
  include HasActiveJobLock

  def lock_key
    # "ChecksKbClientVisibilityJob"
    self.class.name
  end

  def perform
    Sessions.broadcast({ event: 'kb_visibility_may_have_changed' })
  end
end
