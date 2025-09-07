# toast-messages
Simple toast messages in SwiftUI.

Based on my blog article from 2025-09-02: https://mic.st/blog/how-to-build-swiftui-toast-messages-or-alerts/


## Get started with ToastMessages

### 1. Add package dependency via Swift Package Manager

Add `git@github.com:misteu/toast-messages.git` in Xcode via Swift package manager

### 2. Sample Code

```swift
import SwiftUI
import ToastMessages

struct ContentView: View {

	@State var messages: [ToastMessage] = []

	var randomStyle: ToastMessageStyle {
		let all: [ToastMessageStyle] = [
			.error, .info, .success
		]
		return all.randomElement() ?? .success
	}

    var body: some View {
        VStack {
			Button("Add toast 🍞") {
				messages.append(
					ToastMessage(
						id: UUID().uuidString,
						title: "Hello!! \(UUID().uuidString)",
						message: "message: \(UUID().uuidString)",
						style: randomStyle
					)
				)
			}
			.font(.largeTitle)
			.buttonStyle(.borderedProminent)

			Spacer()
        }
		.containerRelativeFrame([.horizontal, .vertical])
		.overlay(alignment: .bottom) {
			ToastMessageContainer(toastMessages: $messages)
		}
    }
}

#Preview {
    ContentView()
}
```