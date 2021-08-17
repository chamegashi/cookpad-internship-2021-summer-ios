import SwiftUI

struct ProductDetailPageView: View {
    var product: FetchProductsQuery.Data.Product
    var body: some View {
//        HStack(alignment: .top){
//        }
//        RemoteImage(urlString: product.imageUrl)
//            .scaledToFit()
//            .frame(alignment: .top)
//        Spacer().frame(height:10)
//        Text(product.name)
//        Spacer().frame(height:8)
//        Text(product.summary)
    }
}

struct ProductDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailPageView(
                product: FetchProductsQuery.Data.Product(
                    id: UUID().uuidString,
                    name: "商品 \(1)",
                    price: 100,
                    summary: "おいしい食材 \(1)",
                    imageUrl: "https://image.mini-mart.com/dummy/1"
                )
            )
        }
    }
}
