import SwiftUI

struct SearchView: View {
    
    let products: [Product]
    
    var body: some View {
        VStack (spacing: 0) {
            if products.count > 0 {
                ForEach(products, id: \.self) { product in
                    NavigationLink(destination: ProductView(product: product, category: nil)) {
                        ProductRowView(product: product, category: nil)
                            .foregroundColor(.black)
                            .animation(Animation.default)
                    }
                    Divider()
                }
            } else {
                Text("Sorry, no products found").padding(.vertical, 10)
            }
            Spacer(minLength: 0)
        }
    }
}
