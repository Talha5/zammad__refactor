

import type { App } from 'vue'
import {
  DefaultApolloClient,
  provideApolloClient,
} from '@vue/apollo-composable'
import type { CacheInitializerModules } from '@shared/types/server/apollo/client'
import { createApolloClient } from './client'

const initializeApolloClient = (
  app: App,
  cacheInitializerModules: CacheInitializerModules = {},
) => {
  const apolloClient = createApolloClient(cacheInitializerModules)

  app.provide(DefaultApolloClient, apolloClient)

  provideApolloClient(apolloClient)
}

export default initializeApolloClient
