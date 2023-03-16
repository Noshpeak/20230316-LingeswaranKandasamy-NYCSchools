//
//  School.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import Foundation

struct School: Decodable, Identifiable {
    let id = UUID()
    let school_name: String
    let dbn: String
    let neighborhood: String
    let city: String
    let overview_paragraph: String
    let primary_address_line_1: String
    let zip: String
    let state_code: String
    let phone_number: String
    let website: String
    let school_email: String?
    let grades2018: String
    let total_students: String
    let start_time: String?
    let end_time: String?
    let attendance_rate: String
    let graduation_rate: String?
    let college_career_rate: String?
    let location: String

    
}
