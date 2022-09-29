

export interface OrganizationItemData {
  id: string
  ticketsCount: number
  members?: {
    lastname?: Maybe<string>
    firstname?: Maybe<string>
  }[]
  active: boolean
  name: string
  updatedAt?: string
  updatedBy?: {
    id: string
    firstname?: Maybe<string>
    lastname?: Maybe<string>
  }
}
