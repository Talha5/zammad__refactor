

import { type Props as LinkProps } from './CommonSectionMenuLink.vue'

export interface MenuItem extends LinkProps {
  type: 'link'
  onClick?(event: MouseEvent): void
}
