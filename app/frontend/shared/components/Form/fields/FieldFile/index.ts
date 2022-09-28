

import createInput from '@shared/form/core/createInput'
import FieldFileInput from './FieldFileInput.vue'

const fieldDefinition = createInput(
  FieldFileInput,
  ['multiple', 'capture', 'accept'],
  {},
)

export default {
  fieldType: 'file',
  definition: fieldDefinition,
}
