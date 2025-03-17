import SwiftUI
import Foundation

struct ArtProjectsView: View {
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
                ScrollView {
                    VStack(spacing: 0){
                        ForEach(artProjects, id: \.title) { project in
                            VStack {
                                Image(project.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width)
                                    .clipped()

                            }
                        }
                    }
                    .background(Color.black)
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("Art Projects", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }

struct ArtProjectsDetailView: View {
    
    let project: ArtProject
    
    var body: some View {
        ScrollView {
            VStack {
                Text(project.title)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Image(project.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: UIScreen.main.bounds.height * 0.6)
//                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                Text(project.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .navigationTitle(project.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    ArtProjectsView()
}

