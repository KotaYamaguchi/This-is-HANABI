

import SwiftUI
import SpriteKit


struct StudyView: View {
    @StateObject var sharedValues = SharedValueClass()
    @StateObject var datas = detailData()
    @State var isShowtypeDetail: Bool = false
    var body: some View {
        GeometryReader{ geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            NavigationStack{
                ScrollView{
                    ZStack{
                        Color.mainColor
                            .ignoresSafeArea()
                            .zIndex(1)
                        VStack(alignment:.leading){
                            Text("What types of fireworks are there?")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                                .padding(.leading)
                                .padding(.top)
                            TabView{
                                ForEach(datas.firewoksTypeDiscription){type in
                                    NavigationLink{
                                        FireworksTypeView(width: width, height: height, image: type.image, title: type.title, description: type.description, images:type.images, HowtoEnjoy: type.HowtoEnjoy )
                                    }label: {
                                        mainRow(width: width, height: height, image: type.image, title: type.title, description: type.description)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                            .frame(height: height * 0.5)
                            .tabViewStyle(.page)
                            
                            
                           
                           
                            Divider()
                            Text("What shapes of fireworks are there?")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                                .padding(.leading)
                                .padding(.top)
                                VStack{
                                    ForEach(datas.firewoksShapeDiscription){ shape in
                                        NavigationLink{
                                            FirewoksDetailView(width: width, height: height, image: shape.image, title: shape.title, description: shape.description, subtitle: shape.subtitle,trivia: shape.Trivia)
                                            .preferredColorScheme(.dark)
                                            
                                        }label: {
                                            subRow(width:width,height:height,image: shape.image, title: shape.title, description: shape.description, size: 210)
                                        }
                                        .buttonStyle(.plain)
                                        Divider().padding(.horizontal)
                                    }
                                }
                        }
                        .zIndex(2)
                    }
                }
            }
        }
    }
    

    
    @ViewBuilder func subRow(width:CGFloat,height:CGFloat,image:String,title:String,description:String,size:CGFloat) -> some View{
        HStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: width/7,height:width/7)
            .clipShape(RoundedRectangle(cornerRadius:15))
            VStack(alignment: .leading){
                Text(title)
                    .foregroundStyle(Color.captionColor)
                    .font(.callout)
                Text(description)
                    .lineLimit(1)
                    .foregroundStyle(Color.captionColor)
            }
                    }
        
        .frame(maxWidth: width)
        .padding(.horizontal,width*0.05)
        
    }
    
    
}


#Preview {
    StudyView()
}



struct FireworksTypeView: View {
    var width:CGFloat
    var height:CGFloat
    var image:String
    var title:String
    var description:String
    var images : [String]
    var HowtoEnjoy:String 
    
     @StateObject var datas = detailData()
    var body: some View {
        ZStack {
            Color.mainColor
            ScrollView  {
                //Product Image
                VStack{ 
                    Image(image)
                        .resizable()
                        .scaledToFit()
                    VStack (alignment: .leading) {
                        //                Title
                        Text(title)
                            .font(.title)
                            .fontWeight(.bold)
                        //                Rating
                        Text("Description")
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                            .fontWeight(.bold)
                        Text(description)
                            .lineSpacing(8.0)
                            .opacity(0.6)
                        Spacer()
                        
                        Text("How to enjoy")
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                            .fontWeight(.bold)
                        Spacer()
                        Text(HowtoEnjoy)
                        
                        //花火の構造の写真を挿入　もしくは上に入れる
                        Text("This type of fireworks")
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                        
                        HStack{
                            ForEach(0..<images.count){ i in
                                Image(images[i])
                                    .resizable()
                                    .frame(width:100,height: 100)
                            }
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.top)
                    .background(Color.mainColor.gradient)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .offset(x: 0, y: -30.0)
                    
                }
            }
        }
        
    }}



struct FirewoksDetailView: View {
    var width:CGFloat
    var height:CGFloat
    var image:String
    var title:String
    var description:String
    var subtitle :String
    var trivia:String 
    var sampleImage :String = ""
    var body: some View {
        ZStack {
            Color.mainColor
            ScrollView  {
                //Product Image
                
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width/2,height:height/2)
                
                VStack (alignment: .leading) {
                  
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
 
                    Text("Description")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                    Text(description)
                        .lineSpacing(8.0)
                        .opacity(0.6)
                    
                
                    HStack (alignment: .top) {

                        
                        Spacer()
                        VStack (alignment: .leading) {
                            Text("Trivia")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text(trivia)
                                .opacity(0.6)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical)
                    
     
                    Text(subtitle)
                        .fontWeight(.medium)
                        .padding(.vertical, 8)

                    HStack{
                        Image(subtitle)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width*0.2)
                            
                    }
                }
                .padding()
                .padding(.top)
                .background(Color.mainColor.gradient)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .offset(x: 0, y: -30.0)
                
            }
            
        }

    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct mainRow: View {
    var width:CGFloat
    var height:CGFloat
    var image:String
    var title:String
    var description:String
    
    var body: some View {
        HStack(spacing:0){
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .cornerRadius(20)
            Spacer()
                VStack(){
                    Text(title)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                    Text("See more information")
                }
                .padding(.horizontal,1)
            Spacer()
        }
        .background{
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(red: 0.24, green: 0.28, blue: 0.41))
                .frame(width: width * 0.9)
        }
    }
}
