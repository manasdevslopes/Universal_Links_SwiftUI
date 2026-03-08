//
// DeepLinkManager.swift
// UniversalLinksApp
//
// Created by MANAS VIJAYWARGIYA on 08/03/26.
// ------------------------------------------------------------------------
// 
// ------------------------------------------------------------------------
//
    
import SwiftUI
import Observation

@Observable
class DeepLinkManager {
  
  static let shared = DeepLinkManager()
  
  var showSheet = false
  var inviteCode: String?
}
