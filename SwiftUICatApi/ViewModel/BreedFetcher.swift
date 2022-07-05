//
//  BreedFetcher.swift
//  SwiftUICatApi
//
//  Created by Inna Kokorina on 05.07.2022.
//

import Foundation
class BreedFetcher: ObservableObject {
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool? = false
    @Published var errorMessage: String? = nil
    
    init() {}
    
    func fetchAllBreeds() {
        isLoading = true
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            self.isLoading = false
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
                    self.breeds = breeds
                    print(breeds)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
