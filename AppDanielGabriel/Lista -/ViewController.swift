import UIKit

class ViewController: UIViewController {
    
    private var persons: [Person]  = []
    
    //1
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Rick and Morty - Character"
        return label
        
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.backgroundColor = UIColor(red: 230/255, green: 224/255, blue: 206/255, alpha: 1)
        return table
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView(){
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
        fetchRemotePersons()
    }
    
    //2
    private func addViewsInHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    // 3
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        
        ])
        
    }
    
    private func fetchRemotePersons() {
        let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(Int.random(in: 1...42))")!
        
        let request = URLRequest(url: url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil { return }
            
            guard let data else { return }
            
            guard let remotePersons = try? decoder.decode(TMDBRemotePerson.self, from: data) else { return }
            
            self.persons = remotePersons.results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PersonCell()
        let person = persons[indexPath.row]
        cell.setup(persons: person)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = persons[indexPath.row]
        let storyBoard = UIStoryboard(name: "detalhes", bundle: Bundle(for: DetalheViewControler.self))
        let detalheViewControler = storyBoard.instantiateViewController(withIdentifier: "detalhes") as! DetalheViewControler
        detalheViewControler.person = person
        navigationController?.pushViewController(detalheViewControler, animated: true)
    }
}
