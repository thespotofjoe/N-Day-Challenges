//
//  Utils.swift
//  N-Day-Challenges
//
//  Created by Joseph Buchoff on 9/21/20.
//

import Foundation

class CustomDate: Comparable
{
    /* Instance Properties */
    var day: Int
    var month: Int
    var year: Int
    
    // Computed property
    var string: String { return "\(month)/\(day)/\(year)" }
    
    /* Initializers */
    // Initializer from Date object
    init(_ date: Date)
    {
        // Get the user's calendar preferences
        let userCalendar = Calendar.current
        
        // Specify which components we want
        let requestedComponents: Set<Calendar.Component> = [.year,
            .month,
            .day]
        
        // Extract the components from epochtime
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: date)
        
        // Set startDate to string representation of today's date
        self.day = dateTimeComponents.day!
        self.month = dateTimeComponents.month!
        self.year = dateTimeComponents.year!
    }
    
    // Initializer from specifying numbers
    init(day: Int, month: Int, year: Int)
    {
        self.day = day
        self.month = month
        self.year = year
    }
    
    /* Functions for Comparable protocol */
    static func < (lhs: CustomDate, rhs: CustomDate) -> Bool
    {
        // If lhs year is less than the rhs, return true
        if lhs.year < rhs.year
        {
            return true
        } else if lhs.year == rhs.year {
            if lhs.month < rhs.month
            {
                return true
            } else if lhs.month == rhs.month {
                if lhs.day < rhs.day
                {
                    return true
                }
            }
        }
        
        return false
    }
    
    static func == (lhs: CustomDate, rhs: CustomDate) -> Bool
    {
        return (lhs.day == rhs.day && lhs.month == rhs.month && lhs.year == rhs.year)
    }
}

class Challenge
{
    /* Instance Variables */
    var length: Int
    var goal: String
    var startDate: CustomDate
    
    /* Initializers */
    // Initializer to set startDate to today
    init(length: Int, goal: String)
    {
        self.length = length
        self.goal = goal
        
        // Set startDate to now
        startDate = CustomDate(Date())
    }
    
    // Initializer to set startDate to a diffrent date
    init(length: Int, goal: String, startDate: CustomDate)
    {
        self.length = length
        self.goal = goal
        self.startDate = startDate
    }
    
    /* Instance Methods */
    func updateGoal(_ newGoal: String)
    {
        goal = newGoal
    }
}
