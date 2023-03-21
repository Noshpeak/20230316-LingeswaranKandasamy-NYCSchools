//
//  SchoolScreen.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import SwiftUI

struct SchoolScreen: View {
    
    @StateObject private var viewModel = SchoolViewModel()
    @State private var searchText = ""
    
    var filteredSchools: [School] {
        if searchText.isEmpty {
            return viewModel.schools
        } else {
            return viewModel.schools.filter { school in
                school.school_name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                List(filteredSchools) { school in
                    NavigationLink(value: school){
                        VStack(alignment: .leading) {
                            HStack {
                                let schoolName = (school.school_name)
                                let firstLetter = schoolName.prefix(2)
                                let abbreviatedSchoolName = "\(firstLetter)"
                                
                                TextView(text: abbreviatedSchoolName, size: 22, color: .white, fontWeight: .semibold)
                                    .textCase(.uppercase)
                                    .padding(3)
                                    .frame(width: 60, height: 60)
                                    .background(Color.blue.opacity(0.5))
                                    .cornerRadius(50)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    Text(school.school_name)
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    HStack {
                                        Text(school.neighborhood)
                                            .font(.system(size: 12))
                                        Text(school.city)
                                            .font(.system(size: 12))
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    
                }
                
                .onAppear {
                    Task {
                        await viewModel.fetchSchoolData()
                    }
                }
                
                
                .navigationBarTitle("NYC High Schools")
                .navigationDestination(for: School.self) { school in
                    SchoolDetailScreen(school: school)
                }
            }
        }
    }
}


struct SchoolScreen_Previews: PreviewProvider {
    static var previews: some View {
        SchoolScreen()
    }
}

