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

/* let heroes = [
    "1": "antimage",
    "2": "axe",
    "3": "bane",
    "4": "bloodseeker",
    "5": "crystal_maiden",
    "6": "drow_ranger",
    "7": "earthshaker",
    "8": "juggernaut",
    "9": "mirana",
    "10": "morphling",
    "11": "nevermore",
    "12": "phantom_lancer",
    "13": "puck",
    "14": "pudge",
    "15": "razor",
    "16": "sand_king",
    "17": "storm_spirit",
    "18": "sven",
    "19": "tiny",
    "20": "vengefulspirit",
    "21": "windrunner",
    "22": "zuus",
    "23": "kunkka",
    "25": "lina",
    "26": "lion",
    "27": "shadow_shaman",
    "28": "slardar",
    "29": "tidehunter",
    "30": "witch_doctor",
    "31": "lich",
    "32": "riki",
    "33": "enigma",
    "34": "tinker",
    "35": "sniper",
    "36": "necrolyte",
    "37": "warlock",
    "38": "beastmaster",
    "39": "queenofpain",
    "40": "venomancer",
    "41": "faceless_void",
    "42": "skeleton_king",
    "43": "death_prophet",
    "44": "phantom_assassin",
    "45": "pugna",
    "46": "templar_assassin",
    "47": "viper",
    "48": "luna",
    "49": "dragon_knight",
    "50": "dazzle",
    "51": "rattletrap",
    "52": "leshrac",
    "53": "furion",
    "54": "life_stealer",
    "55": "dark_seer",
    "56": "clinkz",
    "57": "omniknight",
    "58": "enchantress",
    "59": "huskar",
    "60": "night_stalker",
    "61": "broodmother",
    "62": "bounty_hunter",
    "63": "weaver",
    "64": "jakiro",
    "65": "batrider",
    "66": "chen",
    "67": "spectre",
    "69": "doom_bringer",
    "68": "ancient_apparition",
    "70": "ursa",
    "71": "spirit_breaker",
    "72": "gyrocopter",
    "73": "alchemist",
    "74": "invoker",
    "75": "silencer",
    "76": "obsidian_destroyer",
    "77": "lycan",
    "78": "brewmaster",
    "79": "shadow_demon",
    "80": "lone_druid",
    "81": "chaos_knight",
    "82": "meepo",
    "83": "treant",
    "84": "ogre_magi",
    "85": "undying",
    "86": "rubick",
    "87": "disruptor",
    "88": "nyx_assassin",
    "89": "naga_siren",
    "90": "keeper_of_the_light",
    "91": "wisp",
    "92": "visage",
    "93": "slark",
    "94": "medusa",
    "95": "troll_warlord",
    "96": "centaur",
    "97": "magnataur",
    "98": "shredder",
    "99": "bristleback",
    "100": "tusk",
    "101": "skywrath_mage",
    "102": "abaddon",
    "103": "elder_titan",
    "104": "legion_commander",
    "105": "techies",
    "106": "ember_spirit",
    "107": "earth_spirit",
    "108": "abyssal_underlord",
    "109": "terrorblade",
    "110": "phoenix",
    "111": "oracle",
    "112": "winter_wyvern",
    "113": "arc_warden",
    "114": "monkey_king",
    "119": "dark_willow",
    "120": "pangolier",
    "121": "grimstroke",
    "123": "hoodwink",
    "126": "void_spirit",
    "128": "snapfire",
    "129": "mars",
    "135": "dawnbreaker",
    "136": "marci",
    "137": "primal_beast",
    "138": "muerta"
]
*/
