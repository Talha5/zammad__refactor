

import type { RouteRecordRaw } from 'vue-router'

export const isMainRoute = true

const route: RouteRecordRaw = {
  path: '/error',
  alias: '/:pathMatch(.*)*',
  name: 'Error',
  props: true,
  component: () => import('./views/Error.vue'),
  meta: {
    requiresAuth: false,
    requiredPermission: null,
  },
}

export default route
