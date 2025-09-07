//
//  ToastMessage.swift
//  TestProgressViewStyle
//
//  Created by Michael Steudter on 02.09.25.
//

import SwiftUI

/// All possible types of toast messages.
enum ToastMessageStyle {

	// A success message
	case success
	// An info message
	case info
	// An error message
	case error

	/// The color associated with the type of message.
	private var color: Color {
		switch self {
		case .success: .green
		case .info: .blue
		case .error: .red
		}
	}

	/// The SFSymbol icon name associated with the type of message.
	private var iconName: String {
		switch self {
		case .success: "checkmark.circle"
		case .info: "info.circle"
		case .error: "exclamationmark.triangle"
		}
	}

	/// The icon view to show.
	var icon: some View {
		Image(systemName: iconName)
		.foregroundStyle(color)
	}
}

/// Toast message view model
struct ToastMessage: Identifiable, Equatable {

	/// The toast message's identifier.
	let id: String

	/// The title
	let title: String

	/// The message
	let message: String

	/// The style of the toast message
	let style: ToastMessageStyle
}
