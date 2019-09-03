

import SwiftUI
import Combine

struct HomeView : View {
    var catagories: [String: [Movie]] {
        .init(grouping: moviesData,
              by: {$0.catagory.rawValue}
        )
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical , showsIndicators: false) {
                VStack {
                    ScrollableView()
                    VStack {
                        ForEach(catagories.keys.sorted(), id: \String.self) { key in
                            MovieRow(catagoryName: key, movies: self.catagories[key]!)
                                .frame(height: 320)
                                .padding(.top)
                                .padding(.bottom)
                        }
                    }
                    .padding()
                }
                .navigationBarTitle(Text("MOVIES").bold())
            }
        }
    }
}
