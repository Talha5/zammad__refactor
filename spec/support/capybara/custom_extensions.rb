class Capybara::Node::Element

  # This is an extension to each node to check if the element
  # is moving or in a fixed position. This is especially helpful
  # for animated elements that cause flanky tests.
  # NOTE: In CI env a special sleep is performed between checks
  # because animations can be slow.
  #
  # @param [Integer] checks the number of performed movement checks
  #
  # @example
  #  find('.clues-close').in_fixed_position.click
  # => waits till clues moved to final position and performs click afterwards
  #
  # @raise [RuntimeError] raised in case the element is
  #   still moving after max number of checks was passed
  #
  # @return [Capybara::Node::Element] the element/node
  def in_fixed_position(checks: 100, wait: 0.2)
    previous = native.location

    (checks + 1).times do
      sleep wait

      current = native.location

      return self if previous == current

      previous = current
    end

    raise "Element still moving after #{checks} checks"
  end
end

module TTSCapybarActionDelegator
  def select(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_on(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_link(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_link_or_button(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_button(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def select_option(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def send_keys(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def hot_keys
    mac_platform? ? %i[control alt] : %i[shift control]
  end

  def magic_key
    mac_platform? ? :command : :control
  end

  def mac_platform?
    Gem::Platform.local.os.eql? 'darwin'
  end
end

module TTSCapybarSelectorDelegator
  def find_field(...)
    TTSCapybaraElementDelegator.new(element: super, context: self)
  end

  def find_button(...)
    TTSCapybaraElementDelegator.new(element: super, context: self)
  end

  def find_by_id(...)
    TTSCapybaraElementDelegator.new(element: super, context: self)
  end

  def find_link(...)
    TTSCapybaraElementDelegator.new(element: super, context: self)
  end

  def find(...)
    TTSCapybaraElementDelegator.new(element: super, context: self)
  end

  def first(...)
    TTSCapybaraElementDelegator.new(element: super, context: self)
  end

  def all(...)
    super.map { |element| TTSCapybaraElementDelegator.new(element: element, context: self) }
  end
end

class TTSCapybaraSessionDelegator < SimpleDelegator
  extend Forwardable

  def_delegator :@context, :await_empty_ajax_queue
  attr_reader :element

  include TTSCapybarSelectorDelegator

  def initialize(context:, element:)
    @context = context
    @element = element

    super(element)
  end
end

class TTSCapybaraElementDelegator < TTSCapybaraSessionDelegator
  include TTSCapybarActionDelegator
end

module CapybaraCustomExtensions
  include TTSCapybarActionDelegator
  include TTSCapybarSelectorDelegator

  def page(...)
    TTSCapybaraSessionDelegator.new(element: super, context: self)
  end
end

RSpec.configure do |config|
  config.include CapybaraCustomExtensions, type: :system
end
