
import UIKit
import  CoreData
class AddCollegeViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var addCollegeLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if nameTF.text != "" && addressTF.text != ""{
            
            var appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context1 = appDel.persistentContainer.viewContext
            var collegeOb = NSEntityDescription.entity(forEntityName: "College", in: context1)
        let collegeOb1 =   NSManagedObject(entity: collegeOb!, insertInto: context1) as! College
            
            collegeOb1.name = nameTF.text!
            collegeOb1.address = addressTF.text!

            var _ : NSError? = nil
            do{
                try context1.save()
                
                let otherAlert = UIAlertController(title: "Suceess", message: "College has been saved🥸", preferredStyle: .actionSheet)

                let printSomething = UIAlertAction(title: "Ok", style: .default) { _ in
                    print("We can run a block of code." )
                    
                    self.navigationController?.popViewController(animated: true)
                    
                }
                    // relate actions to controllers
                    otherAlert.addAction(printSomething)
                
                present(otherAlert, animated: true, completion: nil)
                
                
            }catch{
                print("error while save data")
                
            }
            
            
        }else{
            let otherAlert = UIAlertController(title: "Multiple Actions", message: "The alert has more than one action which means more than one button.", preferredStyle: .actionSheet)

            let printSomething = UIAlertAction(title: "Noops🥸", style: .default) { _ in
                print("We can run a block of code." )
            }
                // relate actions to controllers
                otherAlert.addAction(printSomething)
            
            present(otherAlert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == ""{
            return true
        }
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
