//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateHealthDataInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, datetime: String, value: Int) {
    graphQLMap = ["id": id, "datetime": datetime, "value": value]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var datetime: String {
    get {
      return graphQLMap["datetime"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }

  public var value: Int {
    get {
      return graphQLMap["value"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

public struct UpdateHealthDataInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, datetime: String? = nil, value: Int? = nil) {
    graphQLMap = ["id": id, "datetime": datetime, "value": value]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var datetime: String? {
    get {
      return graphQLMap["datetime"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }

  public var value: Int? {
    get {
      return graphQLMap["value"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

public struct DeleteHealthDataInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelHealthDataFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDFilterInput? = nil, datetime: ModelStringFilterInput? = nil, value: ModelIntFilterInput? = nil, and: [ModelHealthDataFilterInput?]? = nil, or: [ModelHealthDataFilterInput?]? = nil, not: ModelHealthDataFilterInput? = nil) {
    graphQLMap = ["id": id, "datetime": datetime, "value": value, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDFilterInput? {
    get {
      return graphQLMap["id"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var datetime: ModelStringFilterInput? {
    get {
      return graphQLMap["datetime"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "datetime")
    }
  }

  public var value: ModelIntFilterInput? {
    get {
      return graphQLMap["value"] as! ModelIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  public var and: [ModelHealthDataFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelHealthDataFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelHealthDataFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelHealthDataFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelHealthDataFilterInput? {
    get {
      return graphQLMap["not"] as! ModelHealthDataFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ModelStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ModelIntFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, contains: Int? = nil, notContains: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: Int? {
    get {
      return graphQLMap["contains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: Int? {
    get {
      return graphQLMap["notContains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public final class CreateHealthDataMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateHealthData($input: CreateHealthDataInput!) {\n  createHealthData(input: $input) {\n    __typename\n    id\n    datetime\n    value\n  }\n}"

  public var input: CreateHealthDataInput

  public init(input: CreateHealthDataInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createHealthData", arguments: ["input": GraphQLVariable("input")], type: .object(CreateHealthDatum.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createHealthData: CreateHealthDatum? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createHealthData": createHealthData.flatMap { $0.snapshot }])
    }

    public var createHealthData: CreateHealthDatum? {
      get {
        return (snapshot["createHealthData"] as? Snapshot).flatMap { CreateHealthDatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createHealthData")
      }
    }

    public struct CreateHealthDatum: GraphQLSelectionSet {
      public static let possibleTypes = ["HealthData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, datetime: String, value: Int) {
        self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var value: Int {
        get {
          return snapshot["value"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}

public final class UpdateHealthDataMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateHealthData($input: UpdateHealthDataInput!) {\n  updateHealthData(input: $input) {\n    __typename\n    id\n    datetime\n    value\n  }\n}"

  public var input: UpdateHealthDataInput

  public init(input: UpdateHealthDataInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateHealthData", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateHealthDatum.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateHealthData: UpdateHealthDatum? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateHealthData": updateHealthData.flatMap { $0.snapshot }])
    }

    public var updateHealthData: UpdateHealthDatum? {
      get {
        return (snapshot["updateHealthData"] as? Snapshot).flatMap { UpdateHealthDatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateHealthData")
      }
    }

    public struct UpdateHealthDatum: GraphQLSelectionSet {
      public static let possibleTypes = ["HealthData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, datetime: String, value: Int) {
        self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var value: Int {
        get {
          return snapshot["value"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}

public final class DeleteHealthDataMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteHealthData($input: DeleteHealthDataInput!) {\n  deleteHealthData(input: $input) {\n    __typename\n    id\n    datetime\n    value\n  }\n}"

  public var input: DeleteHealthDataInput

  public init(input: DeleteHealthDataInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteHealthData", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteHealthDatum.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteHealthData: DeleteHealthDatum? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteHealthData": deleteHealthData.flatMap { $0.snapshot }])
    }

    public var deleteHealthData: DeleteHealthDatum? {
      get {
        return (snapshot["deleteHealthData"] as? Snapshot).flatMap { DeleteHealthDatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteHealthData")
      }
    }

    public struct DeleteHealthDatum: GraphQLSelectionSet {
      public static let possibleTypes = ["HealthData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, datetime: String, value: Int) {
        self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var value: Int {
        get {
          return snapshot["value"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}

public final class GetHealthDataQuery: GraphQLQuery {
  public static let operationString =
    "query GetHealthData($id: ID!) {\n  getHealthData(id: $id) {\n    __typename\n    id\n    datetime\n    value\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getHealthData", arguments: ["id": GraphQLVariable("id")], type: .object(GetHealthDatum.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getHealthData: GetHealthDatum? = nil) {
      self.init(snapshot: ["__typename": "Query", "getHealthData": getHealthData.flatMap { $0.snapshot }])
    }

    public var getHealthData: GetHealthDatum? {
      get {
        return (snapshot["getHealthData"] as? Snapshot).flatMap { GetHealthDatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getHealthData")
      }
    }

    public struct GetHealthDatum: GraphQLSelectionSet {
      public static let possibleTypes = ["HealthData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, datetime: String, value: Int) {
        self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var value: Int {
        get {
          return snapshot["value"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}

public final class ListHealthDatasQuery: GraphQLQuery {
  public static let operationString =
    "query ListHealthDatas($filter: ModelHealthDataFilterInput, $limit: Int, $nextToken: String) {\n  listHealthDatas(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      datetime\n      value\n    }\n    nextToken\n  }\n}"

  public var filter: ModelHealthDataFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelHealthDataFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listHealthDatas", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListHealthData.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listHealthDatas: ListHealthData? = nil) {
      self.init(snapshot: ["__typename": "Query", "listHealthDatas": listHealthDatas.flatMap { $0.snapshot }])
    }

    public var listHealthDatas: ListHealthData? {
      get {
        return (snapshot["listHealthDatas"] as? Snapshot).flatMap { ListHealthData(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listHealthDatas")
      }
    }

    public struct ListHealthData: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelHealthDataConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelHealthDataConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["HealthData"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, datetime: String, value: Int) {
          self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var datetime: String {
          get {
            return snapshot["datetime"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "datetime")
          }
        }

        public var value: Int {
          get {
            return snapshot["value"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "value")
          }
        }
      }
    }
  }
}

public final class OnCreateHealthDataSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateHealthData {\n  onCreateHealthData {\n    __typename\n    id\n    datetime\n    value\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateHealthData", type: .object(OnCreateHealthDatum.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateHealthData: OnCreateHealthDatum? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateHealthData": onCreateHealthData.flatMap { $0.snapshot }])
    }

    public var onCreateHealthData: OnCreateHealthDatum? {
      get {
        return (snapshot["onCreateHealthData"] as? Snapshot).flatMap { OnCreateHealthDatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateHealthData")
      }
    }

    public struct OnCreateHealthDatum: GraphQLSelectionSet {
      public static let possibleTypes = ["HealthData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, datetime: String, value: Int) {
        self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var value: Int {
        get {
          return snapshot["value"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}

public final class OnUpdateHealthDataSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateHealthData {\n  onUpdateHealthData {\n    __typename\n    id\n    datetime\n    value\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateHealthData", type: .object(OnUpdateHealthDatum.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateHealthData: OnUpdateHealthDatum? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateHealthData": onUpdateHealthData.flatMap { $0.snapshot }])
    }

    public var onUpdateHealthData: OnUpdateHealthDatum? {
      get {
        return (snapshot["onUpdateHealthData"] as? Snapshot).flatMap { OnUpdateHealthDatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateHealthData")
      }
    }

    public struct OnUpdateHealthDatum: GraphQLSelectionSet {
      public static let possibleTypes = ["HealthData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, datetime: String, value: Int) {
        self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var value: Int {
        get {
          return snapshot["value"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}

public final class OnDeleteHealthDataSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteHealthData {\n  onDeleteHealthData {\n    __typename\n    id\n    datetime\n    value\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteHealthData", type: .object(OnDeleteHealthDatum.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteHealthData: OnDeleteHealthDatum? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteHealthData": onDeleteHealthData.flatMap { $0.snapshot }])
    }

    public var onDeleteHealthData: OnDeleteHealthDatum? {
      get {
        return (snapshot["onDeleteHealthData"] as? Snapshot).flatMap { OnDeleteHealthDatum(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteHealthData")
      }
    }

    public struct OnDeleteHealthDatum: GraphQLSelectionSet {
      public static let possibleTypes = ["HealthData"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("datetime", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, datetime: String, value: Int) {
        self.init(snapshot: ["__typename": "HealthData", "id": id, "datetime": datetime, "value": value])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var datetime: String {
        get {
          return snapshot["datetime"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "datetime")
        }
      }

      public var value: Int {
        get {
          return snapshot["value"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}