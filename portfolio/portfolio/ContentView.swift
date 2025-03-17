
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Resume", destination: PersonalDataView())
                NavigationLink("Academic Writing", destination: BlogWritingView())
//                NavigationLink("Work Experience", destination: WorkExperienceView())
//                NavigationLink("Academic Credentials", destination: AcademicCredentialsView())
                
                Divider()
                    
            }
            .navigationTitle("Portfolio")
        }
    }
}
#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
