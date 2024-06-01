import SwiftUI
import SpriteKit

struct FireWorksView: View {
    @ObservedObject var sharedValues = SharedValueClass()
    @State var atomString:String = "RANDOM"
    @State private var expandSheet:Bool = false
    @State var tappedFlags: [Bool] = [false, false, false, false, false, false, false, false]
    @State var selection: [String] = ["?","Li", "Na", "K", "Ca", "Sr", "Ba", "Cu"]
    @State var modifiedColors: [Color] = [.gray,.red, .yellow, .pink, .orange, .purple, .green, .blue]
    @State var colorString: String = "RANDOM"
    @State var typeNumber: Int = 0
   
    @State var currentColor: String = ""
    @State var types: [String] =  ["Kiku","Katamono","Botan","Hiyusei","Hachi","Senrin","RANDOM"]
    
    var scene:SKScene{
        let scene = GameScene(sharedValues: sharedValues)
        scene.size = CGSize(width: sharedValues.sceneSizeWidth, height: sharedValues.sceneSizeHeight)
        scene.scaleMode = .fill
    
        return scene
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .bottom){
                SpriteView(scene: scene)
                    .ignoresSafeArea(edges:.top)
                    
                    .zIndex(1)
                Rectangle()
                    .fill(Color.mainColor.opacity(0.5))
                    .frame(width: geometry.size.width*0.95, height: 70)
                    .cornerRadius(20)
                    .overlay{
                        
                        FireworksStatusBar(currentSize: $sharedValues.size, currentColor: $colorString, nuber: $sharedValues.particleCount)
                        
                    }
                    .zIndex(2)
                    .onTapGesture {
                        expandSheet = true
                    }
                    .padding(.bottom,20)
                
            }
            .onChange(of: atomString) { oldValue, newValue in
                
                switch atomString{
                case "?" : currentColor = "RANDOM"
                case "Li":currentColor = "RED"
                case "Na":currentColor = "YELLOW"
                case "K" :currentColor = "PINK"
                case "Ca":currentColor = "ORANGE"
                case "Sr":currentColor = "PURPLE"
                case "Ba":currentColor = "GREEN"
                case "Cu":currentColor = "BLUE"
                default: print("No Selected")
                }
                
                if atomString != "?"{
                    sharedValues.rndColorFlag = false
                    sharedValues.colString = self.atomString
                    
                }else{
                    sharedValues.rndColorFlag = true
                }
            }
            .sheet(isPresented:$expandSheet){
                ExpandedSheet(expandSheet: $expandSheet, atomString: $atomString, size: $sharedValues.size, tappedFlags: $tappedFlags, selection: $selection, modifiedColors: $modifiedColors,  number: $sharedValues.particleCount, typeNumber: $typeNumber, types: $types)
                    .background(Color.mainColor)
            }
        }
    }
}

struct FireworksStatusBar: View {
    
    @Binding var currentSize:CGFloat
    @Binding var currentColor:String
    @Binding var nuber:Double
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Status")
                .padding(.leading)
            HStack(){
                Spacer()
                Text("COLOR :")
                Text(currentColor)
                Spacer()
                Text("SIZE :")
                Text("\(Int(currentSize))")
                Spacer()
                Text("NUMBER :")
                Text("\(Int(nuber))")
                Spacer()
            }
        }
        .foregroundStyle(Color.captionColor.opacity(0.7))
    }
}



#Preview {
    FireWorksView()
        .preferredColorScheme(.dark)
}




struct ExpandedSheet: View {
    @Binding var expandSheet: Bool
    @Binding var atomString: String
    @Binding var size: CGFloat
    @Binding var tappedFlags: [Bool]
    @Binding var selection: [String]
    @Binding var modifiedColors: [Color]
    @Binding var number: Double
    @Binding var typeNumber : Int
    @Binding var types: [String]
    @StateObject var datas = detailData()
    @StateObject var sharedValue = SharedValueClass()
    
    private let images:[String] = ["Kiku","Botan","Katamono","Senrin","Hiyusei","Planet"]
    private let columns = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    @State var buttonCount = 0
 
