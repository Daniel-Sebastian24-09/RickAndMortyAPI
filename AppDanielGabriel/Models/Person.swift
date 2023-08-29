struct Person: Decodable{
    struct Location: Decodable {
            let name: String
            let url: String
        }
    
    let name: String
    let image: String
    let status: String
    let species: String
    let gender: String
    let location: Location
}
