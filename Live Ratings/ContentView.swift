import SwiftUI

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
    @State var timeFormat = 0
    @State var isShowingSheet = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    if (timeFormat == 0) {
                        Image(systemName: "mustache.fill")
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
                        Image(systemName: "graduationcap.fill")
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
                                .foregroundColor(colorScheme == .light ? .black : .white)
                            Image(systemName: "chevron.down")
                        }
                    }  .sheet(isPresented: $isShowingSheet) {
                            
                        VStack {
                            Spacer()
                            HStack {
                                Text("TIME FORMAT")
                                    .font(.callout)
                                Spacer()
                            }
                            
                            Button {
                                timeFormat = 0
                            } label: {
                                HStack {
                                    Image(systemName: "mustache.fill")
                                    Text("Classical Ratings")
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .opacity(timeFormat == 0 ? 1.0: 0.0)
                                }.padding(10)
                                    .foregroundColor(colorScheme == .dark ? Color.white: Color.black)
                                    .background(timeFormat == 0 ? Color.brown.opacity(0.3) : Color.clear)
                                .cornerRadius(15)
                            }.padding(.bottom, 10)

                            Button {
                                timeFormat = 1
                            } label: {
                                HStack {
                                    Image(systemName: "timer")
                                    Text("Rapid Ratings")
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .opacity(timeFormat == 1 ? 1.0: 0.0)
                                }.padding(10)
                                    .foregroundColor(colorScheme == .dark ? Color.white: Color.black)
                                    .background(timeFormat == 1 ? Color.green.opacity(0.3) : Color.clear)
                                .cornerRadius(15)
                            }.padding(.bottom, 10)
                            
                            Button {
                                timeFormat = 2
                            } label: {
                                HStack {
                                    Image(systemName: "bolt.fill")
                                    Text("Blitz Ratings")
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .opacity(timeFormat == 2 ? 1.0: 0.0)
                                }.padding(10)
                                    .foregroundColor(colorScheme == .dark ? Color.white: Color.black)
                                    .background(timeFormat == 2 ? Color.yellow.opacity(0.3) : Color.clear)
                                .cornerRadius(15)
                            }.padding(.bottom, 10)
                            
                            Button {
                                timeFormat = 3
                            } label: {
                                HStack {
                                    Image(systemName: "graduationcap.fill")
                                    Text("Junior Ratings")
                                    Spacer()
                                    Image(systemName: "checkmark")
                                        .opacity(timeFormat == 3 ? 1.0: 0.0)
                                }.padding(10)
                                    .foregroundColor(colorScheme == .dark ? Color.white: Color.black)
                                    .background(timeFormat == 3 ? Color.blue.opacity(0.3) : Color.clear)
                                .cornerRadius(15)
                            }.padding(.bottom, 10)
                        }
                        .padding(.horizontal)
                        .presentationDetents([.height(300)])

                        Spacer()
                    }
                }.padding(.horizontal)
                      
                if (timeFormat == 0) {
                    ForEach(0..<classicalData.leaderNames.count) { i in
                        card(name: classicalData.leaderNames[i], primaryRating: classicalData.classicalList[i], secondaryRating: classicalData.rapidList[i], tertiaryRating: classicalData.blitzList[i], rank: i, upAnDown: classicalData.upAndDown[i], countries: classicalData.countries[i], whichFormat: 0)
                        Spacer(minLength: 20)
                    }
                }
                
                else if (timeFormat == 1) {
                    ForEach(0..<rapidData.leaderNames.count) { i in
                        card(name: rapidData.leaderNames[i], primaryRating: rapidData.rapidList[i], secondaryRating: rapidData.blitzList[i], tertiaryRating: rapidData.classicalList[i], rank: i, upAnDown: rapidData.upAndDown[i], countries: rapidData.countries[i], whichFormat: 1)
                        Spacer(minLength: 20)
                    }
                }
                
                else if (timeFormat == 2) {
                    ForEach(0..<blitzData.leaderNames.count) { i in
                        card(name: blitzData.leaderNames[i], primaryRating: blitzData.blitzList[i], secondaryRating: blitzData.rapidList[i], tertiaryRating: blitzData.classicalList[i], rank: i, upAnDown: blitzData.upAndDown[i], countries: blitzData.countries[i], whichFormat: 2)
                        Spacer(minLength: 20)
                    }
                }
                
                else {
                    ForEach(0..<juniorData.leaderNames.count) { i in
                        card(name: juniorData.leaderNames[i], primaryRating: juniorData.classicalList[i], secondaryRating: juniorData.rapidList[i], tertiaryRating: juniorData.blitzList[i], rank: i, upAnDown: juniorData.upAndDown[i], countries: juniorData.countries[i], whichFormat: 3)
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
                        }
                        
                        else if (whichFormat == 1) {
                            Image(systemName: "mustache.fill")
                                .foregroundColor(.brown)
                            Text(tertiaryRating)
                                Image(systemName: "bolt.fill")
                                    .foregroundColor(.yellow)
                            Text(secondaryRating)
                        }
                        
                        else {
                            Image(systemName: "mustache.fill")
                                .foregroundColor(.brown)
                            Text(tertiaryRating)
                            Image(systemName: "timer")
                                    .foregroundColor(.green)
                            Text(secondaryRating)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
