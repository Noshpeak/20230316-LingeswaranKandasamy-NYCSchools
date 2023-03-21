//
//  SchoolDetailViewModel.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import Foundation

class SchoolViewModel: ObservableObject {
    @Published var schoolsDetails: [SchoolDetailModel]?
    @Published var schools = [School]()
    @Published var isFetching = false
    
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            if let httpResponse = response as? HTTPURLResponse {
                throw NetworkError.invalidResponse(statusCode: httpResponse.statusCode)
            } else {
                throw NetworkError.unknownResponse
            }
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError(error)
        }
    }

    
    @MainActor
    func fetchSchoolData() async {
        do {
            let schools: [School] = try await fetchData(from: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
            self.schools = schools
        } catch let error as NetworkError {
            switch error {
            case .invalidURL:
                print("Invalid URL")
            case .invalidResponse(let statusCode):
                print("Invalid response with status code \(statusCode)")
            case .decodingError(let error):
                print("Error decoding data: \(error)")
            case .unknownResponse:
                print("Unknown response")
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    
    
    func fetchSchoolDetailData(dbn: String) {
        Task {
            do {
                let schoolsDetail: [SchoolDetailModel] = try await fetchData(from: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)")
                DispatchQueue.main.async {
                    self.schoolsDetails = schoolsDetail
                }
            } catch let error as NetworkError {
                switch error {
                case .invalidURL:
                    print("Invalid URL")
                case .invalidResponse(let statusCode):
                    print("Invalid response with status code \(statusCode)")
                case .decodingError(let error):
                    print("Error decoding data: \(error)")
                case .unknownResponse:
                    print("Unknown response")
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    
    // NetworkError enum for error handling
    enum NetworkError: Error {
        case invalidURL
        case invalidResponse(statusCode: Int)
        case decodingError(Error)
        case unknownResponse
    }
}


