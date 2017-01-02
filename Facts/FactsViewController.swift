// TODO: Sick UI when displaying fact (meaning you have to learn importing fonts, color of view backgrounds,etc)

import UIKit

class FactsViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {

    @IBOutlet weak var factInput: UITextField!
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var showFactButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        factInput.text = "0"
        factInput.addTarget(self, action: #selector(removeDefaultInput(textField:)), for: UIControlEvents.editingDidBegin)
        factInput.addTarget(self, action: #selector(checkIfInputIsEmpty(textField:)), for: UIControlEvents.allEditingEvents)
        
        keyboardDownOnTapGesture()
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationvc = segue.destination
            if let factvc = destinationvc as? ShowFactViewController {
                factvc.factNum = factInput.text!
            }
    }
    
    // MARK: - Gestures
    
    func keyboardDownOnTapGesture() {
        let keyboardDownGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(keyboardDownGestureRecognizer)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Detecting input on UITextField factInput
    
    func removeDefaultInput(textField: UITextField) -> Void {
        factInput.text = ""
    }
    
    func checkIfInputIsEmpty(textField: UITextField) -> Void {
        if textField.text!.isEmpty {
            showFactButton.isEnabled = false
        } else {
            showFactButton.isEnabled = true
        }
    }
    

}
