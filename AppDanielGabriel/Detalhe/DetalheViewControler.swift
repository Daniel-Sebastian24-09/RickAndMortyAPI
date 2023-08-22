import UIKit

class DetalheViewControler: UIViewController {
   @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personImg: UIImageView!
    
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personImg.layer.cornerRadius = 8
        personImg.layer.masksToBounds = true
        personImg.contentMode = .scaleAspectFill
        personImg.backgroundColor = .blue
        
        personName.text = person.name
    }
    
}
