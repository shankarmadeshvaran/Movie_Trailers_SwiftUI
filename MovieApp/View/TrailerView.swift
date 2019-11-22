
import SwiftUI
import SafariServices

struct TrailerView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            SafariView(movie: movie, safariVC: SFSafariViewController(url: URL(string: movie.trailerLink)!))
        }
    }
}

struct TrailerView_Preview: PreviewProvider {
    static var previews: some View {
        TrailerView(movie: moviesData.first!)
    }
}

struct SafariView: UIViewControllerRepresentable {
    let movie: Movie
    let safariVC: SFSafariViewController
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: URL(string: movie.trailerLink)!)
        return safariVC
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        uiViewController.dismissButtonStyle = .close
    }
}

struct SafariView_Preview: PreviewProvider {
    static var previews: some View {
        SafariView(movie: moviesData.first!, safariVC: SFSafariViewController.init(url: URL(string: moviesData.first!.trailerLink)!))
    }
}
