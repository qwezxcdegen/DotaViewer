//
//  Heroes.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 21.03.2023.
//

import Foundation

func fromIDToHero(heroID: String) -> String {
    switch heroID {
    case "1": return "Anti-Mage"
    case "2": return "Axe"
    case "3": return "Bane"
    case "4": return "Bloodseeker"
    case "5": return "Crystal Maiden"
    case "6": return "Drow Ranger"
    case "7": return "Earthshaker"
    case "8": return "Juggernaut"
    case "9": return "Mirana"
    case "10": return "Morphling"
    case "11": return "Shadow Fiend"
    case "12": return "Phantom Lancer"
    case "13": return "Puck"
    case "14": return "Pudge"
    case "15": return "Razor"
    case "16": return "Sand King"
    case "17": return "Storm Spirit"
    case "18": return "Sven"
    case "19": return "Tiny"
    case "20": return "Vengeful Spirit"
    case "21": return "Windranger"
    case "22": return "Zeus"
    case "23": return "Kunkka"
    case "25": return "Lina"
    case "26": return "Lion"
    case "27": return "Shadow Shaman"
    case "28": return "Slardar"
    case "29": return "Tidehunter"
    case "30": return "Witch Doctor"
    case "31": return "Lich"
    case "32": return "Riki"
    case "33": return "Enigma"
    case "34": return "Tinker"
    case "35": return "Sniper"
    case "36": return "Necrophos"
    case "37": return "Warlock"
    case "38": return "Beastmaster"
    case "39": return "Queen of pain"
    case "40": return "Venomancer"
    case "41": return "Faceless_void"
    case "42": return "Wraith King"
    case "43": return "Death Prophet"
    case "44": return "Phantom Assassin"
    case "45": return "Pugna"
    case "46": return "Templar Assassin"
    case "47": return "Viper"
    case "48": return "Luna"
    case "49": return "Dragon Knight"
    case "50": return "Dazzle"
    case "51": return "Clockwerk"
    case "52": return "Leshrac"
    case "53": return "Nature's Prophet"
    case "54": return "Lifestealer"
    case "55": return "Dark Seer"
    case "56": return "Clinkz"
    case "57": return "Omniknight"
    case "58": return "Enchantress"
    case "59": return "Huskar"
    case "60": return "Night Stalker"
    case "61": return "Broodmother"
    case "62": return "Bounty Hunter"
    case "63": return "Weaver"
    case "64": return "Jakiro"
    case "65": return "Batrider"
    case "66": return "Chen"
    case "67": return "Spectre"
    case "69": return "Doom"
    case "68": return "Ancient Apparition"
    case "70": return "Ursa"
    case "71": return "Spirit Breaker"
    case "72": return "Gyrocopter"
    case "73": return "Alchemist"
    case "74": return "Invoker"
    case "75": return "Silencer"
    case "76": return "Outworld Destroyer"
    case "77": return "Lycan"
    case "78": return "Brewmaster"
    case "79": return "Shadow Demon"
    case "80": return "Lone Druid"
    case "81": return "Chaos Knight"
    case "82": return "Meepo"
    case "83": return "Treant Protector"
    case "84": return "Ogre Magi"
    case "85": return "Undying"
    case "86": return "Rubick"
    case "87": return "Disruptor"
    case "88": return "Nyx Assassin"
    case "89": return "Naga Siren"
    case "90": return "Keeper of the light"
    case "91": return "IO"
    case "92": return "Visage"
    case "93": return "Slark"
    case "94": return "Medusa"
    case "95": return "Troll Warlord"
    case "96": return "Centaur Warrunner"
    case "97": return "Magnus"
    case "98": return "Timbersaw"
    case "99": return "Bristleback"
    case "100": return "Tusk"
    case "101": return "Skywrathmage"
    case "102": return "Abaddon"
    case "103": return "Elder Titan"
    case "104": return "Legion Commander"
    case "105": return "Techies"
    case "106": return "Ember Spirit"
    case "107": return "Earth Spirit"
    case "108": return "Underlord"
    case "109": return "Terrorblade"
    case "110": return "Phoenix"
    case "111": return "Oracle"
    case "112": return "Winter Wyvern"
    case "113": return "Arc Warden"
    case "114": return "Monkey King"
    case "119": return "Dark Willow"
    case "120": return "Pangolier"
    case "121": return "Grimstroke"
    case "123": return "Hoodwink"
    case "126": return "Void Spirit"
    case "128": return "Snapfire"
    case "129": return "Mars"
    case "135": return "Dawnbreaker"
    case "136": return "Marci"
    case "137": return "Primal Beast"
    case "138": return "Muerta"
        
    default: return "error"
    }
}

func fromIDToSide(ID playerSlot: Int) -> String {
    switch playerSlot {
    case 0...127: return "Radiant"
    case 128...255: return "Dire"
    default: return "error"
    }
}

func fromIDToGameMode(ID gameModeID: Int) -> String {
    switch gameModeID {
    case 1: return "All pick"
    case 2: return "Captains mode"
    case 3: return "Random draft"
    case 4: return "Single draft"
    case 5: return "All random"
    case 7: return "Diretide"
    case 11: return "Mid only"
    case 15: return "Custom"
    case 18: return "Ability draft"
    case 21: return "1v1 mid"
    case 22: return "All draft"
    case 23: return "Turbo"
        // Should add another modes here
    default: return "Unknown"
    }
}

func secondsFormatter(seconds: Double) -> String {
    let formatter = DateComponentsFormatter()
    return formatter.string(from: seconds) ?? "00:00"
}

func timeSince(seconds: Int) -> String {
    let seconds = Int(Date().timeIntervalSince1970) - seconds
    let minutes = seconds / 60
    let hours = minutes / 60
    let days = hours / 24
    let weeks = days / 7
    let months = Double(weeks) / 4.345
    let years = months / 12.0
    if seconds < 60 {
        if seconds < 2 {
            return "\(seconds) second"
        }
        return "\(seconds) seconds"
    } else if minutes < 60 {
        if minutes < 2 {
            return "\(minutes) minute"
        }
        return "\(minutes) minutes"
    } else if hours < 24 {
        if hours < 2 {
            return "\(hours) hour"
        }
        return "\(hours) hours"
    } else if days < 7 {
        if days < 2 {
            return "\(days) day"
        }
        return "\(days) days"
    } else if Double(weeks) < 4.345 {
        if weeks < 2 {
            return "\(weeks) week"
        }
        return "\(weeks) weeks"
    } else if months < 12 {
        if months < 2 {
            return "\(Int(months)) month"
        }
        return "\(Int(months)) months"
    } else {
        if years < 2 {
            return "\(Int(years)) year"
        }
        return "\(Int(years)) years"
    }
}
