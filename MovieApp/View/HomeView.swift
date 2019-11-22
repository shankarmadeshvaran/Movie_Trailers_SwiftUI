import SwiftUI
import Combine

struct HomeView : View {
    var catagories: [String: [Movie]] {
        .init(grouping: moviesData,
              by: {$0.catagory.rawValue}
        )
    }
    var featuredMovies = moviesData.filter({$0.isFeaturedMovie == true})
    var body: some View {
        NavigationView {
            ScrollView(.vertical , showsIndicators: false) {
                VStack {
                    NavigationLink(destination: MovieDetail(movie: featuredMovies[0])) {
                        PageView(featuredMovies.map { FeaturedMovieView(movie: $0) })
                            .frame(height: 225)
                    }
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

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct FeaturedMovieView: View {
    var movie: Movie
    var body: some View {
            ZStack(alignment: .bottom) {
                Image(movie.thumbnail)
                    .resizable()
                    .clipped()
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.35)
                    .blur(radius: 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .foregroundColor(.white)
                            .bold()
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
            }
    }
}

struct FeaturedMovieView_Preview: PreviewProvider {
    static var previews: some View {
        FeaturedMovieView(movie: moviesData.first!)
    }
}
