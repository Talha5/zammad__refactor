

import { ComputedRef, ref, UnwrapRef } from 'vue'
import { RouteLocationRaw } from 'vue-router'

export interface HeaderOptions {
  title?: string | ComputedRef<string>
  titleClass?: string | ComputedRef<string>
  backTitle?: string | ComputedRef<string>
  backUrl?: RouteLocationRaw | ComputedRef<RouteLocationRaw>
  actionTitle?: string | ComputedRef<string>
  onAction?(): void
}

export const headerOptions = ref<HeaderOptions>({})

export const useHeader = (options: HeaderOptions) => {
  headerOptions.value = options as UnwrapRef<HeaderOptions>
}
