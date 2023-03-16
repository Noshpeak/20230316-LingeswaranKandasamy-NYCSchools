//
//  SchoolDetailViewModel.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import Foundation

class SchoolDetailViewModel: ObservableObject {
    @Published var schoolsDetails: [SchoolDetailModel]?

    func getSchoolsDetails(for dbn: String) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            do {
                let schoolDetails = try JSONDecoder().decode([SchoolDetailModel].self, from: data)
                DispatchQueue.main.async {
                    self.schoolsDetails = schoolDetails
                }
            } catch {
                print("Error decoding schools: \(error)")
            }
        }.resume()
    }
}


enum NetworkError: Error {
    case invalidURL
    case noData
}
