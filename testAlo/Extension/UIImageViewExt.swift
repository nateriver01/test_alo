import UIKit
import SDWebImage

extension UIImageView {
    func setImageFromUrl(url: URL) {
        self.sd_setImage(
            with: url,
            placeholderImage: nil, options: .allowInvalidSSLCertificates,
            completed: nil
        )
    }
    
    func setImageFromUrl(url: URL, completion: @escaping (UIImage) -> Void) {
        self.sd_setImage(
            with: url,
            placeholderImage: nil, options: .allowInvalidSSLCertificates,
            completed: { (image, error, cacheType, imageURL) in
                if image != nil {
                    completion(image!)
                }
        })
    }
}
