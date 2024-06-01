//
//  DetailData.swift
//  Hanabi_withSpriteKit
//
//  Created by 山口昂大 on 2024/01/29.
//

import Foundation
import SwiftUI


struct ShapeData:Identifiable{
    var id = UUID()
    var image:String
    var title:String
    var subtitle:String
    var description:String
    var Trivia:String 
   
}

struct TypeData:Identifiable{
    var id = UUID()
    var image:String
    var title:String 
    var description:String
    var images:[String]
    var HowtoEnjoy:String
}

class detailData:ObservableObject{
    
    @Published var firewoksTypeDiscription:[TypeData] = [
        TypeData(image: "Warimono", title: "WARIMONO", description: "\"Warimono\" is the most common firework in Japan.\nIt is characterized by large, round flowers and a loud sound that can be felt throughout the body with a bang.\nThe skin of the firework ball (tama-hime) is sturdy and filled with gunpowder with high explosive power, so when it is launched, it bursts with ferocious force in the sky.\nThe force of the explosion causes the \"stars\" (which are the petals) that produce the color and light of the fireworks to disperse far in all directions, forming a large, round flower.Warimono, which draws round, large flowers like this, is a firework unique to Japan.\nIt is highly appreciated all over the world.",images: ["Kiku","Botan"],HowtoEnjoy: "The higher the fireworks are launched, the more beautiful and powerful they will be.\nWatch from a place where you can look up high!"),
        TypeData(image: "Kowarimono", title: "KOWARIMONO",  description: "Fireworks with several small firework balls packed inside a large firework ball.\nNothing can be seen immediately after the explosion, but after a short pause, all the small fireworks explode at the same time.\nThe skill of the pyrotechnicians is required so that all the small fireworks explode at the same time.",images: ["Senrin"],HowtoEnjoy: "Just when you think the explosion has failed, a large number of fireworks will explode simultaneously over a wide area. Do not miss the decisive moment after dark!"),        
        TypeData(image: "Pokamono", title: "POKAMONO", description: "A ball-shaped spherical shell that breaks in two and releases stored stars and work pieces is called a \"poka-mono\".\nIt contains less gunpowder than other fireworks, and the firework does not curl up. \n It is also smaller in size, but depending on what is contained within, fireworks with various functions can be devised.\nWhen used in combination with split pieces, fireworks of higher quality can be produced.",images: ["Hiyusei","Hachi","Yanagi"],HowtoEnjoy: "Fireworks with a unique shape that is different from the molds will appear. At first glance, they look irregular, but imagine that they are the result of a craftsman's calculations!"),
        TypeData(image: "Katamono.", title: "KATAMONO", description: "It is an applied form of split fireworks and is often used to draw letters in the night sky, or to float patterns such as smiley face marks, characters, butterflies, ribbons, etc., or to add a message to the starmine.\nThe structure is arranged in the shape of a picture representing a split peony star, and the contents of the ball skin are filled with cottonseed or other materials.\nSince it is a flat picture, cracked powder is generally packed in the opposite shell.\nSome pyrotechnicians use a device like a kite tail or wings to make the cross section of the fireworks burst toward the audience.\nIn addition, in recent years, three-dimensional molds have been developed that can be enjoyed from anywhere.",images: ["Katamono","Planet"],HowtoEnjoy: "Fireworks of various shapes will appear. Enjoy the differences between them, as different makers can create completely different shapes. Also, let's try to make three-dimensional shaped fireworks!")
            
    ]
    
    
    @Published var firewoksShapeDiscription:[ShapeData] = [
        ShapeData(image: "Kiku", title: "KIKU", subtitle: "Warimono", description: "This is a traditional Japanese firework that has existed in Japan since ancient times.\nIt is popularly called \"Kikka-hi\" (meaning chrysanthemum flower fire), because the stars that radiate and scatter radially with trailing tails look like chrysanthemum flowers.\nWhen the color of the tips of the petals changes, it is called \"Henkagiku\".",Trivia: "It resembles a \"Botan\", but the one that flies with a tail of light is more of a \"Kiku\"."),
        
        ShapeData(image: "Botan", title: "BOTAN", subtitle: "Warimono", description: "Like \"KIKU\", it is rounded, with dots of light spreading out without a tail, producing peony-like flowers.\nIt is also \"KIKU\" by its brighter light than that of chrysanthemums.\nThe bright kind using magnesium and other materials for gunpowder is called \"dahlia\".",Trivia: "Botan disappear in a flash without a tail."),
        
        ShapeData(image: "Katamono", title: "KATAMONO", subtitle: "Katamono.", description: "Fireworks that use dots and lines of light to draw various shapes such as hearts, smiley faces, butterflies, and Saturn.\nUsing a rough drawing as a base, gunpowder is packed along the picture.",Trivia: "Because it can only reproduce a picture on a flat surface, the picture cannot be seen cleanly from any angle other than the front.\nIn recent years, stereoscopic fireworks, which can be seen beautifully from anywhere, have become popular."),
        
        ShapeData(image: "Kamuro", title: "KAMURO", subtitle: "Warimono", description: "The stars burn for a relatively long time to create a unique shape called a \"Kamuro\".\nIt is characterized by the fact that it spreads out in a round shape, flows down in a large stream, and disappears near the ground.\nIt is said that the name \"Kamuro\" comes from the fact that in the old days, a big-headed person was called \"kamuro\".\nThe tail remains for a longer time than the \"KIKU\".",Trivia: "Fireworks that were accidentally created in the past when a pyrotechnician made a mistake in mixing gunpowder.\nIt was and still is the most popular firework. The finale of the fireworks display."),
        
        ShapeData(image: "Yanagi", title: "YANAGI", subtitle: "Pokamono", description: "After the fireworks ball breaks, the light falls down like a willow branch hanging down.\nThere is also a type called \"Yanagi\" in which the light falls while changing colors.",Trivia: "No trivia on this shape."),
        
        ShapeData(image: "Hachi", title: "HACHI", subtitle: "Pokamono", description: "Fireworks in which a paper cylinder filled with gunpowder spins and moves erratically when the ball opens.\nIt is named after the bee-like movement of the cylinder.",Trivia: "No trivia on this shape."),
        
        ShapeData(image: "Hiyusei", title: "HIYUSEI", subtitle: "Pokamono", description: "When a paper cylinder filled with gunpowder opens in the sky, the light moves erratically in this firework.",Trivia: "No trivia on this shape."),
        
        ShapeData(image: "Hanarai", title: "HANARAI", subtitle: "Pokamono", description: "Fireworks that emit strong light while producing a bang-bang sound like thunder.\nFireworks that emit sparks of fire along with the light are called hanarai (flower lightning), and fireworks with many lightning bolts opening all at once are called manrai.",Trivia: "Hanarai is a \"Otomono\" , meaning that it produces a louder sound than other fireworks.\nThey are called by different names depending on the number of sounds they produce: one shot is called \"Gouhou,\" three shots are called \"Sandanochi,\" five shots are called \"Godanochi\", and many shots are called \"Mandanochi\".\nWhen they produce many sounds at the same time.\nHanamai is often used during the daytime, but it is also used at night because of its loud sound and silvery glow."),
        
        ShapeData(image: "Senrin", title: "SENRIN", subtitle: "Kowarimono", description: "When a firework ball breaks off in the sky above, the small balls open all at once after a moment's delay, creating the Senrin firework.\nWhen chrysanthemum-shaped small balls of various colors are used, it becomes Senrin Kiku.",Trivia: "A small firework ball is stuck inside a large firework ball.\nWhen it explodes, the small firework balls scatter around it and explode at the end of it.\nThe space between the small firework balls is filled with gunpowder and designed so that all the small firework balls explode at the same time.")
    ]
}

