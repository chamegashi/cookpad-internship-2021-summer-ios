// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct OrderItemInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - productId: 注文する商品の ID
  ///   - quantity: 注文する商品の個数
  public init(productId: GraphQLID, quantity: Int) {
    graphQLMap = ["productId": productId, "quantity": quantity]
  }

  /// 注文する商品の ID
  public var productId: GraphQLID {
    get {
      return graphQLMap["productId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productId")
    }
  }

  /// 注文する商品の個数
  public var quantity: Int {
    get {
      return graphQLMap["quantity"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }
}

public final class FetchProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query fetchProducts {
      products {
        __typename
        id
        name
        price
        summary: description
        imageUrl
      }
    }
    """

  public let operationName: String = "fetchProducts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("products", type: .nonNull(.list(.nonNull(.object(Product.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: [Product]) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.map { (value: Product) -> ResultMap in value.resultMap }])
    }

    /// すべての商品を返す
    public var products: [Product] {
      get {
        return (resultMap["products"] as! [ResultMap]).map { (value: ResultMap) -> Product in Product(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Product) -> ResultMap in value.resultMap }, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("price", type: .nonNull(.scalar(Int.self))),
          GraphQLField("description", alias: "summary", type: .nonNull(.scalar(String.self))),
          GraphQLField("imageUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, price: Int, summary: String, imageUrl: String) {
        self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "price": price, "summary": summary, "imageUrl": imageUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// 商品名
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// 商品の価格
      public var price: Int {
        get {
          return resultMap["price"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      /// 商品の詳細
      public var summary: String {
        get {
          return resultMap["summary"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "summary")
        }
      }

      /// 商品画像の URL
      public var imageUrl: String {
        get {
          return resultMap["imageUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageUrl")
        }
      }
    }
  }
}

public final class GetOrdersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getOrders {
      orders {
        __typename
        id
        orderedAt
        totalAmount
        items {
          __typename
          quantity
        }
      }
    }
    """

  public let operationName: String = "getOrders"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orders", type: .nonNull(.list(.nonNull(.object(Order.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(orders: [Order]) {
      self.init(unsafeResultMap: ["__typename": "Query", "orders": orders.map { (value: Order) -> ResultMap in value.resultMap }])
    }

    /// リクエストしたユーザー自身のこれまでの注文を返す
    public var orders: [Order] {
      get {
        return (resultMap["orders"] as! [ResultMap]).map { (value: ResultMap) -> Order in Order(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Order) -> ResultMap in value.resultMap }, forKey: "orders")
      }
    }

    public struct Order: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("orderedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalAmount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, orderedAt: String, totalAmount: Int, items: [Item]) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "orderedAt": orderedAt, "totalAmount": totalAmount, "items": items.map { (value: Item) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// 注文確定日時
      public var orderedAt: String {
        get {
          return resultMap["orderedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "orderedAt")
        }
      }

      /// 合計金額
      public var totalAmount: Int {
        get {
          return resultMap["totalAmount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalAmount")
        }
      }

      /// 注文した商品とその個数のリスト
      public var items: [Item] {
        get {
          return (resultMap["items"] as! [ResultMap]).map { (value: ResultMap) -> Item in Item(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Item) -> ResultMap in value.resultMap }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OrderItem"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(quantity: Int) {
          self.init(unsafeResultMap: ["__typename": "OrderItem", "quantity": quantity])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// 注文した商品の個数
        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }
      }
    }
  }
}

public final class PostOrderMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation postOrder($items: [OrderItemInput!]!) {
      createOrder(input: {items: $items}) {
        __typename
        order {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "postOrder"

  public var items: [OrderItemInput]

  public init(items: [OrderItemInput]) {
    self.items = items
  }

  public var variables: GraphQLMap? {
    return ["items": items]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createOrder", arguments: ["input": ["items": GraphQLVariable("items")]], type: .object(CreateOrder.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOrder: CreateOrder? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOrder": createOrder.flatMap { (value: CreateOrder) -> ResultMap in value.resultMap }])
    }

    /// 注文を確定する
    public var createOrder: CreateOrder? {
      get {
        return (resultMap["createOrder"] as? ResultMap).flatMap { CreateOrder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createOrder")
      }
    }

    public struct CreateOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreateOrderPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("order", type: .object(Order.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(order: Order? = nil) {
        self.init(unsafeResultMap: ["__typename": "CreateOrderPayload", "order": order.flatMap { (value: Order) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// 確定した注文
      public var order: Order? {
        get {
          return (resultMap["order"] as? ResultMap).flatMap { Order(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "order")
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Order", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}
