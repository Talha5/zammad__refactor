

import type { RouteRecordRaw } from 'vue-router'

const route: RouteRecordRaw = {
  path: '/',
  name: 'Home',
  props: true,
  component: () => import('./views/Home.vue'),
  meta: {
    title: __('Home'),
    requiresAuth: true,
    requiredPermission: ['*'],
    hasBottomNavigation: true,
    level: 1,
  },
}

export default route