    private func calcuratePostion() -> (x: [Double], y: [Double]) {
        var x: [Double] = []
        var y: [Double] = []
        for a in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi * 2 / 8) {
            let posx = sin(a) * 150
            let posy = cos(a) * 150
            x.append(posx)
            y.append(posy)
        }
        return (x, y)
    }
    var body: some View {
        GeometryReader{
            geometry in
            
            ScrollView{
                ZStack{
                    Color(Color.mainColor)
                        .opacity(0.5)
                    VStack{
                        Button{
                            expandSheet = false
                        }label:{
                            Image(systemName: "chevron.compact.down")
                                .font(.system(size: 60))
                                .foregroundStyle(Color.subColor)
                        }
                        .frame(width: 30,height: 30)
                        .padding(.top)
                        .buttonStyle(.plain)
                        
                        Text("Setting Status")
                            .font(.system(size: 40))
                            .padding(.top)
                        
                       
                    
                        
                        ZStack(alignment:.center){
                            VStack{
                                Text("Color")
                                    .font(.title)
                                    .foregroundStyle(Color.captionColor)
                                Text("Choose fireworks colors \n from element symbols.")
                                    .font(.caption)
                                    .foregroundStyle(Color.captionColor)
                            }
                            VStack{
                                
                                ZStack {
                                    
                                    ForEach(0..<selection.count, id: \.self) { index in
                                        Button{
                                            tappedFlags[index].toggle()
                                            atomString = selection[index]
                                            buttonCount = index
                                        }label: {
                                            Circle()
                                                .fill(buttonCount == index ? modifiedColors[index] : modifiedColors[index].opacity(0.7))
                                                .frame(width: 70)
                                                .padding(.all)
                                                .clipShape(Circle())
                                                .shadow(color: .cyan.opacity(0.7), radius: 10, x: 0, y: 0)
                                                .scaleEffect(buttonCount == index ? 1.2 : 1)
                                                .overlay{
                                                    Text(selection[index])
                                                        .font(buttonCount == index ? .largeTitle : .title)
                                                }
                                        }
                                        .buttonStyle(.plain)
                                        .offset(x: calcuratePostion().x[index] * -1, y: calcuratePostion().y[index] * -1)
                                    }
                                }
                                
                            }
                           
                        }
                        .frame(height: 400)
                                                
                        Spacer()
                        //Fireworks sizing. Button or slider
                        Text("Size")
                            .font(.title)
                            .foregroundStyle(Color.captionColor)
                        
                        
                        HStack{
                            Button{
                                if size > 0 { size -= 1.0}
                            }label: {
                                Image(systemName: "minus")
                                    .font(.title2)
                            }
                            //dummy number
                            Text("\(Int(size))")
                                .font(.system(size: 40))
                                .foregroundStyle(Color.captionColor)
                                .padding(.all,20)
                            Button{
                                if size < 20 { size += 1.0}
                            }label: {
                                Image(systemName: "plus")
                                    .font(.title2)
                            }
                            
                        }
                        
                        Text("Number")
                            .font(.title)
                            .foregroundStyle(Color.captionColor)
                        HStack{
                            Button{
                                if number > 0 { number -= 1.0}
                            }label: {
                                Image(systemName: "minus")
                                    .font(.title2)
                            }
                            //dummy number
                            Text("\(Int(number))")
                                .font(.system(size: 40))
                                .foregroundStyle(Color.captionColor)
                                .padding(.all,20)
                            Button{
                                if number < 50 { number += 1.0}
                            }label: {
                                Image(systemName: "plus")
                                    .font(.title2)
                            }
                            
                        }
                
                        Text("Appearance Type")
                            .font(.title)
                            .foregroundStyle(Color.captionColor)
                        Text("(Randomly appear type the following)")
                            .font(.caption)
                            .foregroundStyle(Color.captionColor)
                            .padding(.bottom)
                        
                        LazyVGrid(columns:columns , content: {
                            ForEach(0..<images.count,id:\.self){ index in
                                Image(images[index])
                                    .resizable()
                                    .scaledToFit()
                            }
                        })
                        .frame(maxWidth: geometry.size.width*0.8)
                        .padding(.vertical)
                    }
                }
            }
            
        }
    }
}

