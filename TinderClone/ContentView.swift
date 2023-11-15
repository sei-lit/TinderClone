//
//  ContentView.swift
//  TinderClone
//
//  Created by 大森青 on 2023/11/06.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            //Top Stock
            HStack {
                Button(action: {}) {
                    Image(systemName: "person.fill").resizable().aspectRatio(contentMode: .fit).frame(height: 40)
                }.foregroundStyle(Color(.gray))
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image("tinder_icon").resizable().aspectRatio(contentMode: .fit).frame(height: 40)
                }.foregroundStyle(Color(.gray))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bubble.left.and.bubble.right.fill").resizable().aspectRatio(contentMode: .fit).frame(height: 40)
                }.foregroundStyle(Color(.gray))
            }.padding(.horizontal)
            
            //Card
            ZStack {
                ForEach(Card.data.reversed()) { card in
                    CardView(card: card).padding(8)
                }
            }
            .zIndex(1.0)
            
            //Bottom Stack
            HStack {
                Button(action: {}) {
                    Image("refresh")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                }.background(Color(.white)).cornerRadius(25).shadow(radius: 5)
                
                Spacer()
                
                Button(action: {}) {
                    Image("dismiss")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 70)
                }.background(Color(.white)).cornerRadius(35).shadow(radius: 5)
                
                Spacer()
                
                Button(action: {}) {
                    Image("super-like")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                }.background(Color(.white)).cornerRadius(25).shadow(radius: 5)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.default) {
                        
                    }
                }) {
                    Image("like")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 70)
                }.background(Color(.white)).cornerRadius(35).shadow(radius: 5)
                
                Spacer()
                
                Button(action: {}) {
                    Image("boost")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 50)
                }.background(Color(.white)).cornerRadius(25).shadow(radius: 5)
                
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    @State var card : Card
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(card.imageName).resizable().scaledToFill()
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text(card.name).font(.largeTitle).fontWeight(.bold)
                        Text(String(card.age)).font(.title)
                    }
                    Text(card.bio)
                }
            }
            .padding()
            .foregroundColor(.white)
            
            HStack {
                Image("yes")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .opacity(Double(card.x / 10 - 1))
                Spacer()
                Image("no")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .opacity(Double(card.x/10 * -1 - 1))
            }
        }
        .cornerRadius(8)
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                }
            
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                            case 0...100:
                                card.x = 0; card.y = 0; card.degree = 0
                            case let x where x > 100:
                                card.x = 500; card.degree = 12
                            case (-100)...(-1):
                                card.x = 0; card.y = 0; card.degree = 0
                            case let x where x < -100:
                                card.x = -500; card.degree = -12
                            default:
                                card.x = 0; card.y = 0
                        }
                    }
                }
        
        )
    }
}
