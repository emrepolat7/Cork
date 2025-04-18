//
//  Licensing - Demo View.swift
//  Cork
//
//  Created by David Bureš on 18.03.2024.
//

import SwiftUI
import CorkShared

struct Licensing_DemoView: View
{
    @AppStorage("demoActivatedAt") var demoActivatedAt: Date?

    @Environment(\.dismiss) var dismiss: DismissAction

    @EnvironmentObject var appState: AppState

    var body: some View
    {
        VStack(alignment: .center, spacing: 15)
        {
            if let demoActivatedAt
            {
                Text("licensing.demo-activated.title")
                    .font(.title)

                Text("licensing.demo.time-until-\((demoActivatedAt + AppConstants.shared.demoLengthInSeconds).formatted(date: .complete, time: .complete))")

                HStack
                {
                    Button
                    {
                        dismiss()
                    } label: {
                        Text("action.close")
                    }
                    .keyboardShortcut(.cancelAction)

                    Spacer()

                    Button
                    {
                        appState.licensingState = .notBoughtOrHasNotActivatedDemo
                    } label: {
                        Text("action.check-license")
                    }
                    .keyboardShortcut(.defaultAction)
                }
            }
        }
        .padding()
        .fixedSize()
    }
}
