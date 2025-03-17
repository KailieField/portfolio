import SwiftUI

struct WorkExperienceView: View {
    
    let experience = workExperience
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack(spacing: 20){
                    ForEach(experience, id: \.jobTitle){ job in
                        VStack(alignment: .leading){
                            
                            Image("medical_badge")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 230)
                                .padding(.bottom, 20)
                                .frame(maxWidth: .infinity)
                            
                            Text(job.jobTitle)
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .padding(.bottom, 2)
                                .foregroundColor(.white)
                            
                            Text(job.company)
                                .font(.system(size: 15, weight: .ultraLight, design: .monospaced))
                                .foregroundColor(.gray)
                                .padding(.bottom, 2)
                            
                            Text("From \(job.startDate) to \(job.endDate)")
                                .font(.system(size: 15, weight: .bold, design: .monospaced))
                                .padding(.bottom, 2)
                                .foregroundColor(.white)
                            
                            Text(job.description)
                                .font(.system(size: 13, weight: .ultraLight, design: .monospaced))
                                .padding(.bottom, 2)
                                .foregroundColor(.white)
                            
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding(.top, 30)
            }
        }
        .navigationTitle("Work History")
        .navigationBarHidden(true)
    }
}
        
//        List(experience, id: \.jobTitle) { job in
//            
//            VStack(alignment: .leading){
//                Text(job.jobTitle)
//                    .font(.system(size: 20, weight: .bold, design: .monospaced))
//                    .padding(.bottom, 2)
//                Text(job.company)
//                    .font(.system(size: 15, weight: .ultraLight, design: .monospaced))
//                    .foregroundColor(.secondary)
//                    .padding(.bottom, 2)
//                Text("From \(job.startDate) to \(job.endDate)")
//                    .font(.system(size: 15, weight: .bold, design: .monospaced))
//                    .padding(.bottom, 2)
//                Text(job.description)
//                    .font(.system(size: 13, weight: .ultraLight, design: .monospaced))
//                    .padding(.bottom, 2)
//            }
//            
//            .padding()
//        }
//        
//        .navigationTitle("Work History")
//    }

//}

struct WorkExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        WorkExperienceView()
    }
}
