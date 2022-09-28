

import '@testing-library/jest-dom'
import { configure } from '@testing-library/vue'

// eslint-disable-next-line no-underscore-dangle
global.__ = (source) => {
  return source
}

configure({
  testIdAttribute: 'data-test-id',
})

require.extensions['.css'] = () => ({})
