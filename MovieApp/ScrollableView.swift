
import SwiftUI

struct ScrollableView : View {
   
    var body: some View {
        Image("turtlerock")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 225)
            .clipped()
    }
}
