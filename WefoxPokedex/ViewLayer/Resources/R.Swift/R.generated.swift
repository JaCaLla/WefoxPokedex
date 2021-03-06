//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.font` struct is generated, and contains static references to 8 fonts.
  struct font: Rswift.Validatable {
    /// Font `GothamRounded-BoldItalic`.
    static let gothamRoundedBoldItalic = Rswift.FontResource(fontName: "GothamRounded-BoldItalic")
    /// Font `GothamRounded-Bold`.
    static let gothamRoundedBold = Rswift.FontResource(fontName: "GothamRounded-Bold")
    /// Font `GothamRounded-BookItalic`.
    static let gothamRoundedBookItalic = Rswift.FontResource(fontName: "GothamRounded-BookItalic")
    /// Font `GothamRounded-Book`.
    static let gothamRoundedBook = Rswift.FontResource(fontName: "GothamRounded-Book")
    /// Font `GothamRounded-LightItalic`.
    static let gothamRoundedLightItalic = Rswift.FontResource(fontName: "GothamRounded-LightItalic")
    /// Font `GothamRounded-Light`.
    static let gothamRoundedLight = Rswift.FontResource(fontName: "GothamRounded-Light")
    /// Font `GothamRounded-MediumItalic`.
    static let gothamRoundedMediumItalic = Rswift.FontResource(fontName: "GothamRounded-MediumItalic")
    /// Font `GothamRounded-Medium`.
    static let gothamRoundedMedium = Rswift.FontResource(fontName: "GothamRounded-Medium")
    
    /// `UIFont(name: "GothamRounded-Bold", size: ...)`
    static func gothamRoundedBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedBold, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-BoldItalic", size: ...)`
    static func gothamRoundedBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedBoldItalic, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-Book", size: ...)`
    static func gothamRoundedBook(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedBook, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-BookItalic", size: ...)`
    static func gothamRoundedBookItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedBookItalic, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-Light", size: ...)`
    static func gothamRoundedLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedLight, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-LightItalic", size: ...)`
    static func gothamRoundedLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedLightItalic, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-Medium", size: ...)`
    static func gothamRoundedMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedMedium, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-MediumItalic", size: ...)`
    static func gothamRoundedMediumItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedMediumItalic, size: size)
    }
    
    static func validate() throws {
      if R.font.gothamRoundedBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-Bold' could not be loaded, is 'GothamRounded-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-BoldItalic' could not be loaded, is 'GothamRounded-BoldItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedBook(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-Book' could not be loaded, is 'GothamRounded-Book.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedBookItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-BookItalic' could not be loaded, is 'GothamRounded-BookItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-Light' could not be loaded, is 'GothamRounded-Light.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-LightItalic' could not be loaded, is 'GothamRounded-LightItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-Medium' could not be loaded, is 'GothamRounded-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedMediumItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-MediumItalic' could not be loaded, is 'GothamRounded-MediumItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 3 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `AttributePokemonTVC`.
    static let attributePokemonTVC: Rswift.ReuseIdentifier<AttributePokemonTVC> = Rswift.ReuseIdentifier(identifier: "AttributePokemonTVC")
    /// Reuse identifier `CatchedPokemonCVC`.
    static let catchedPokemonCVC: Rswift.ReuseIdentifier<CatchedPokemonCVC> = Rswift.ReuseIdentifier(identifier: "CatchedPokemonCVC")
    /// Reuse identifier `ImagePokemonTVC`.
    static let imagePokemonTVC: Rswift.ReuseIdentifier<ImagePokemonTVC> = Rswift.ReuseIdentifier(identifier: "ImagePokemonTVC")
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `backpack`.
    static let backpack = _R.storyboard.backpack()
    /// Storyboard `catchPokemon`.
    static let catchPokemon = _R.storyboard.catchPokemon()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "backpack", bundle: ...)`
    static func backpack(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.backpack)
    }
    
    /// `UIStoryboard(name: "catchPokemon", bundle: ...)`
    static func catchPokemon(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.catchPokemon)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 35 localization keys.
    struct localizable {
      /// Value: ...or leave it
      static let catch_pokemon_button_leave = Rswift.StringResource(key: "catch_pokemon_button_leave", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: < Back
      static let person_detail_back = Rswift.StringResource(key: "person_detail_back", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Backpack
      static let tab_backpack = Rswift.StringResource(key: "tab_backpack", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Base experience
      static let catch_pokemon_attribute_base_experience = Rswift.StringResource(key: "catch_pokemon_attribute_base_experience", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Camera
      static let person_detail_picker_camera = Rswift.StringResource(key: "person_detail_picker_camera", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cancel
      static let person_detail_cancel = Rswift.StringResource(key: "person_detail_cancel", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cancel
      static let person_detail_picker_cancel = Rswift.StringResource(key: "person_detail_picker_cancel", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Catch
      static let tab_catched = Rswift.StringResource(key: "tab_catched", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Catch it!
      static let catch_pokemon_button_catch = Rswift.StringResource(key: "catch_pokemon_button_catch", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Catched
      static let catch_pokemon_attribute_catched = Rswift.StringResource(key: "catch_pokemon_attribute_catched", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Choose Image
      static let person_detail_picker_choose_image = Rswift.StringResource(key: "person_detail_picker_choose_image", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: DELETE
      static let person_detail_delete = Rswift.StringResource(key: "person_detail_delete", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Done
      static let person_detail_save = Rswift.StringResource(key: "person_detail_save", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Edit
      static let person_detail_edit = Rswift.StringResource(key: "person_detail_edit", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Experience
      static let catch_pokemon_attribute_experience = Rswift.StringResource(key: "catch_pokemon_attribute_experience", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Gallery
      static let person_detail_picker_gallery = Rswift.StringResource(key: "person_detail_picker_gallery", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Height
      static let catch_pokemon_attribute_height = Rswift.StringResource(key: "catch_pokemon_attribute_height", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Name
      static let catch_pokemon_attribute_name = Rswift.StringResource(key: "catch_pokemon_attribute_name", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: No Pokemon Found!
      static let search_pokemon_alert_title = Rswift.StringResource(key: "search_pokemon_alert_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Not catched yet!!!
      static let catch_pokemon_value_catched_not_catched = Rswift.StringResource(key: "catch_pokemon_value_catched_not_catched", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ok
      static let person_detail_picker_ok_image = Rswift.StringResource(key: "person_detail_picker_ok_image", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ok
      static let search_pokemon_alert_button = Rswift.StringResource(key: "search_pokemon_alert_button", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: People List
      static let person_list_title = Rswift.StringResource(key: "person_list_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Person Detail
      static let person_list_detail = Rswift.StringResource(key: "person_list_detail", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: PokedexTest
      static let search_pokemon_title = Rswift.StringResource(key: "search_pokemon_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Pokemon Detail
      static let catch_pokemon_title = Rswift.StringResource(key: "catch_pokemon_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Press the button for trying to fetch a random Pokemon
      static let search_pokemon_label = Rswift.StringResource(key: "search_pokemon_label", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Try it again
      static let search_pokemon_alert_message = Rswift.StringResource(key: "search_pokemon_alert_message", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Try!
      static let search_pokemon_button_title = Rswift.StringResource(key: "search_pokemon_button_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Types
      static let catch_pokemon_attribute_types = Rswift.StringResource(key: "catch_pokemon_attribute_types", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Warning
      static let person_detail_picker_warning_image = Rswift.StringResource(key: "person_detail_picker_warning_image", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Weight
      static let catch_pokemon_attribute_weight = Rswift.StringResource(key: "catch_pokemon_attribute_weight", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: You don't have camera
      static let person_detail_picker_no_camera_image = Rswift.StringResource(key: "person_detail_picker_no_camera_image", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: email
      static let person_detail_email = Rswift.StringResource(key: "person_detail_email", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: first
      static let person_detail_first = Rswift.StringResource(key: "person_detail_first", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: ...or leave it
      static func catch_pokemon_button_leave(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_button_leave", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: < Back
      static func person_detail_back(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_back", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Backpack
      static func tab_backpack(_: Void = ()) -> String {
        return NSLocalizedString("tab_backpack", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Base experience
      static func catch_pokemon_attribute_base_experience(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_attribute_base_experience", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Camera
      static func person_detail_picker_camera(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_picker_camera", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Cancel
      static func person_detail_cancel(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_cancel", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Cancel
      static func person_detail_picker_cancel(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_picker_cancel", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Catch
      static func tab_catched(_: Void = ()) -> String {
        return NSLocalizedString("tab_catched", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Catch it!
      static func catch_pokemon_button_catch(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_button_catch", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Catched
      static func catch_pokemon_attribute_catched(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_attribute_catched", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Choose Image
      static func person_detail_picker_choose_image(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_picker_choose_image", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: DELETE
      static func person_detail_delete(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_delete", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Done
      static func person_detail_save(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_save", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Edit
      static func person_detail_edit(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_edit", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Experience
      static func catch_pokemon_attribute_experience(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_attribute_experience", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Gallery
      static func person_detail_picker_gallery(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_picker_gallery", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Height
      static func catch_pokemon_attribute_height(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_attribute_height", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Name
      static func catch_pokemon_attribute_name(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_attribute_name", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: No Pokemon Found!
      static func search_pokemon_alert_title(_: Void = ()) -> String {
        return NSLocalizedString("search_pokemon_alert_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Not catched yet!!!
      static func catch_pokemon_value_catched_not_catched(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_value_catched_not_catched", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Ok
      static func person_detail_picker_ok_image(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_picker_ok_image", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Ok
      static func search_pokemon_alert_button(_: Void = ()) -> String {
        return NSLocalizedString("search_pokemon_alert_button", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: People List
      static func person_list_title(_: Void = ()) -> String {
        return NSLocalizedString("person_list_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Person Detail
      static func person_list_detail(_: Void = ()) -> String {
        return NSLocalizedString("person_list_detail", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: PokedexTest
      static func search_pokemon_title(_: Void = ()) -> String {
        return NSLocalizedString("search_pokemon_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Pokemon Detail
      static func catch_pokemon_title(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Press the button for trying to fetch a random Pokemon
      static func search_pokemon_label(_: Void = ()) -> String {
        return NSLocalizedString("search_pokemon_label", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Try it again
      static func search_pokemon_alert_message(_: Void = ()) -> String {
        return NSLocalizedString("search_pokemon_alert_message", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Try!
      static func search_pokemon_button_title(_: Void = ()) -> String {
        return NSLocalizedString("search_pokemon_button_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Types
      static func catch_pokemon_attribute_types(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_attribute_types", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Warning
      static func person_detail_picker_warning_image(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_picker_warning_image", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Weight
      static func catch_pokemon_attribute_weight(_: Void = ()) -> String {
        return NSLocalizedString("catch_pokemon_attribute_weight", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: You don't have camera
      static func person_detail_picker_no_camera_image(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_picker_no_camera_image", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: email
      static func person_detail_email(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_email", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: first
      static func person_detail_first(_: Void = ()) -> String {
        return NSLocalizedString("person_detail_first", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try backpack.validate()
      try catchPokemon.validate()
    }
    
    struct backpack: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let catchedDetailPresenter = StoryboardViewControllerResource<CatchedDetailPresenter>(identifier: "CatchedDetailPresenter")
      let catchedListPresenter = StoryboardViewControllerResource<CatchedListPresenter>(identifier: "CatchedListPresenter")
      let name = "backpack"
      
      func catchedDetailPresenter(_: Void = ()) -> CatchedDetailPresenter? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: catchedDetailPresenter)
      }
      
      func catchedListPresenter(_: Void = ()) -> CatchedListPresenter? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: catchedListPresenter)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.backpack().catchedDetailPresenter() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'catchedDetailPresenter' could not be loaded from storyboard 'backpack' as 'CatchedDetailPresenter'.") }
        if _R.storyboard.backpack().catchedListPresenter() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'catchedListPresenter' could not be loaded from storyboard 'backpack' as 'CatchedListPresenter'.") }
      }
      
      fileprivate init() {}
    }
    
    struct catchPokemon: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = SearchPokemonPresenter
      
      let bundle = R.hostingBundle
      let catchPokemonPresenter = StoryboardViewControllerResource<CatchPokemonPresenter>(identifier: "CatchPokemonPresenter")
      let name = "catchPokemon"
      let searchPokemonPresenter = StoryboardViewControllerResource<SearchPokemonPresenter>(identifier: "SearchPokemonPresenter")
      
      func catchPokemonPresenter(_: Void = ()) -> CatchPokemonPresenter? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: catchPokemonPresenter)
      }
      
      func searchPokemonPresenter(_: Void = ()) -> SearchPokemonPresenter? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: searchPokemonPresenter)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.catchPokemon().catchPokemonPresenter() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'catchPokemonPresenter' could not be loaded from storyboard 'catchPokemon' as 'CatchPokemonPresenter'.") }
        if _R.storyboard.catchPokemon().searchPokemonPresenter() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'searchPokemonPresenter' could not be loaded from storyboard 'catchPokemon' as 'SearchPokemonPresenter'.") }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
