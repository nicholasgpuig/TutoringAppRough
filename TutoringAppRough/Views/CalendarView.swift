//
//  CalendarView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDate: Date = Date()
        var body: some View {
            DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
        }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
