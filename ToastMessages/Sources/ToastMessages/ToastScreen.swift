//
//  ToastScreen.swift
//  TestProgressViewStyle
//
//  Created by Michael Steudter on 02.09.25.
//

import SwiftUI

struct ToastScreen: View {

	@State var messages: [ToastMessage] = []

	var body: some View {
		VStack {
			Spacer()
			HStack {
				Group {
					Button("show success") {
						messages.append(
							ToastMessage(
								id: UUID().uuidString,
								title: "Hello",
								message: "Success Message",
								style: .success
							)
						)
					}
					Button("show info") {
						messages.append(
							ToastMessage(
								id: UUID().uuidString,
								title: "Hello",
								message: "Info Message",
								style: .info
							)
						)
					}
					Button("show error") {
						messages.append(
							ToastMessage(
								id: UUID().uuidString,
								title: "Hello",
								message: "Error Message",
								style: .error
							)
						)
					}
				}
				.buttonStyle(.bordered)
			}
			Spacer()
		}
		.overlay(alignment: .bottom) {
			ToastMessageContainer(toastMessages: $messages)
		}
	}
}

#Preview {
	ToastScreen()
}
