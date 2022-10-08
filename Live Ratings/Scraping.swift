import Foundation
import SwiftSoup

//class for individual data return
class dataReturn {
    let leaderNames: [String]
    let classicalList: [String]
    let rapidList: [String]
    let blitzList: [String]
    let upAndDown: [String]
    let countries: [String]
    init(leaderNames: [String], classicalList: [String], rapidList: [String], blitzList: [String], upAndDown: [String], countries: [String]) {
        self.leaderNames = leaderNames
        self.classicalList = classicalList
        self.rapidList = rapidList
        self.blitzList = blitzList
        self.upAndDown = upAndDown
        self.countries = countries
      }
}

//returns an array of the class dataReturn
class parentReturn {
    let dataArray: [dataReturn]
    init(dataArray: [dataReturn]) {
        self.dataArray = dataArray
    }
}

class Scraping{
    
    static func classicalscraping() -> dataReturn  {
        let url = URL(string:"https://2700chess.com/")!
        let html = try! String(contentsOf: url)
        let document = try! SwiftSoup.parse(html)
        var leaderNames: [String] = []
        
        let names = try! document.select(".name")
        for name in names {
            var unparsedName = try! name.text()
            unparsedName = unparsedName.components(separatedBy: " ")[0]
            leaderNames.append(unparsedName)
        }
        
        leaderNames.removeFirst()
        
        var classicalRatingsOneString = try! document.select(".live_standard_rating").text()
        classicalRatingsOneString.removeFirst(8)
        var classicalList = classicalRatingsOneString.components(separatedBy: " ")
        classicalList = classicalList.filter { $0 != "i" }

        var rapidRatingsOneString = try! document.select(".live_rapid_rating").text()
        rapidRatingsOneString.removeFirst(6)
        var rapidList = rapidRatingsOneString.components(separatedBy: " ")
        rapidList = rapidList.filter { $0 != "i" }
        
        var blitzRatingsOneString = try! document.select(".live_blitz_rating").text()
        blitzRatingsOneString.removeFirst(6)
        var blitzList = blitzRatingsOneString.components(separatedBy: " ")
        blitzList = blitzList.filter { $0 != "i" }
        
        let unparsedWords = try! document.select(",standard_change change").text()
        var upAndDown = unparsedWords.components(separatedBy: " ")
        
        upAndDown = upAndDown.map { $0.lowercased()}
        upAndDown.removeAll(where: {$0.contains("a") || $0.contains("b") || $0.contains("c") || $0.contains("d") || $0.contains("e") || $0.contains("f") || $0.contains("g") || $0.contains("h") || $0.contains("i") || $0.contains("j") || $0.contains("k") || $0.contains("l") || $0.contains("m") || $0.contains("n") || $0.contains("o") || $0.contains("p") || $0.contains("q") || $0.contains("r") || $0.contains("s") || $0.contains("t") || $0.contains("u") || $0.contains("v") || $0.contains("w") || $0.contains("x") || $0.contains("y") || $0.contains("z") || $0.hasPrefix("27") || $0.hasPrefix("28") || $0.hasPrefix("29") || $0.hasPrefix("↑") || $0.hasPrefix("↓") || $0.count > 5 || $0.count<3 || $0.contains("26")})
        upAndDown.removeFirst()
        upAndDown.removeFirst()
        upAndDown.removeFirst()

        
        
        /*upAndDown.removeAll(where: {$0.contains("a") || $0.contains("b") || $0.contains("c") || $0.contains("i") || $0.contains("2700+")})
        upAndDown.removeFirst()
        upAndDown.removeFirst()
        
        print(unparsedWords)
        print(upAndDown)
        print(upAndDown.count)*/
        
        print(upAndDown)
        
        var unparsedCountries = try! document.select(",standard_change change").text()
        
        var countries = unparsedCountries.components(separatedBy: " ")
        print(countries)

        countries.removeAll(where: {!$0.contains("Norway") && !$0.contains("China") && !$0.contains("France") && !$0.contains("United") && !$0.contains("Netherlands") && !$0.contains("Azerbaijan") && !$0.contains("Romania") && !$0.contains("Ukraine") && !$0.contains("Poland") && !$0.contains("Viet") && !$0.contains("Bulgaria") && !$0.contains("Russia") && !$0.contains("United States") && !$0.contains("India") && !$0.contains("Italy") && !$0.contains("England") && !$0.contains("Islamic") && !$0.contains("Spain") && !$0.contains("Armenia") && !$0.contains("Uzbekistan") && !$0.contains("Peru") && !$0.contains("Germany") && !$0.contains("Belgium") && !$0.contains("Denmark") && !$0.contains("Fide") })
        countries.removeFirst()
        
        /*print(leaderNames)
        print(classicalList)
        print(rapidList)
        print(blitzList)
        print(countries)*/
        return dataReturn(leaderNames: leaderNames, classicalList: classicalList, rapidList: rapidList, blitzList: blitzList, upAndDown: upAndDown, countries: countries)
    }

