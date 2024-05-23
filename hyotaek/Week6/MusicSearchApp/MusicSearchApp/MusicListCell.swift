import UIKit

class MusicListCell: UICollectionViewCell {
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artworkUrl100: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with musicInfo: MusicInfo) {
        trackName.text = musicInfo.trackName
        artistName.text = musicInfo.artistName
        collectionName.text = musicInfo.collectionName ?? "nil"
        releaseDate.text = formatReleaseDate(musicInfo.releaseDate)
        setImage(urlString: musicInfo.artworkUrl100)
    }
    
    private func formatReleaseDate(_ dateStr: String) -> String {
        let inputFormatter = ISO8601DateFormatter()
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: dateStr) {
            return outputFormatter.string(from: date)
        }
        return dateStr
    }
    
    private func setImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            artworkUrl100.image = UIImage(named: "placeholder")
            return
        }
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.artworkUrl100.image = image
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.artworkUrl100.image = UIImage(named: "placeholder")
                }
            }
        }
    }
}

extension MusicListCell {
    static var identifier: String {
        return String(describing: self)
    }
}
