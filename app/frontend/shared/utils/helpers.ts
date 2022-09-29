

export const mergeArray = <T extends unknown[]>(a: T, b: T) => {
  return [...new Set([...a, ...b])]
}
