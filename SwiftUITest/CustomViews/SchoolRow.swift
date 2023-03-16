//
//  SchoolRow.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import SwiftUI


struct SchoolRow: View {
    let school: School
    
    var body: some View {
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


struct SchoolRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
