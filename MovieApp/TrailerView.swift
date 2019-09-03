
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
