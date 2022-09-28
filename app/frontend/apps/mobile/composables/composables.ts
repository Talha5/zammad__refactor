

import { ref } from 'vue'

export const usePopup = () => {
  const popupState = ref(false)
  const openPopup = () => {
    popupState.value = true
  }
  const closePopup = () => {
    popupState.value = false
  }

  return {
    popupState,
    openPopup,
    closePopup,
  }
}
