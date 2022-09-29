

import { renderComponent } from '@tests/support/components'
import TransitionViewNavigation from '../TransitionViewNavigation.vue'

describe('TransitionViewNavigation.vue', () => {
  it('renders the component', () => {
    const wrapper = renderComponent(TransitionViewNavigation)

    expect(wrapper.container).toBeInTheDocument()
  })
})
