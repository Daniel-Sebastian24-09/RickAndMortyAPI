import UIKit

class DetalheViewControler: UIViewController {
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personImg: UIImageView!
    @IBOutlet weak var personLocate: UILabel!
    @IBOutlet weak var personTipo: UILabel!
    @IBOutlet weak var personEspecie: UILabel!
    @IBOutlet weak var personStatus: UILabel!
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personImg.layer.cornerRadius = 8
        personImg.layer.masksToBounds = true
        personImg.contentMode = .scaleAspectFill
        personImg.backgroundColor = .blue
        
        configure(with: person)
    }
    
    func configure (with person: Person){
        personName.text = person.name
        personImg.download(from: person.image)
        personLocate.text = "Location: \(person.location.name)"
        personTipo.text = "Gender: \(person.gender)"
        personEspecie.text = "Species: \(person.species)"
        personStatus.text = "Status: \(person.status)"
        
        
    }
    
}
