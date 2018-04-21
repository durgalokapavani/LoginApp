
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Signup_Label: UILabel!
    @IBOutlet weak var attributedLabel: UILabel!
    
    @IBOutlet weak var Textfield_Password: UITextField!
    @IBOutlet weak var Textfield_Username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
        self.Signup_Label.layer.cornerRadius = 20
        self.Signup_Label.layer.masksToBounds = true
        self.Signup_Label.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        self.Signup_Label.layer.borderWidth = 0.5
        
        Textfield_Username.delegate = self
        Textfield_Password.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
 
        let myMutableTitle = NSMutableAttributedString(string: "Have an account already?", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15.0)])
        let mutDj = NSMutableAttributedString(string: " Log In", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 15.0), NSAttributedStringKey.foregroundColor: UIColor.white])
        myMutableTitle.append(mutDj)
        
        self.attributedLabel.attributedText = myMutableTitle
        
        
    }

    deinit {
         NotificationCenter.default.removeObserver(self,name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == Textfield_Username
        {
            Textfield_Password.becomeFirstResponder()
        }
        else if textField == Textfield_Password
        {
            textField.resignFirstResponder()
        }
       
        return true
    }
    
    @objc func keyboardWillChange(notification: Notification)
    {
        view.frame.origin.y = -100
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}


