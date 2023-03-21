//
//  SchoolDetailModel.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import Foundation


struct SchoolDetailModel: Decodable, Identifiable {
    let id = UUID()
    let school_name: String
    let dbn: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String

    private enum CodingKeys: String, CodingKey {
        case school_name
        case dbn
        case num_of_sat_test_takers
        case sat_critical_reading_avg_score
        case sat_math_avg_score
        case sat_writing_avg_score
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        school_name = try container.decode(String.self, forKey: .school_name)
        dbn = try container.decode(String.self, forKey: .dbn)
        num_of_sat_test_takers = try container.decode(String.self, forKey: .num_of_sat_test_takers)
        sat_critical_reading_avg_score = try container.decode(String.self, forKey: .sat_critical_reading_avg_score)
        sat_math_avg_score = try container.decode(String.self, forKey: .sat_math_avg_score)
        sat_writing_avg_score = try container.decode(String.self, forKey: .sat_writing_avg_score)
    }
}
