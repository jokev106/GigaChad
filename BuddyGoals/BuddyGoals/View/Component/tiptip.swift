//
//  tiptip.swift
//  BuddyGoals
//
//  Created by I Gede Bagus Wirawan on 24/06/22.
//

//NavigationView {
//
//    ZStack{
//
//        VStack {
//            primary900
//                .frame(height: 300, alignment: .top)
//                .ignoresSafeArea(.all)
//
//            VStack{
//
//                //Spacer(minLength: 10)
//
//                //Card
//                Button(action: {
//                    //DO action
//                }, label: {
//                    VStack{
//                        HStack {
//                            Text("Lose 10 Kg in 10 months")
//                                .font(.system(size: 25, weight: .bold))
//                                .frame(alignment: .topTrailing)
//                                .foregroundColor(Color.black)
//
//                            Spacer()
//
//                            Button(action: {
//
//                            }, label: {
//                                Text("Edit")
//                                    .font(.system(size: 10))
//                                    .padding(5)
//                                    .background(white)
//                                    .cornerRadius(10)
//                            })
//
//                            //Image(systemName: "chevron.right")
//                                // .padding(.trailing, 10)
//                                // .foregroundColor(Color.gray)
//                        }
//
//                        HStack {
//                            Rectangle()
//                                .frame(height:1)
//                                .padding(5)
//                        }
//
//                        HStack {
//
//                            HStack {
//                                Text("Durations")
//                                    .foregroundColor(Color.black)
//                                    .bold()
//                                Spacer()
//                                Text("12 Weeks")
//                                    .foregroundColor(Color.gray)
//                            }
//                            .font(.system(size: 8))
//                            .padding(7)
//                            .background(white)
//                            .cornerRadius(10)
//
//                            Spacer()
//
//                            HStack {
//                                Text("Remaining")
//                                    .foregroundColor(Color.black)
//                                    .bold()
//                                Spacer()
//                                Text("15 Days")
//                                    .foregroundColor(Color.gray)
//                            }
//                            .font(.system(size: 8))
//                            .padding(7)
//                            .background(white)
//                            .cornerRadius(10)
//
//                        }
//
//
//                    }
//                    .padding()
//                    .background(.white)
//
//                })//Button card
//                .cornerRadius(10)
//                .padding()
//                .shadow(radius: 5)
//                //Close of Card
//
//                VStack(spacing:-10){
//
//                    HStack {
//                        Button(action: {
//
//                        }, label: {
//                            Image(systemName: "list.triangle")
//                                .font(.system(size: 20, weight: .bold))
//                        })
//                        Spacer()
//                        Button(action: {
//
//                        }, label: {
//                            Image(systemName: "plus")
//                                .font(.system(size: 20, weight: .bold))
//                        })
//                    }
//                    .padding(25)
//
//                    ScrollView {
//
//                        VStack(spacing:-10){
//                            HStack{
//                                Text("Exercise")
//                                    .foregroundColor(.gray)
//                                    .font(.system(size: 22.5))
//                                    .bold()
//                                    .padding()
//                                Spacer()
//                            }
//
//                            //Card
//                            CardView(imageCard: "Stars_4", colorCard: purple, milestone: "abla", destinationCard: "")
//                            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
//                            CardView(imageCard: "Stars_3", colorCard: blue, milestone: "abla", destinationCard: "")
//                            CardView(imageCard: "Stars_1", colorCard: white, milestone: "lol lol abla", destinationCard: "")
//                            CardView(imageCard: "Stars_2", colorCard: white, milestone: "abla", destinationCard: "")
//                            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
//                            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
//                            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
//                            //Close of Card
//                        }
//
//                    } //Scrollview
//
//                } //VStack (-10)
//
//            }//VStack
//
//
//        } //VStack
//        .navigationTitle("Goal")
//        .toolbar {
//            ToolbarItemGroup(placement: .navigationBarTrailing){
//                Button(action: {
//                    //Do action
//                }, label: {
//                    HStack {
//                        Image(systemName: "diamond.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//
//                        Text("27")
//                        Text("Rookie")
//                            .bold()
//                    }
//                    .padding(5)
//                    .font(.system(size: 12.5))
//                    .foregroundColor(whiteDark)
//                    .background(.white)
//                    .cornerRadius(10)
//                    .shadow(radius: 2)
//                })
//            }
//        } //Toolbar
//
//    }//ZStack
//
//}//NavigationView
//.edgesIgnoringSafeArea(.all)