    static func blitzScraping() -> dataReturn  {
        let url = URL(string:"https://2700chess.com/blitz")!
        let html = try! String(contentsOf: url)
        let document = try! SwiftSoup.parse(html)
        var leaderNames: [String] = []
        
        let names = try! document.select(".name")
        for name in names {
            var unparsedName = try! name.text()
            unparsedName = unparsedName.components(separatedBy: " ")[0]
            leaderNames.append(unparsedName)
        }
        
        leaderNames.removeFirst()
        
        var classicalRatingsOneString = try! document.select(".live_standard_rating").text()
        classicalRatingsOneString.removeFirst(8)
        var classicalList = classicalRatingsOneString.components(separatedBy: " ")
        classicalList = classicalList.filter { $0 != "i" }

        var rapidRatingsOneString = try! document.select(".live_rapid_rating").text()
        rapidRatingsOneString.removeFirst(6)
        var rapidList = rapidRatingsOneString.components(separatedBy: " ")
        rapidList = rapidList.filter { $0 != "i" }
        
        var blitzRatingsOneString = try! document.select(".live_blitz_rating").text()
        blitzRatingsOneString.removeFirst(6)
        var blitzList = blitzRatingsOneString.components(separatedBy: " ")
        blitzList = blitzList.filter { $0 != "i" }
        
        let unparsedWords = try! document.select(",standard_change change").text()
        var upAndDown = unparsedWords.components(separatedBy: " ")
        
        upAndDown = upAndDown.map { $0.lowercased()}
        upAndDown.removeAll(where: {$0.contains("a") || $0.contains("b") || $0.contains("c") || $0.contains("d") || $0.contains("e") || $0.contains("f") || $0.contains("g") || $0.contains("h") || $0.contains("i") || $0.contains("j") || $0.contains("k") || $0.contains("l") || $0.contains("m") || $0.contains("n") || $0.contains("o") || $0.contains("p") || $0.contains("q") || $0.contains("r") || $0.contains("s") || $0.contains("t") || $0.contains("u") || $0.contains("v") || $0.contains("w") || $0.contains("x") || $0.contains("y") || $0.contains("z") || $0.hasPrefix("27") || $0.hasPrefix("28") || $0.hasPrefix("29") || $0.hasPrefix("↑") || $0.hasPrefix("↓") || $0.count > 5 || $0.count<3 || $0.contains("26")})
        upAndDown.removeFirst()
        upAndDown.removeFirst()
        upAndDown.removeFirst()
        
        var unparsedCountries = try! document.select(",standard_change change").text()
        
        var countries = unparsedCountries.components(separatedBy: " ")

        countries.removeAll(where: {!$0.contains("Norway") && !$0.contains("China") && !$0.contains("France") && !$0.contains("United") && !$0.contains("Netherlands") && !$0.contains("Azerbaijan") && !$0.contains("Romania") && !$0.contains("Ukraine") && !$0.contains("Poland") && !$0.contains("Viet") && !$0.contains("Bulgaria") && !$0.contains("Russia") && !$0.contains("United States") && !$0.contains("India") && !$0.contains("Italy") && !$0.contains("England") && !$0.contains("Islamic") && !$0.contains("Spain") && !$0.contains("Armenia") && !$0.contains("Uzbekistan") && !$0.contains("Peru") && !$0.contains("Germany") && !$0.contains("Belgium") && !$0.contains("Denmark") && !$0.contains("Fide") })
        countries.removeFirst()
        return dataReturn(leaderNames: leaderNames, classicalList: classicalList, rapidList: rapidList, blitzList: blitzList, upAndDown: upAndDown, countries: countries)
    }
    
