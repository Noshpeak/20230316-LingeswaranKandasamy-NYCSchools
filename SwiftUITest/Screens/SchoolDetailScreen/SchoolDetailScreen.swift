//
//  SchoolDetailScreen.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import SwiftUI

struct SchoolDetailScreen: View {
    @StateObject private var viewModel = SchoolDetailViewModel()
    
    let school: School
    var body: some View {
        VStack {
            
            VStack( spacing: 10) {
                
                TextView(text: school.school_name, size: 19, color: .black, fontWeight: .bold)
                
                HStack{
                    TextView(text: school.neighborhood, size: 15, color: .black, fontWeight: .regular)
                    TextView(text: school.city, size: 15, color: .black, fontWeight: .regular)
                    
                }
                
                VStack(alignment: .center){
                    HStack {
                        ResizableImage(systemName: "location.square.fill", color: .blue.opacity(0.5), size: 20)
                        VStack{
                            TextView(text: school.primary_address_line_1, size: 12, color: .black, fontWeight: .regular)
                            HStack{
                                TextView(text: school.city, size: 12, color: .black, fontWeight: .regular)
                                TextView(text: school.state_code, size: 12, color: .black, fontWeight: .regular)
                                TextView(text: school.zip, size: 12, color: .black, fontWeight: .regular)
                            }
                        }
                    }
                    
                    HStack{
                        ResizableImage(systemName: "phone.bubble.left.fill", color: .blue.opacity(0.5), size: 20)
                        Button(action: {
                            guard let number = URL(string: "tel://" + school.phone_number) else { return }
                            UIApplication.shared.open(number)
                        }, label: {
                            TextView(text: school.phone_number, size: 12, color: .black, fontWeight: .semibold)
                        })
                    }
                    
                    HStack{
                        ResizableImage(systemName: "pc", color: .blue.opacity(0.5), size: 20)
                        Button(action: {
                            if let url = URL(string: school.website), UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        }, label: {
                            Text(school.website)
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                        })
                    }
                    
                    HStack{
                        ResizableImage(systemName: "envelope.badge.fill", color: .blue.opacity(0.5), size: 20)
                        TextView(text:school.school_email ?? "", size: 12, color: .black, fontWeight: .semibold)
                        
                    }
                }
                
                RoundedRectangleView()
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading){
                        TextView(text:"Overview", size: 22, color: .black, fontWeight: .bold)
                            .padding()
                        
                        
                        VStack(alignment: .leading, spacing: 15){
                            TextView(text:"Grades: \(school.grades2018)", size: 15, color: .black, fontWeight: .semibold)
                            
                            TextView(text:"Total Students: \(school.total_students)", size: 15, color: .black, fontWeight: .semibold)
                            TextView(text:"School Time: \(school.start_time ?? "") - \(school.end_time ?? "")", size: 15, color: .black, fontWeight: .semibold)
                            
                            
                            if let attendanceRate = Float(school.attendance_rate) {
                                let roundedAttendanceRate = String(format: "%.2f", attendanceRate)
                                let attendanceRateText = roundedAttendanceRate + "%"
                                TextView(text:"Attendance Rate: \(attendanceRateText)", size: 15, color: .black, fontWeight: .semibold)
                            } else {
                                Text("Attendance Rate: N/A")
                            }
                            
                            TextView(text:"Graduation Rate: \(school.graduation_rate ?? "N/A")", size: 15, color: .black, fontWeight: .semibold)
                            TextView(text:"College Career Rate: \(school.college_career_rate ?? "N/A")", size: 15, color: .black, fontWeight: .semibold)
                            
                        }
                        
                        HStack{
                            
                            if let schoolDetail = viewModel.schoolsDetails?.last {
                                TextView(text:"SAT: Reading: \(schoolDetail.sat_critical_reading_avg_score) | Writing: \(schoolDetail.sat_writing_avg_score)| Math: \(schoolDetail.sat_math_avg_score)", size: 15, color: .black, fontWeight: .semibold)
                            } else {
                                Text("No SAT data available")
                            }
                            
                            
                        }
                        .padding()
                        .background(Color("Blue"))
                        
                        RoundedRectangleView()
                            .padding(.horizontal)
                            .padding(.vertical)
                        
                        TextView(text:"School Description", size: 20, color: .black, fontWeight: .bold)
                        TextView(text:school.overview_paragraph, size: 15, color: .black, fontWeight: .semibold)
                            .padding(.top)
                    }
                    .padding(20)
                }
                Spacer()
            }
        }
        .onAppear {
            viewModel.getSchoolsDetails(for: school.dbn)
        }
    }
}

struct SchoolDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

