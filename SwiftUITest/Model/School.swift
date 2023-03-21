//
//  School.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import Foundation

struct School: Decodable, Identifiable, Hashable {
    let id: UUID
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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        school_name = try container.decode(String.self, forKey: .school_name)
        dbn = try container.decode(String.self, forKey: .dbn)
        neighborhood = try container.decode(String.self, forKey: .neighborhood)
        city = try container.decode(String.self, forKey: .city)
        overview_paragraph = try container.decode(String.self, forKey: .overview_paragraph)
        primary_address_line_1 = try container.decode(String.self, forKey: .primary_address_line_1)
        zip = try container.decode(String.self, forKey: .zip)
        state_code = try container.decode(String.self, forKey: .state_code)
        phone_number = try container.decode(String.self, forKey: .phone_number)
        website = try container.decode(String.self, forKey: .website)
        school_email = try container.decodeIfPresent(String.self, forKey: .school_email)
        grades2018 = try container.decode(String.self, forKey: .grades2018)
        total_students = try container.decode(String.self, forKey: .total_students)
        start_time = try container.decodeIfPresent(String.self, forKey: .start_time)
        end_time = try container.decodeIfPresent(String.self, forKey: .end_time)
        attendance_rate = try container.decode(String.self, forKey: .attendance_rate)
        graduation_rate = try container.decodeIfPresent(String.self, forKey: .graduation_rate)
        college_career_rate = try container.decodeIfPresent(String.self, forKey: .college_career_rate)
        location = try container.decode(String.self, forKey: .location)
    }

    private enum CodingKeys: String, CodingKey {
        case school_name
        case dbn
        case neighborhood
        case city
        case overview_paragraph
        case primary_address_line_1
        case zip
        case state_code
        case phone_number
        case website
        case school_email
        case grades2018
        case total_students
        case start_time
        case end_time
        case attendance_rate
        case graduation_rate
        case college_career_rate
        case location
    }
}
