

import { renderComponent } from '@tests/support/components'
import CommonOrganizationAvatar from '../CommonOrganizationAvatar.vue'

describe('CommonOrganizationAvatar', () => {
  it('renders avatar', async () => {
    const view = renderComponent(CommonOrganizationAvatar, {
      props: {
        entity: {
          name: 'Zammad Foundation',
          active: true,
        },
      },
    })

    expect(view.getIconByName('organization')).toBeInTheDocument()

    await view.rerender({
      entity: {
        name: 'Zammad Foundation',
        active: false,
      },
    })

    expect(view.getIconByName('inactive-organization')).toBeInTheDocument()
  })
})
