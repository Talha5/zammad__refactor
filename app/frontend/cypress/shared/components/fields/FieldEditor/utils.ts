

import { FormKit } from '@formkit/vue'
import { mountComponent } from '@cy/utils'

export const mountEditor = (props: Record<string, unknown> = {}) => {
  return mountComponent(FormKit, {
    props: {
      name: 'editor',
      type: 'editor',
      ...props,
    },
  })
}

export default {}
