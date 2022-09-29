

import createI18nPlugin from '@shared/form/core/createI18nPlugin'

describe('createI18nPlugin', () => {
  it('check that i18n plugin will be returned', () => {
    const i18Plugin = createI18nPlugin()

    expect(typeof i18Plugin).toEqual('function')
  })
})
