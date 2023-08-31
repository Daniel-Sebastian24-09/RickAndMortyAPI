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
        personImg.backgroundColor = .gray
        
        configure(with: person)
    }
    
    func configure (with person: Person){
        personName.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        personLocate.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        personTipo.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        personEspecie.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        personStatus.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        personName.text = person.name
        personImg.download(from: person.image)
        personLocate.text = "Location: \(person.location.name)"
        personTipo.text = "Gender: \(person.gender)"
        personEspecie.text = "Species: \(person.species)"
        
        if (person.status == "Alive") {
            personStatus.textColor = UIColor(displayP3Red: 90/255, green: 175/255, blue: 76/255, alpha: 1)
        }
        if (person.status == "Dead") {
            personStatus.textColor = UIColor(displayP3Red: 207/255, green: 57/255, blue: 43/255, alpha: 1)
        }
        
        personStatus.text = "Status: \(person.status)"
        
        
    }
    
}
