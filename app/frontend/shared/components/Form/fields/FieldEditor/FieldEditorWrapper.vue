<script setup lang="ts">
import { defineAsyncComponent } from 'vue'
import type { FormFieldContext } from '@shared/components/Form/types/field'

const FieldEditor = defineAsyncComponent(() => import('./FieldEditorInput.vue'))

interface Props {
  context: FormFieldContext
}

defineProps<Props>()
</script>

<template>
  <Suspense>
    <FieldEditor :context="context" v-bind="$attrs" />
    <!-- TODO make a placeholder that looks like a disabled editor with a spinner inside -->
    <template #fallback> Loading Editor... </template>
  </Suspense>
</template>