    static func rapidScraping() -> dataReturn  {
        let url = URL(string:"https://2700chess.com/rapid")!
        let html = try! String(contentsOf: url)
        let document = try! SwiftSoup.parse(html)
        var leaderNames: [String] = []
        
        let names = try! document.select(".name")
        for name in names {
            var unparsedName = try! name.text()
            unparsedName = unparsedName.components(separatedBy: " ")[0]
            leaderNames.append(unparsedName)
        }
        
        leaderNames.removeFirst()
        
        var classicalRatingsOneString = try! document.select(".live_standard_rating").text()
        classicalRatingsOneString.removeFirst(8)
        var classicalList = classicalRatingsOneString.components(separatedBy: " ")
        classicalList = classicalList.filter { $0 != "i" }

        var rapidRatingsOneString = try! document.select(".live_rapid_rating").text()
        rapidRatingsOneString.removeFirst(6)
        var rapidList = rapidRatingsOneString.components(separatedBy: " ")
        rapidList = rapidList.filter { $0 != "i" }
        
        var blitzRatingsOneString = try! document.select(".live_blitz_rating").text()
        blitzRatingsOneString.removeFirst(6)
        var blitzList = blitzRatingsOneString.components(separatedBy: " ")
        blitzList = blitzList.filter { $0 != "i" }
        
        let unparsedWords = try! document.select(",standard_change change").text()
        var upAndDown = unparsedWords.components(separatedBy: " ")
        
        upAndDown = upAndDown.map { $0.lowercased()}
        upAndDown.removeAll(where: {$0.contains("a") || $0.contains("b") || $0.contains("c") || $0.contains("d") || $0.contains("e") || $0.contains("f") || $0.contains("g") || $0.contains("h") || $0.contains("i") || $0.contains("j") || $0.contains("k") || $0.contains("l") || $0.contains("m") || $0.contains("n") || $0.contains("o") || $0.contains("p") || $0.contains("q") || $0.contains("r") || $0.contains("s") || $0.contains("t") || $0.contains("u") || $0.contains("v") || $0.contains("w") || $0.contains("x") || $0.contains("y") || $0.contains("z") || $0.hasPrefix("27") || $0.hasPrefix("28") || $0.hasPrefix("29") || $0.hasPrefix("↑") || $0.hasPrefix("↓") || $0.count > 5 || $0.count<3 || $0.contains("26")})
        upAndDown.removeFirst()
        upAndDown.removeFirst()
        upAndDown.removeFirst()

        var unparsedCountries = try! document.select(",standard_change change").text()
        
        var countries = unparsedCountries.components(separatedBy: " ")
        print(countries)

        countries.removeAll(where: {!$0.contains("Norway") && !$0.contains("China") && !$0.contains("France") && !$0.contains("United") && !$0.contains("Netherlands") && !$0.contains("Azerbaijan") && !$0.contains("Romania") && !$0.contains("Ukraine") && !$0.contains("Poland") && !$0.contains("Viet") && !$0.contains("Bulgaria") && !$0.contains("Russia") && !$0.contains("United States") && !$0.contains("India") && !$0.contains("Italy") && !$0.contains("England") && !$0.contains("Islamic") && !$0.contains("Spain") && !$0.contains("Armenia") && !$0.contains("Uzbekistan") && !$0.contains("Peru") && !$0.contains("Germany") && !$0.contains("Belgium") && !$0.contains("Denmark") && !$0.contains("Fide") })
        countries.removeFirst()
        return dataReturn(leaderNames: leaderNames, classicalList: classicalList, rapidList: rapidList, blitzList: blitzList, upAndDown: upAndDown, countries: countries)
    }
    
