import SwiftUI

struct ProductDetailPageView: View {
    @EnvironmentObject var cartState: CartState
    @State var isCartViewPresented: Bool = false
    var product: FetchProductsQuery.Data.Product
    var body: some View {
        ScrollView{
            RemoteImage(urlString: product.imageUrl)
                .scaledToFit()
                .frame(alignment: .top)
            Spacer().frame(height:16)
            Text(product.name).bold()
                .frame(maxWidth: .infinity, alignment: .leading).font(.title)
                .padding(.leading, 10)
            Spacer().frame(height:8)
            Text("\(product.price) 円").frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            Spacer().frame(height:8)
            Text(product.summary)
                .font(.subheadline).padding(10)
            Spacer().frame(height:16)
            Button(action: {
                self.cartState.products.append(product)
                print(self.cartState.products.count)
            }) {
                Text("カートに追加する")
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    self.isCartViewPresented = true
                }) {
                    VStack{
                        Image(systemName: "folder")
                        Text("\(self.cartState.products.count)")
                        
                    }
                }
            }
        }
        .sheet(isPresented: $isCartViewPresented) {
            NavigationView {
                CartPageView()
            }
        }
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
