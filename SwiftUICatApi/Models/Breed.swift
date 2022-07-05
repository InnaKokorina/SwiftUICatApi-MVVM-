//
//  Breed.swift
//  SwiftUICatApi
//
//  Created by Inna Kokorina on 05.07.2022.
//

import Foundation
//[{"weight":{"imperial":"7  -  10","metric":"3 - 5"},"id":"abys","name":"Abyssinian","cfa_url":"http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
//"vetstreet_url":"http://www.vetstreet.com/cats/abyssinian","vcahospitals_url":"https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
//"temperament":"Active, Energetic, Independent, Intelligent, Gentle","origin":"Egypt","country_codes":"EG","country_code":"EG","description":
//"The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
//"life_span":"14 - 15","indoor":0,"lap":1,"alt_names":"","adaptability":5,"affection_level":5,"child_friendly":3,"dog_friendly":4,"energy_level":5,
//"grooming":1,"health_issues":2,"intelligence":5,"shedding_level":2,"social_needs":5,"stranger_friendly":5,"vocalisation":1,"experimental":0,
//"hairless":0,"natural":1,"rare":0,"rex":0,"suppressed_tail":0,"short_legs":0,"wikipedia_url":"https://en.wikipedia.org/wiki/Abyssinian_(cat)",
//"hypoallergenic":0,"reference_image_id":"0XYvRd7oD","image":{"id":"0XYvRd7oD","width":1204,"height":1445,"url":"https://cdn2.thecatapi.com/images/0X}}
//

struct Breed: Codable, CustomStringConvertible {
    var id: String
    var name: String
    var temperament: String
    var breedExplaination: String
    var energyLevel: Int
    var isHairless: Bool
    var image: BreedImage
    
    var description: String {
        return "breed with name: \(name) and id \(id), energy level: \(energyLevel) is Hairless: \(isHairless ? "YES" : "NO")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        image = try values.decode(BreedImage.self, forKey: .image)
    }
}
