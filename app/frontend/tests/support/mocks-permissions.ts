

import useSessionStore from '@shared/stores/session'
import { initializeStore } from './components/renderComponent'

export const mockPermissions = (permissions: string[]) => {
  initializeStore()

  const user = useSessionStore()
  if (!user.user) {
    user.user = {
      id: '123',
      objectAttributeValues: [],
    }
  }

  user.user!.permissions = { names: permissions }
}
