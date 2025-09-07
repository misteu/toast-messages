//
//  ToastMessageContainer.swift
//  TestProgressViewStyle
//
//  Created by Michael Steudter on 02.09.25.
//

import SwiftUI

/// Container managing `ToastMessageView`s in a first-in, first-out manner using animations.
public struct ToastMessageContainer: View {

	/// All the toast messages to be shown.
	@Binding var toastMessages: [ToastMessage]

	/// Currently shown toast messages.
	@State var visibleMessages: [ToastMessage] = []

	public init(
		toastMessages: Binding<[ToastMessage]>
	) {
		self._toastMessages = toastMessages
	}

    public var body: some View {
		VStack {
			ForEach(visibleMessages) { model in
				ToastMessageView(viewModel: model)
					.onAppear {
						showNextMessage()
						DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
							withAnimation {
								visibleMessages.removeAll { $0 == model }
							}
						}
					}
			}
		}
		.onChange(of: toastMessages, { oldValue, newValue in
			if newValue.count > oldValue.count {
				showNextMessage()
			}
		})
    }

	/// Shows next message from message stack.
	func showNextMessage() {
		withAnimation(Animation.bouncy(extraBounce: 0.2)) {
			if let lastMessage = toastMessages.popLast() {
				self.visibleMessages.append(lastMessage)
			}
		}
	}
}

#Preview {

	@Previewable @State var messages: [ToastMessage] = [
		.init(id: "1", title: "first", message: "first message", style: .success),
		.init(id: "2", title: "second", message: "second message", style: .info),
		.init(id: "3", title: "third", message: "third message", style: .error)
	]

	ToastMessageContainer(toastMessages: $messages)
}
