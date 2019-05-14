import UIKit

extension UITextView {
    func addPadding(value: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
}
