

import type { SelectOption } from '../FieldSelect'

export type TreeSelectOption = SelectOption & {
  children?: TreeSelectOption[]
}

export type FlatSelectOption = SelectOption & {
  hasChildren: boolean
  parents: (string | number)[]
}
