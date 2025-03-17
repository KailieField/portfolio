import SwiftUI


struct ContentView: View {
    
    @State private var isMenuOpen = false
    @State private var isHamburgerRotated = false
    @State private var isPulsating = false

    
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
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("•")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                        Text("╭")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                        Text("╮")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                        Text("•")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                    }
//                    Spacer()
                    Text("Kailie Field")
                        .font(.system(size: 30, weight: .ultraLight, design: .monospaced))
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        Text("•")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                        Text("╰")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                        Text("╯")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                        Text("•")
                            .font(.system(size: 60, weight: .ultraLight))
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                .blur(radius: isMenuOpen ? 5 : 0)
                
                HStack {
                    
                    MenuView(sections: sections, isMenuOpen: $isMenuOpen)
                        .frame(width: 250)
                        .offset(x: isMenuOpen ? 0 : -250)
                        .animation(.easeInOut, value: isMenuOpen)
                        .transition(.moveAndFade)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        
                        Button(action: {
                            isMenuOpen.toggle()
                        }) {
                            
                            Image(systemName: isHamburgerRotated ? "xmark" : "line.horizontal.3") // -- hamburger menu icons
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 25, height: 25)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                                .rotationEffect(.degrees(isHamburgerRotated ? 45 : 0))
                                .animation(.rotateHamburger(duration: 0.3), value: isHamburgerRotated)
                                .scaleEffect(isPulsating ? 1.1 : 1)
                                .animation(.pulseEffect(), value: isPulsating)
                            
                        }
                        .padding(.leading, 190)
                        .padding(.top, 10)
                        .onAppear {
                            isPulsating = true
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
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            // --- menu header ---
            Text("Portfolio")
                .font(.system(size: 30, weight: .ultraLight, design: .monospaced))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.top)
            
            Divider()
                .background(Color.white)
            
            // --- dynamic section links ---
            ForEach(sections, id: \.self) { section in
                
                NavigationLink(destination: destinationView(for: section)){
                    
                    Text(section)
                        .font(.system(size: 15, weight: .ultraLight, design: .monospaced))
                        .padding()
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                        .background(
                            VisualEffectView(blurStyle: .systemMaterialDark).cornerRadius(10))
                    //                        .hoverEffect(.highlight)
                        .padding(.vertical, 20)
                        .scaleEffect(isMenuOpen ? 1.1 : 1)
                        .animation(.easeInOut(duration: 0.3), value: isMenuOpen)
                }
            }
            Divider()
                .background(Color.white)
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
        .background(VisualEffectView(blurStyle: .systemMaterialDark))
        .cornerRadius(20)
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
