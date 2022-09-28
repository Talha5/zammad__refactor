

import type { SetOptional } from 'type-fest'

export enum NotificationTypes {
  Warn = 'warn',
  Success = 'success',
  Error = 'error',
  Info = 'info',
}

export interface Notification {
  id: string
  message: string
  messagePlaceholder?: string[]
  type: NotificationTypes
  durationMS?: number
  persistent?: boolean
  callback?: () => void
}

export type NewNotification = SetOptional<Notification, 'id'>
