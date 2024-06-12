
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        GeometryReader{
            geometry in
            
            NavigationStack{
                VStack{
                    ZStack{
                        VStack{
                            Text("This is")
                                .font(Font.custom("Bodoni 72", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            Text(" “HANABI”")
                                .font(Font.custom("Bodoni 72", size: 24))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            Text("Your own fireworks show")
                                .font(Font.custom("Bodoni 72", size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.top,1)
                        }
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 790, height: 790)
                            .background(
                                Image("icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 790, height: 790)
                                    .clipped()
                            )
                            .opacity(0.5)
                    }
                    NavigationLink{
                        MainView()
                            .preferredColorScheme(.dark)
                    }label: {
                        ZStack{
                            Text("Start the show")
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 186, height: 41, alignment: .center)
                                .zIndex(2)
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 380, height: 53)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 0.24, green: 0.28, blue: 0.41), location: 0.00),
                                            Gradient.Stop(color: Color(red: 0.18, green: 0.19, blue: 0.42), location: 0.51),
                                            Gradient.Stop(color: Color(red: 0.28, green: 0.36, blue: 0.57), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0.53, y: -0.15),
                                        endPoint: UnitPoint(x: 0.53, y: 1)
                                    )
                                )
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                .zIndex(1)
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(width: 200,height: 70)
                }
            }
        }
    }
}

#Preview{
    ContentView()
}
extension Color {
    static let mainColor = Color(red: 0.082, green: 0.133, blue: 0.204)
    static let subColor = Color(red: 5.45, green: 0.655, blue: 0.835)
    static let captionColor = Color(red: 0.776, green: 0.776, blue: 0.776)
}
