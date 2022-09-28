module ChecksKbClientVisibility
  extend ActiveSupport::Concern

  included do
    after_commit :notify_kb_client_visibility
  end

  private

  def notify_kb_client_visibility
    return if self.class.notify_kb_clients_suspend?

    ChecksKbClientVisibilityJob.perform_later
  end
end
