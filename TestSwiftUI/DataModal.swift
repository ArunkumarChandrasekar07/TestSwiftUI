//
//  DataModal.swift
//  DataModal
//
//  Created by Arunkumar Chandrasekar on 11/09/21.
//

import Foundation

struct DataModal: Codable, Hashable {
    let id: Int
    var albumId: Int
    var url: String
    var thumbnailUrl: String
    var title: String
}

class API: ObservableObject {
    
    @Published var data = [DataModal]()
    
    func loadData(completion:@escaping ([DataModal]) -> ()) {
        guard let url = URL(string: AppConstants.dataUrl) else {
            print("Invalid Url....")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let dataModal = try! JSONDecoder().decode([DataModal].self, from: data)
            print(dataModal)
            DispatchQueue.main.async {
                completion(dataModal)
            }
        }.resume()
    }
}
