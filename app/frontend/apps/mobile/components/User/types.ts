

export interface UserItemData {
  id: string
  firstname?: Maybe<string>
  lastname?: Maybe<string>
  ticketsCount: number
  organization?: {
    name: string
  }
  updatedAt?: string
  updatedBy?: {
    id: string
    firstname?: Maybe<string>
    lastname?: Maybe<string>
  }
}
