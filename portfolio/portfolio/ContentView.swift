
import SwiftUI


struct ContentView: View {
    
    @State private var isMenuOpen = false
    
    let sections = [
        "Personal Data",
        "Work History",
        "Education",
        "Academic Work"
//        "Hobbies"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Kailie Field")
                        .font(.largeTitle)
                        .padding()
                    
                    Spacer()
                }
                .blur(radius: isMenuOpen ? 5 : 0)
                
                HStack {
                    MenuView(sections: sections)
                        .frame(width: 250)
                        .offset(x: isMenuOpen ? 0 : -250)
                        .animation(.easeInOut, value: isMenuOpen)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            isMenuOpen.toggle()
                        }) {
                            Image(systemName: "line.horizontal.3") // -- hamburger menu icons
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true) // hide nav bar in ContentView
        }
    }
}

struct MenuView: View{
    let sections: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            // --- menu header ---
            Text("Kailie Field")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Divider()
            // --- dynamic section links ---
            ForEach(sections, id: \.self) { section in
                NavigationLink(destination: destinationView(for: section)){
                    Text(section)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                }
            }
            Divider()
            Spacer()
            
            VStack {
                // --- footer ---
                Text("kailie.field@gmail.com")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .shadow(radius: 5)
    }
    func destinationView(for section: String) -> some View {
        switch section {
        case "Personal Data":
            return AnyView(PersonalDataView())
        case "Work History":
            return AnyView(WorkExperienceView())
        case "Education":
            return AnyView(AcademicCredentialsView())
        case "Academic Work":
            return AnyView(BlogWritingView())
//        case "Hobbies":
//            return AnyView(HobbiesView())
        default:
            return AnyView(Text("Coming soon!"))
        }
    }
}

#Preview {
    ContentView()
}
