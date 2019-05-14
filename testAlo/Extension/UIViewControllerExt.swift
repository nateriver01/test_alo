import UIKit

// Dismiss keyboard when user tap anywhere 
extension UIViewController {
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func checkInputWithPattern(string: String, pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("Invalid Input")
        }
        
        return true
    }
    
    func checkInputMultiSpace(textField: UITextField, string: String) -> Bool {
        if textField.text?.last == " "  && string == " "{
            // If consecutive spaces entered by user
            return false
        }
        
        // If no consecutive space entered by user
        return true
    }
}
