

import { computed, reactive, readonly } from 'vue'
import { OperationVariables } from '@apollo/client/core'
import { QueryHandler } from '@shared/server/apollo/handler'
import {
  BaseConnection,
  OperationQueryResult,
  PaginationVariables,
} from '@shared/types/server/apollo/handler'

export default function usePagination<
  TQueryResult = OperationQueryResult,
  TQueryVariables = OperationVariables,
>(query: QueryHandler<TQueryResult, TQueryVariables>, resultKey: string) {
  const pageInfo = computed(() => {
    const result: OperationQueryResult = query.result().value || {}

    return (result[resultKey] as BaseConnection)?.pageInfo
  })

  const hasNextPage = computed(() => {
    if (!pageInfo.value) return false

    return pageInfo.value.hasNextPage
  })

  return reactive({
    pageInfo: readonly(pageInfo),
    hasNextPage: readonly(hasNextPage),
    fetchNextPage() {
      query.fetchMore({
        variables: {
          cursor: pageInfo.value?.endCursor,
        } as Partial<TQueryVariables & PaginationVariables>,
      })
    },
  })
}
