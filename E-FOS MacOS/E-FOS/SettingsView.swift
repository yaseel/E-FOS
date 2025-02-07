import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("neptun_auto_login") private var autoLoginEnabled = false
    @State private var username: String = loadFromKeychain(account: "neptun_username") ?? ""
    @State private var password: String = loadFromKeychain(account: "neptun_password") ?? ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Toggle("Enable Neptun Auto-Login", isOn: $autoLoginEnabled)
            
            TextField("Neptun Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Neptun Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save") {
                saveToKeychain(account: "neptun_username", password: username)
                saveToKeychain(account: "neptun_password", password: password)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            // Close button aligned to bottom right
            HStack {
                Spacer()
                Button("Close") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                .padding(.bottom, 8)
            }
        }
        .padding()
        .frame(width: 300)
    }
}

#Preview {
    SettingsView()
}
