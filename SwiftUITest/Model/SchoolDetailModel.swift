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
}
