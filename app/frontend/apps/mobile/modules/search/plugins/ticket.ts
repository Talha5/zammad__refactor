

import TicketItem from '@mobile/components/Ticket/TicketItem.vue'
import { type TicketItemData } from '@mobile/components/Ticket/types'
import { type SearchPlugin } from './index'

export default <SearchPlugin<TicketItemData>>{
  headerTitle: __('Tickets'),
  component: TicketItem,
  link: '/tickets/#{id}',
  permissions: ['ticket.agent', 'ticket.customer'],
  order: 100,
}
