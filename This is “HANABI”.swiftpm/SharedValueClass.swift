
import SwiftUI
import SpriteKit

class SharedValueClass: ObservableObject {

    @Published var rndColorFlag:Bool = true
   
    @Published var sceneSizeWidth:CGFloat = 3000
    @Published var sceneSizeHeight:CGFloat = 4000
    @Published var size: CGFloat = 8
    @Published var launchSize:CGFloat = 8
    @Published var particleCount: Double = 20
   
    @Published var colString:String = "Li"
    @Published var colArray = ["Li": SKColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1),
                               "Na": SKColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 1),
                               "K": SKColor(red: 218/255, green: 80/255, blue: 143/255, alpha: 1),
                               "Ca": SKColor(red: 255/255, green: 127/255, blue: 0/255, alpha: 1),
                               "Sr": SKColor(red: 189/255, green: 66/255, blue: 90/255, alpha: 1),
                               "Ba": SKColor(red: 173/255, green: 255/255, blue: 0/255, alpha: 1),
                               "Cu": SKColor(red: 0/255, green: 114/255, blue: 101/255, alpha: 1)
    ]
    
    
}


