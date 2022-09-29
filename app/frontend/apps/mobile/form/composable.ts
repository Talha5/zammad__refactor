

import { FormSchemaNode } from '@shared/components/Form'

export const defineFormSchema = (
  schema: FormSchemaNode[],
): FormSchemaNode[] => {
  const needGroup = schema.every((node) => !('isLayout' in node))
  if (!needGroup) return schema
  return [
    {
      isLayout: true,
      component: 'FormGroup',
      children: schema,
    },
  ]
}
