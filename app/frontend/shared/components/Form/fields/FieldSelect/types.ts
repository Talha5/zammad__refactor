

import type { TicketState } from '@shared/entities/ticket/types'

export type SelectOption = {
  value: string | number
  label: string
  labelPlaceholder?: string[]
  disabled?: boolean
  status?: TicketState
  icon?: string
}

export type SelectOptionSorting = 'label' | 'value'

export type SelectSize = 'small' | 'medium'
