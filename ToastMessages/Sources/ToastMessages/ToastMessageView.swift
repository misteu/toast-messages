//
//  ToastMessageView.swift
//  TestProgressViewStyle
//
//  Created by Michael Steudter on 02.09.25.
//

import SwiftUI

/// A view showing a toast message.
struct ToastMessageView: View {

	let viewModel: ToastMessage

	var body: some View {
		HStack(alignment: .top) {
			viewModel.style.icon
			VStack(alignment: .leading) {
				Text(viewModel.title)
					.font(.callout)
				Text(viewModel.message)
					.font(.caption)
					.foregroundStyle(.secondary)
			}
		}
		.padding(8)
		.background {
			Color.gray.opacity(0.1)
		}
		.clipShape(.rect(cornerRadius: 4))
		.transition(
			.asymmetric(
				insertion: .push(from: .bottom),
				removal: .push(from: .top)
			)
			.combined(with: .opacity)
			
		)
    }
}

#Preview {
	ToastMessageView(
		viewModel: ToastMessage(
			id: "111",
			title: "Title",
			message: "The message",
			style: .success
		)
	)

	ToastMessageView(
		viewModel: ToastMessage(
			id: "222",
			title: "Title",
			message: "The message",
			style: .info
		)
	)

	ToastMessageView(
		viewModel: ToastMessage(
			id: "333",
			title: "Title",
			message: "The message",
			style: .error
		)
	)
}
