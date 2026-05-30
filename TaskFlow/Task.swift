//
//  Task.swift
//  TaskFlow
//
//  Created by Pranjali Kulkarni on 5/29/26.
//

import Foundation

struct Task: Identifiable{
    let id: UUID
    var title: String
    var isCompleted: Bool
}
