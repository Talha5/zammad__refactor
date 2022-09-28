

import type { RouteRecordRaw } from 'vue-router'

const routes: RouteRecordRaw[] = [
  {
    path: '/tickets',
    name: 'TicketOverview',
    props: true,
    component: () => import('./views/TicketOverview.vue'),
    meta: {
      title: __('Ticket Overviews'),
      requiresAuth: true,
      requiredPermission: ['ticket.agent', 'ticket.customer'],
      hasBottomNavigation: true,
      level: 2,
    },
  },
]

export default routes
