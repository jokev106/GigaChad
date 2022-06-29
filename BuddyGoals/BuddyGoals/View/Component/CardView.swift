//
//  CardView.swift
//  BuddyGoals
//
//  Created by I Gede Bagus Wirawan on 24/06/22.
//

import SwiftUI

//For manage content
//struct cardHomapage {
//    let image : String
//    let color : String
//    let milestone : String
//    let destination : String
//}
struct CardView: View {
    
    var imageCard : String
    var colorCard : Color
    var milestone : String
    var destinationCard : String
    
    var body: some View {
        
        //Card
            HStack{
                VStack{
                    Image(imageCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                        .frame(width: 50, height: 80)
                        .background(colorCard)
                }
                
                
                Text(milestone)
                    .font(.system(size: 17.5, weight: .bold))
                    .padding(.trailing, 10)
                    .frame(alignment: .leading)
                    .foregroundColor(Color.black)

                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.trailing, 15)
                    .foregroundColor(Color.gray)

            }
            .background(.white)
            

        .cornerRadius(10)
        .padding()
        .shadow(color: .gray, radius: 5)
        //Close of Card
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageCard: "", colorCard: Color.black, milestone: "Test", destinationCard: "")
    }
}
