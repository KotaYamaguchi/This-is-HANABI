
import SwiftUI

struct MainView: View {
    @State private var expandSheet:Bool = false
    var body: some View {
        TabView{
            FireWorksView()
            .preferredColorScheme(.dark)
                .tabItem {
                    Image(systemName: "fireworks")
                    Text("FIRE!!")
                }
            StudyView()
            .preferredColorScheme(.dark)
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Study!")
                }
        }
    }

    
    @ViewBuilder func SampleTab(_ title:String, _ icon :String) -> some View{
        Text(title)
            .tabItem {
                Image(systemName: icon)
                Text(title)
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.ultraThickMaterial, for: .tabBar)
    }
}

#Preview {
    MainView()
}
