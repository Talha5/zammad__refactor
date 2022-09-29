<script setup lang="ts">
import { computed } from 'vue'
import CommonAvatar from '../CommonAvatar/CommonAvatar.vue'
import type { AvatarSize } from '../CommonAvatar'
import type { AvatarOrganization } from './types'

export interface Props {
  entity: AvatarOrganization
  size?: AvatarSize
}

const props = defineProps<Props>()

const icon = computed(() => {
  return props.entity.active ? 'organization' : 'inactive-organization'
})
</script>

<template>
  <CommonAvatar :size="size" :icon="icon" />
</template>
