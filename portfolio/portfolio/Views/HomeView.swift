import SwiftUI

struct HomeView: View {
    let bio = "Multi-Technologist specializing in emerging tech, research and development."
    let philosophy = "I believe in blending advanced technology with humanistic principles, prioritizing the futre of humanity through innovation and collaboration."
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Bio")
                    .font(.title)
                    .bold()
                    .padding(.top)
                Text(bio)
                    .font(.body)
                    .padding()
                
                Divider()
                
                Text(philosophy)
                    .font(.body)
                    .padding()
                
                Spacer()
            }
            navigationBarTitle("Home")
        }
    }
}
#Preview {
    HomeView()
}
