import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartState: CartState
    @State var isAleart: Bool = false
    @Binding var isCartViewPresented: Bool
    
    var body: some View {
        VStack{
            List{
                ForEach(cartState.batchProducts(), id: \.id) { product in
                    HStack(alignment: .top) {
                        RemoteImage(urlString: product.imageUrl)
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text(product.name)
                            Spacer().frame(height:8)
                            Text("\(product.price)円")
                                .frame(alignment: .leading)
                            Text("\(product.quantity) 個")
                            Spacer().frame(height:8)
                        }
                        .padding(.vertical, 8)
                    }
                }
                Text("合計: \(self.cartState.allPrice())円").bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }

            Button(action: {
                self.isAleart = true
            }) {
                Text("カートに追加する")
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $isAleart) {
                Alert(title: Text("注文完了！"),
                      message: Text("OKを押してください。"),
                      dismissButton: .default(Text("OK"), action: {
                        self.isCartViewPresented = false
                        self.cartState.products = []
                      }))
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("カート")
    }
}

//struct CartPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            CartPageView( isCartViewPresented: self.)
//        }
//    }
//}
