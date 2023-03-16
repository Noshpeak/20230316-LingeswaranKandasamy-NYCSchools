//
//  SchoolViewModel.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import Foundation

class SchoolViewModel: ObservableObject {
    @Published var schools = [School]()
    
    func getSchools() {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let schools = try JSONDecoder().decode([School].self, from: data)
                DispatchQueue.main.async {
                    self.schools = schools
                }
            } catch {
                print("Error decoding schools: \(error)")
            }
        }.resume()
    }
}
