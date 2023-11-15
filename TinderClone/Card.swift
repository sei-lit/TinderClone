//
//  Card.swift
//  TinderClone
//
//  Created by 大森青 on 2023/11/06.
//

import UIKit

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: Int
    let bio: String
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
            Card(name: "ちゃんぽん", imageName: "p1", age: 22, bio: "最近始めました、フェス好きです！"),
            Card(name: "でんち", imageName: "p2", age: 22, bio: "飲み友募集〜"),
            Card(name: "はらきよ", imageName: "p3", age: 20, bio: "カフェ巡りしましょ〜"),
            Card(name: "はらきよ", imageName: "p3", age: 20, bio: "猫みたいな人が好き"),
            Card(name: "らい", imageName: "p4", age: 20, bio: "温泉が好きです！一緒にリフレッシュしましょ〜"),
            Card(name: "いのべえ", imageName: "p5", age: 21, bio: "ゲームしましょう！"),
            Card(name: "ふたば", imageName: "p6", age: 20, bio: "野球を見るのが好きです"),
            Card(name: "土光瑠璃子", imageName: "p0", age: 24, bio: "女性アドルグループFES☆TIVEのメンバー")
        ]
    }
}
