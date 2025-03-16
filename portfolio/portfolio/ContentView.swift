
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Personal Data", destination: PersonalDataView())
                NavigationLink("Academic Credentials", destination: AcademicCredentialsView())
            }
            .navigationTitle("Portfolio")
        }
    }
}
#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
