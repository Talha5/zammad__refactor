

import type { RouteRecordRaw } from 'vue-router'

const routes: RouteRecordRaw[] = [
  {
    path: '/account',
    name: 'AccountOverview',
    props: true,
    component: () => import('./views/AccountOverview.vue'),
    meta: {
      title: __('Account'),
      requiresAuth: true,
      requiredPermission: ['*'],
      hasBottomNavigation: true,
      hasHeader: true,
      level: 1,
    },
  },
  {
    path: '/account/avatar',
    name: 'AccountAvatar',
    props: true,
    component: () => import('./views/AccountAvatar.vue'),
    meta: {
      title: __('Avatar'),
      requiresAuth: true,
      requiredPermission: ['*'],
      hasBottomNavigation: false,
      hasHeader: true,
      level: 2,
    },
  },
]

export default routes
