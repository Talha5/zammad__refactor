

import type { App } from 'vue'
import { createPinia, Pinia } from 'pinia'
import PiniaSharedState from './plugins/sharedState'

const store: Pinia = createPinia()
store.use(PiniaSharedState({ enabled: false }))

export default function initializeStore(app: App) {
  app.use(store)
}

export { store }
