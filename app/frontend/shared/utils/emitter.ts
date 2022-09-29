

import mitt, { type Emitter } from 'mitt'

type Events = {
  sessionInvalid: void
}

const emitter: Emitter<Events> = mitt<Events>()

export default emitter
