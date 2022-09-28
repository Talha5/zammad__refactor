

import createInput from '@shared/form/core/createInput'
import addLink from '@shared/form/features/addLink'
import FieldInputSearch from './FieldSearch.vue'

const fieldDefinition = createInput(FieldInputSearch, ['noBorder'], {
  features: [addLink],
})

export default {
  fieldType: 'search',
  definition: fieldDefinition,
}
