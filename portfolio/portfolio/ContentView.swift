
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("About Me", destination: PersonalDataView())
                NavigationLink("Work Experience", destination: WorkExperienceView())
                NavigationLink("Academic Credentials", destination: AcademicCredentialsView())
                
                Divider()
                    
            }
            .navigationTitle("Resume")
        }
    }
}
#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
