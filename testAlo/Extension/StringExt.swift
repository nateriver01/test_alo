import UIKit

// Use this htmlToAttributedString function to convert html data to attributed string format
extension String {
    var resetSeparator: String {
        return self.replacingOccurrences(of: ".", with: "")
    }
    
    func htmlToAttributedString(font: String?, size: CGFloat) -> NSAttributedString? {
        do {
            // You can add css styling here using style block
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "font-family: \(font ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("Can't parse html data: ", error)
            return nil
        }
    }
}

// Use this formattedWithSeparator property to convert Int data to formatted String
// i.e: 10000.formattedWithSeparator -> "10.000"
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}
extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
