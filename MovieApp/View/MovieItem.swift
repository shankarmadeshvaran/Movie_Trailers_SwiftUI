

import SwiftUI

struct MovieItem : View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(movie.thumbnail)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text(movie.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
        }
    }
}

struct MovieItem_Preview: PreviewProvider {
    static var previews: some View {
        MovieItem(movie: moviesData.first!)
    }
}
