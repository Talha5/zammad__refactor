

import { cloneDeep } from 'lodash-es'
import { FormKitNode, FormKitExtendableSchemaRoot } from '@formkit/core'

import FormFieldLink from '@shared/components/Form/FormFieldLink.vue'
import { markRaw } from 'vue'

const addLink = (node: FormKitNode) => {
  const { props } = node

  if (!props.definition) return

  node.addProps(['link'])

  const definition = cloneDeep(props.definition)

  const originalSchema = definition.schema as FormKitExtendableSchemaRoot

  definition.schema = (extensions) => {
    const localExtensions = {
      ...extensions,
      suffix: {
        $el: 'div',
        if: '$link',
        children: [
          {
            $cmp: markRaw(FormFieldLink),
            props: {
              link: '$link',
            },
          },
        ],
      },
    }
    return originalSchema(localExtensions)
  }

  props.definition = definition
}

export default addLink
