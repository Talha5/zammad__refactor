class LdapSource < ApplicationModel
  include CanPriorization
  include ChecksClientNotification

  default_scope { order('prio ASC, id ASC') }
  scope :active, -> { where(active: true) }

  store :preferences

  def self.by_user(user)
    return if !%r{^Ldap::(\d+)$}.match?(user.source)

    LdapSource.find(user.source.split('::')[1])
  end
end
