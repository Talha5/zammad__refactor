

import type { FormKitFrameworkContext } from '@formkit/core'
import type { FormDefaultProps } from '@shared/types/form'
import type { FormFieldAdditionalProps } from '../types'

export type FormFieldContext<TFieldProps = FormFieldAdditionalProps> =
  FormKitFrameworkContext & FormDefaultProps & TFieldProps
