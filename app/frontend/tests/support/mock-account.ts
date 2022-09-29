

import useSessionStore from '@shared/stores/session'
import { UserData } from '@shared/types/store'
import { initializeStore } from './components/renderComponent'

export const mockAccount = (mockUser: Partial<UserData>) => {
  initializeStore()
  const user = useSessionStore()
  user.user = { id: '123', objectAttributeValues: [], ...mockUser }
}
