import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartState: CartState
    var body: some View {
        List(cartState.products, id: \.id) { product in
            HStack(alignment: .top) {
                RemoteImage(urlString: product.imageUrl)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text(product.name)
                    Spacer().frame(height:8)
                    Text("\(product.price)円")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("カート")
    }
}

struct CartPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CartPageView()
        }
    }
}
