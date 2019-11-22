
import SwiftUI

struct MovieRow : View {
    var catagoryName: String
    var movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.catagoryName)
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(self.movies,id: \.title) { movie in
                        NavigationLink(destination: MovieDetail(movie: movie)) {
                            MovieItem(movie: movie)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                                .cornerRadius(10)
                                .clipped()
                        }
                    }
                }
            }
        }
    }
}

struct MovieRow_Preview: PreviewProvider {
    static var previews: some View {
        MovieRow(catagoryName: "Marvel", movies: load("movies.json"))
    }
}
