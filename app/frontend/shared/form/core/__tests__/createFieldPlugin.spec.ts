

import createFieldPlugin from '@shared/form/core/createFieldPlugin'

describe('createFieldPlugin', () => {
  it('check that field plugin will be returned', () => {
    const fieldPlugin = createFieldPlugin()

    expect(typeof fieldPlugin).toEqual('function')
  })
})