    static func juniorScraping() -> dataReturn  {
        let url = URL(string:"https://2700chess.com/juniors")!
        let html = try! String(contentsOf: url)
        let document = try! SwiftSoup.parse(html)
        var leaderNames: [String] = []
        
        let names = try! document.select(".name")
        for name in names {
            var unparsedName = try! name.text()
            unparsedName = unparsedName.components(separatedBy: " ")[0]
            leaderNames.append(unparsedName)
        }
        
        leaderNames.removeFirst()
        
        var classicalRatingsOneString = try! document.select(".live_standard_rating").text()
        classicalRatingsOneString.removeFirst(8)
        var classicalList = classicalRatingsOneString.components(separatedBy: " ")
        classicalList = classicalList.filter { $0 != "i" }

        var rapidRatingsOneString = try! document.select(".live_rapid_rating").text()
        rapidRatingsOneString.removeFirst(6)
        var rapidList = rapidRatingsOneString.components(separatedBy: " ")
        rapidList = rapidList.filter { $0 != "i" }
        
        var blitzRatingsOneString = try! document.select(".live_blitz_rating").text()
        blitzRatingsOneString.removeFirst(6)
        var blitzList = blitzRatingsOneString.components(separatedBy: " ")
        blitzList = blitzList.filter { $0 != "i" }
        
        let unparsedWords = try! document.select(",standard_change change").text()
        var upAndDown = unparsedWords.components(separatedBy: " ")
        
        upAndDown = upAndDown.map { $0.lowercased()}
        upAndDown.removeAll(where: {$0.contains("a") || $0.contains("b") || $0.contains("c") || $0.contains("d") || $0.contains("e") || $0.contains("f") || $0.contains("g") || $0.contains("h") || $0.contains("i") || $0.contains("j") || $0.contains("k") || $0.contains("l") || $0.contains("m") || $0.contains("n") || $0.contains("o") || $0.contains("p") || $0.contains("q") || $0.contains("r") || $0.contains("s") || $0.contains("t") || $0.contains("u") || $0.contains("v") || $0.contains("w") || $0.contains("x") || $0.contains("y") || $0.contains("z") || $0.hasPrefix("27") || $0.hasPrefix("28") || $0.hasPrefix("29") || $0.hasPrefix("↑") || $0.hasPrefix("↓") || $0.count > 5 || $0.count<3 || $0.contains("26")})
        upAndDown.removeFirst()
        upAndDown.removeFirst()
        upAndDown.removeFirst()
        
        var unparsedCountries = try! document.select(",standard_change change").text()
        
        var countries = unparsedCountries.components(separatedBy: " ")
        print(countries)

        countries.removeAll(where: {!$0.contains("Norway") && !$0.contains("China") && !$0.contains("France") && !$0.contains("United") && !$0.contains("Netherlands") && !$0.contains("Azerbaijan") && !$0.contains("Romania") && !$0.contains("Ukraine") && !$0.contains("Poland") && !$0.contains("Viet") && !$0.contains("Bulgaria") && !$0.contains("Russia") && !$0.contains("United States") && !$0.contains("India") && !$0.contains("Italy") && !$0.contains("England") && !$0.contains("Islamic") && !$0.contains("Spain") && !$0.contains("Armenia") && !$0.contains("Uzbekistan") && !$0.contains("Peru") && !$0.contains("Germany") && !$0.contains("Belgium") && !$0.contains("Denmark") && !$0.contains("Fide") })
        countries.removeFirst()
        return dataReturn(leaderNames: leaderNames, classicalList: classicalList, rapidList: rapidList, blitzList: blitzList, upAndDown: upAndDown, countries: countries)
    }
}

