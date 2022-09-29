

import emitter from '../emitter'

describe('emitter', () => {
  it('check working emitter object', () => {
    const emitCallbackSpy = vi.fn()

    emitter.on('sessionInvalid', emitCallbackSpy)

    emitter.emit('sessionInvalid')

    expect(emitCallbackSpy).toHaveBeenCalled()
  })
})
