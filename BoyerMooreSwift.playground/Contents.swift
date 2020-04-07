//
//  Boyer Moore Swift
//
//  Created by Sevan Golnazarian on 4/7/20.
//
//  Simple implementation - there should be another iteration to check if the matched 'PoliticalParty' is > n/2 
//

import Foundation

enum PoliticalParty: Int {
    case red = 1
    case blue
    case white
    case green
    
    static var count: Int { return PoliticalParty.green.rawValue}
    // could use randomPary() to generate an array of attendees
    static func randomParty() -> PoliticalParty {
        let rand = Int.random(in: 1...PoliticalParty.count)
        return PoliticalParty(rawValue: rand)!
    }
}

// O(n) majority vote algorithm
func majorityPartyAtEvent(from attendees: [PoliticalParty]) -> PoliticalParty? {
    var count: Int = 0
    var m: PoliticalParty?
    
    attendees.forEach { attendee in
        if count == 0 {
            m = attendee
            count = 1
        } else if m == attendee {
            count += 1
        } else {
            count -= 1
        }
    }
    return m
}

// seed values - red majority
let eventAttendees: [PoliticalParty] = [.red, .green, .red, .white, .red, .white]
let majorityParty = majorityPartyAtEvent(from: eventAttendees)
print(majorityParty!)

// random attendees - should print a random PoliticalParty
let randomAttendees: [PoliticalParty] = (0...99).map {_ in PoliticalParty.randomParty()}
let randomMajorityPary = majorityPartyAtEvent(from: randomAttendees)
print(randomMajorityPary!)
