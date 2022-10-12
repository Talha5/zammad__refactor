# This file overwrites `Capybara::Node::Finders#all` to set the default value
# of the `allow_reload` keyword argument to `true` (default: `false`) to enable
# automatic reload of stale elements and avoid
# `Selenium::WebDriver::Error::StaleElementReferenceError` exceptions.

module TTSActivateReloadOfStaleElements

  def all(*args, allow_reload: true, **options, &optional_filter_block)
    super(*args, allow_reload: allow_reload, **options, &optional_filter_block)
  end
end

Capybara::Node::Base.include(TTSActivateReloadOfStaleElements)
Capybara::Node::Simple.include(TTSActivateReloadOfStaleElements)
