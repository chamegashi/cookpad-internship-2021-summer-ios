import Foundation
import Combine

final class CartState: ObservableObject {
    @Published var products: [FetchProductsQuery.Data.Product] = []
    func allPrice() -> Int {
        var price: Int = 0
        for product in products{
            price = price + product.price
        }
        return price
    }
    
    struct batchProductsData {
        var id: String
        var name: String
        var price: Int
        var imageUrl: String
        var quantity: Int
    }
    
    func batchProducts() -> [batchProductsData] {
        var retArray: [batchProductsData] = []
        
        for product in products{
            var flag = false
            for (index, batchProduct) in retArray.enumerated() {
                if(batchProduct.name == product.name){
                    retArray[index].quantity = retArray[index].quantity + 1
                    flag = true
                    break
                }
            }
            if(!flag){
                let appendProduct: batchProductsData = batchProductsData(
                    id: product.id,
                    name: product.name,
                    price: product.price,
                    imageUrl: product.imageUrl,
                    quantity: 1)
                retArray.append(appendProduct)
            }
        }
        return retArray
    }
}
