
import UIKit

class FactsViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var factInput: UITextField!
    @IBOutlet var backgroundView: UIView!
    
    @IBAction func showFact(_ sender: UIButton) {
       print("done button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

}
