import Foundation

class NetworkManager: ObservableObject {
    
    private let config = URLSessionConfiguration.default
    
    init() {
        config.waitsForConnectivity = true
    }
    
    func requestUserAccess(for participant_id: String) {
        
        var request = URLRequest(url: URL(string: "https://6ed007d9c0de.ngrok.io/authentication.php")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "participant_id": participant_id
        ]
        request.httpBody = parameters.percentEncoded()
        
        URLSession(configuration: config).dataTask(with: request) { (data, response, error) in
        }.resume()
    }
    
    func fetchUserStatus(completion: @escaping (UserStatus?) -> Void) {
        let request = URLRequest(url: URL(string: "https://flavio8699.github.io/Goodness-Groceries/user.json")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let json = try? JSONDecoder().decode(UserStatus.self, from: data!)
            DispatchQueue.main.async {
                completion(json)
            }
        }.resume()
    }
    
    func fetchProductsBought(completion: @escaping ([ProductBought]?) -> Void) {
        let request = URLRequest(url: URL(string: "https://flavio8699.github.io/Goodness-Groceries/tickets_caisse.json")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let json = try? JSONDecoder().decode([ProductBought].self, from: data!)
            DispatchQueue.main.async {
                completion(json)
            }
        }.resume()
    }
}