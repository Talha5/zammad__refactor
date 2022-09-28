

import { textarea as textareaDefinition } from '@formkit/inputs'
import initializeFieldDefinition from '@shared/form/core/initializeFieldDefinition'

initializeFieldDefinition(textareaDefinition)

// TODO resizing as prop?

export default {
  fieldType: 'textarea',
  definition: textareaDefinition,
}
