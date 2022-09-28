

import createTemplate from '@stories/support/createTemplate'
import CommonInputSearch, {
  type CommonInputSearchProps,
} from './CommonInputSearch.vue'

export default {
  title: 'Shared/CommonInputSearch',
  component: CommonInputSearch,
}

const Template = createTemplate<CommonInputSearchProps>(CommonInputSearch)

export const Base = Template.create({
  modelValue: 'Search Word',
})

export const NoBorder = Template.create({
  modelValue: 'No Borders On Click',
  noBorder: true,
})
