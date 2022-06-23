//
//  MilestoneView.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 21/06/22.
//

import SwiftUI

struct MilestoneView: View {
    var body: some View {
            ZStack {
                VStack {
                    NavigationView {
                        Color.blue.edgesIgnoringSafeArea(.all)
                            .navigationBarTitle("Milestone", displayMode: .inline)
                            
                            
                    } // Navigation
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.06)
                        .padding(.top, UIScreen.main.bounds.height * 0.01)
                    HStack(alignment:.lastTextBaseline){
                        Spacer()
                        Button(
                            action: {print("tapped")},
                            label: {Image(systemName: "plus")})
                        .padding(.trailing, 30)
                    }.frame(width: UIScreen.main.bounds.width, height: 10)
                        .padding()
                        
                    VStack{
                        ChallengeView(challengeName: "Contoh", challengeDetail: "Contoh nih", challengeDifficulty: 3)
                    }
                    Spacer()
                }// VStack
                
                
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.18)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .shadow(color: .gray, radius: 1))
                    Spacer()
                } // VStack
                .padding(.top, UIScreen.main.bounds.height * 0.06)
                
                    
                VStack (alignment:.leading) {
                        
                    Text("Challenge")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .padding(.bottom, -2)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        
                        
                    HStack {
                        milestoneTimeView(duration: 12)
                        milestoneTimeView(duration: 11)
                    } //Hstack
                    .frame(width: 380, height: 50)
                    .padding(.top, 10)
                    .border(width: 1, edges: [.top], color: .gray)
                    
                        
                    Spacer()
                }// VStack
                .padding(.top, UIScreen.main.bounds.height * 0.06)
                
            } // Zstack
        }
        
}

struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView()
    }
}

// Object Challenge View
struct ChallengeView: View {
    
    var challengeName : String
    var challengeDetail : String
    var challengeDifficulty : Int
    
    var body: some View {
        ZStack{
            HStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                    .frame(width: 100, height: 80)
                    .foregroundColor(.blue)
//                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
//                    .frame(width: 160, height: 80)
//                    .foregroundColor(.white)
                Spacer()
                
            }
            HStack {
                VStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                    Text("\(challengeDifficulty)")
                        .font(.system(size: 12, weight: .light, design: .default))
                }
                Rectangle()
                    .frame(width: 288, height: 80)
                    .foregroundColor(.white)
                
            }
            HStack {
                VStack(alignment:.leading) {
                    Text(challengeName)
                        .font(.system(size: 20, weight: .bold, design: .default))
                    Text(challengeDetail)
                        .font(.system(size: 14, weight: .light, design: .default))
                }.frame(width: 200, height: 50, alignment: .leading)
                    .padding(.leading, 20)
                Spacer()
                Image(systemName: "greaterthan")
                    .frame(width: 20, height: 80)
                    .padding(.trailing, 20)
            }
            .frame(width: 288, height: 80)
            .padding(.leading, 42)
            
            
        }
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 330, height: 80)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(.gray, lineWidth: 0.5)
            .shadow(color: .gray, radius: 1))
        .onTapGesture {
            print("Tapped")
        }
    }
}

// Untuk membuat bisa pilih sisi kalau bikin border
extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

struct milestoneTimeView: View {
    
    var duration : Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 170, height: 30)
                .foregroundColor(.gray)
            HStack {
                Text("Duration")
                Text("\(duration) Weeks")
            }
        }
        .padding(.top, 10)
    }
}
