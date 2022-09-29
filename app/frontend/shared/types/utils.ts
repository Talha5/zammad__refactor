

export type ReactiveFunction<TParam> = () => TParam

export type ImportGlobEagerDefault<T> = Record<string, T>

export type ImportGlobEagerOutput<T> = Record<string, ImportGlobEagerDefault<T>>
