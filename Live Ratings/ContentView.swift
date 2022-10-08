import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var classicalData = dataReturn(leaderNames: [""], classicalList: [""], rapidList: [""], blitzList: [""], upAndDown: [""], countries: [""])
    var rapidData = dataReturn(leaderNames: [""], classicalList: [""], rapidList: [""], blitzList: [""], upAndDown: [""], countries: [""])
    var blitzData = dataReturn(leaderNames: [""], classicalList: [""], rapidList: [""], blitzList: [""], upAndDown: [""], countries: [""])
    var juniorData = dataReturn(leaderNames: [""], classicalList: [""], rapidList: [""], blitzList: [""], upAndDown: [""], countries: [""])

    init() {
        classicalData = Scraping.classicalscraping()
        rapidData = Scraping.rapidScraping()
        blitzData = Scraping.blitzScraping()
        juniorData = Scraping.juniorScraping()
    }
    @State var showInfoModalView: Bool = false
    @State var timeFormat = 0
    @State var isShowingSheet = false

    var body: some View {
        ZStack {
            Color.dropShadow.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    if (timeFormat == 0) {
                        Image(systemName: "mustache")
                            .foregroundColor(.brown)
                            .frame(height: 20)
                        Text("Classical")
                    }
                    
                    else if (timeFormat == 1) {
                        Image(systemName: "timer")
                            .foregroundColor(.green)
                            .frame(height: 20)
                        Text("Rapid")
                    }
                    
                    
                    else if (timeFormat == 2) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.yellow)
                            .frame(height: 20)
                        Text("Blitz")
                    }
                    
                    else {
                        Image(systemName: "graduationcap")
                            .foregroundColor(.blue)
                            .frame(height: 20)
                        Text("Junior")
                    }
                    
                    Spacer()
                    Group {
                        Button {
                            isShowingSheet = true
                        } label: {
                            Text("Format")
                                .foregroundColor(.black)
                            Image(systemName: "chevron.down")
                        }
                    }  .sheet(isPresented: $isShowingSheet) {
                        VStack {
                            HStack {
                                Text("Time Format")
                                    .bold()
                            }.padding(.bottom, 8)
                            HStack {
                                Spacer()
                                Button {timeFormat = 0} label: {
                                    Image(systemName: "mustache")
                                        .foregroundColor(.brown)
                                        .frame(height: 20)
                                    Text("Classical")
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                Button {timeFormat = 1} label: {
                                    Image(systemName: "timer")
                                        .foregroundColor(.green)
                                    Text("Rapid")
                                        .foregroundColor(.black)
                                   
                                }
                                Spacer()
                                Button {timeFormat = 2} label: {
                                    Image(systemName: "bolt.fill")
                                        .foregroundColor(.yellow)
                                    Text("Blitz")
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                
                                Button {timeFormat = 3} label: {
                                    Image(systemName: "graduationcap")
                                        .foregroundColor(.blue)
                                    Text("Junior")
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                            }
                        }
                        .presentationDetents([.height(150)])
                    }
                }.padding(.horizontal)
                      
                if (timeFormat == 0) {
                    ForEach(0..<classicalData.leaderNames.count) { i in
                    Button(action: {
                      showInfoModalView = true
                    }, label: {
                        card(name: classicalData.leaderNames[i], primaryRating: classicalData.classicalList[i], secondaryRating: classicalData.rapidList[i], tertiaryRating: classicalData.blitzList[i], rank: i, upAnDown: classicalData.upAndDown[i], countries: classicalData.countries[i], whichFormat: 0)
                    }).foregroundColor(.black)
                      .sheet(isPresented: $showInfoModalView) {
                          NavigationView {
                              modal(name: classicalData.leaderNames[i])
                          }
                      }
                        Spacer(minLength: 20)
                    }
                }
                
                else if (timeFormat == 1) {
                    ForEach(0..<rapidData.leaderNames.count) { i in
                    Button(action: {
                      showInfoModalView = true
                    }, label: {
                        card(name: rapidData.leaderNames[i], primaryRating: rapidData.rapidList[i], secondaryRating: rapidData.blitzList[i], tertiaryRating: rapidData.classicalList[i], rank: i, upAnDown: rapidData.upAndDown[i], countries: rapidData.countries[i], whichFormat: 1)
                    }).foregroundColor(.black)
                      .sheet(isPresented: $showInfoModalView) {
                          NavigationView {
                              modal(name: classicalData.leaderNames[i])
                          }
                      }
                        Spacer(minLength: 20)
                    }
                }
                
                else if (timeFormat == 2) {
                    ForEach(0..<blitzData.leaderNames.count) { i in
                    Button(action: {
                      showInfoModalView = true
                    }, label: {
                        card(name: blitzData.leaderNames[i], primaryRating: blitzData.blitzList[i], secondaryRating: blitzData.rapidList[i], tertiaryRating: blitzData.classicalList[i], rank: i, upAnDown: blitzData.upAndDown[i], countries: blitzData.countries[i], whichFormat: 2)
                    }).foregroundColor(.black)
                      .sheet(isPresented: $showInfoModalView) {
                          NavigationView {
                              modal(name: classicalData.leaderNames[i])
                          }
                      }
                        Spacer(minLength: 20)
                    }
                }
                
                else {
                    ForEach(0..<juniorData.leaderNames.count) { i in
                    Button(action: {
                      showInfoModalView = true
                    }, label: {
                        card(name: juniorData.leaderNames[i], primaryRating: juniorData.classicalList[i], secondaryRating: juniorData.rapidList[i], tertiaryRating: juniorData.blitzList[i], rank: i, upAnDown: juniorData.upAndDown[i], countries: juniorData.countries[i], whichFormat: 3)
                    }).foregroundColor(.black)
                      .sheet(isPresented: $showInfoModalView) {
                          NavigationView {
                              modal(name: classicalData.leaderNames[i])
                          }
                      }
                        Spacer(minLength: 20)
                    }
                }
                
              
                
                Group {
                    Text("Created by William Wang")
                        .font(.headline)
                    Text("Utilizes 2700chess.com + SwiftSoup")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.navigationTitle("Live Ratings")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

struct card: View {
    let name: String
    let primaryRating: String
    let secondaryRating: String
    let tertiaryRating: String
    let rank: Int
    let upAnDown: String
    let countries: String
    let whichFormat: Int
    var body: some View {
        ZStack {
            HStack {
                Image(countries)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 37)
                    .clipped()
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(name + " - #\(rank+1)")
                        .fontWeight(.semibold)
                    HStack {
                        if (whichFormat == 0 || whichFormat == 3) {
                            Image(systemName: "bolt.fill")
                                    .foregroundColor(.yellow)
                            Text(tertiaryRating)
                                Image(systemName: "timer")
                                    .foregroundColor(.green)
                            Text(secondaryRating)
                                .font(.subheadline)
                        }
                        
                        else if (whichFormat == 1) {
                            Image(systemName: "mustache")
                                .foregroundColor(.brown)
                            Text(tertiaryRating)
                                Image(systemName: "bolt.fill")
                                    .foregroundColor(.yellow)
                            Text(secondaryRating)
                                .font(.subheadline)
                        }
                        
                        else {
                            Image(systemName: "mustache")
                                .foregroundColor(.brown)
                            Text(tertiaryRating)
                            Image(systemName: "timer")
                                    .foregroundColor(.green)
                            Text(secondaryRating)
                                .font(.subheadline)
                        }
                        
                    
                      
                    }
                }
                
                Spacer()
                
                VStack(alignment:.trailing) {
                    Text(primaryRating)
                        .font(.headline)
                    HStack {
                        if (upAnDown.contains("+")) {
                            Text(upAnDown)
                                .foregroundColor(.green)
                        }
                        else if(upAnDown.contains("−")) {
                            Text(upAnDown)
                                .foregroundColor(.red)
                        }
                        else {
                            Text(upAnDown)
                                .foregroundColor(.secondary)
                        }
                    }.font(.subheadline)
                }
            }.padding(.trailing, 10)
        }.frame(width: UIScreen.screenWidth * 0.90, height: 80)
    }
}

struct modal: View {
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var name: String
    var body: some View {
        ZStack {
            Color.dropShadow.ignoresSafeArea()
            VStack {
                LineView(data: [2783.6,2783.0,2813.3,2637.2,2737.9, 2783.2,2783.3,2813.4,2637.7,2738.8], style: ChartStyle(backgroundColor: .dropShadow, accentColor: .black, gradientColor: GradientColors.bluPurpl, textColor: .black, legendTextColor: .black, dropShadowColor: .black))
                    .padding()
                

            }.navigationTitle(name)
        }
    }
}
