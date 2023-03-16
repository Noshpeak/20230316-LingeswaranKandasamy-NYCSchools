//
//  SchoolScreen.swift
//  SwiftUITest
//
//  Created by Lingeswaran Kandasamy on 3/16/23.
//

import SwiftUI

struct SchoolScreen: View {
    @StateObject var vm = SchoolViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.schools) { school in
                NavigationLink(destination: SchoolDetailScreen(school: school)) {
                    SchoolRow(school: school)
                        .padding(.vertical)
                }
                
            }
            .navigationBarTitle("NYC High Schools")
            .onAppear {
                vm.getSchools()
            }
        }
    }
}

struct SchoolScreen_Previews: PreviewProvider {
    static var previews: some View {
        SchoolScreen()
    }
}
