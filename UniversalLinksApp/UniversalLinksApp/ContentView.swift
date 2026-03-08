//
// ContentView.swift
// UniversalLinksApp
//
// Created by MANAS VIJAYWARGIYA on 08/03/26.
// ------------------------------------------------------------------------
//
// ------------------------------------------------------------------------
//


import SwiftUI

struct ContentView: View {
  @State var deepLink = DeepLinkManager.shared
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
    .sheet(isPresented: $deepLink.showSheet) {
      if let code = deepLink.inviteCode {
        Text(code).font(.title)
      }
    }
    .onOpenURL { url in
      handleDeepLink(url)
    }
  }
  
  func handleDeepLink(_ url: URL) {
    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
          let queryItems = components.queryItems else { return }
    
    if let code = queryItems.first(where: { $0.name == "code" })?.value {
      DeepLinkManager.shared.inviteCode = code
      DeepLinkManager.shared.showSheet = true
    }
  }
}
// xcrun simctl openurl booted https://pete-juridical-reggie.ngrok-free.dev/invite?code=ABC123

#Preview {
  ContentView()
}
