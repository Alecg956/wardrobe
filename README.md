# App Makers

Directory Structure:

```
.
├── 441StarterAppBackend
|   
│   ├── README.md
│   ├── chatter
│   │   ├── __init__.py
│   │   ├── admin.py
│   │   ├── migrations
│   │   │   └── __init__.py
│   │   ├── models.py
│   │   ├── tests.py
│   │   └── views.py
│   ├── django_project
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── settings.py.orig
│   │   ├── urls.py
│   │   └── wsgi.py
│   └── manage.py
|   
├── 441StarterAppiOS
|   
│   ├── 441StarterApp
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   ├── AppIcon.appiconset
│   │   │   │   └── Contents.json
│   │   │   └── Contents.json
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   ├── ChatterTableViewCell.swift
│   │   ├── ChatterTableViewController.swift
│   │   ├── ComposeViewController.swift
│   │   └── Info.plist
│   └── 441StarterApp.xcodeproj
│       ├── project.pbxproj
│       ├── project.xcworkspace
│       │   ├── contents.xcworkspacedata
│       │   ├── xcshareddata
│       │   │   └── IDEWorkspaceChecks.plist
│       │   └── xcuserdata
│       │       └── alecgoldberg.xcuserdatad
│       │           └── UserInterfaceState.xcuserstate
│       └── xcuserdata
│           └── alecgoldberg.xcuserdatad
│               ├── xcdebugger
│               │   └── Breakpoints_v2.xcbkptlist
│               └── xcschemes
│                   └── xcschememanagement.plist
├── README.md
└── wardrobe
    ├── Podfile
    ├── Podfile.lock
    ├── Pods
    │   ├── Firebase
    │   │   ├── CoreOnly
    │   │   │   └── Sources
    │   │   │       ├── Firebase.h
    │   │   │       └── module.modulemap
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── FirebaseAnalytics
    │   │   └── Frameworks
    │   │       ├── FIRAnalyticsConnector.framework
    │   │       │   ├── FIRAnalyticsConnector
    │   │       │   └── Modules
    │   │       │       └── module.modulemap
    │   │       └── FirebaseAnalytics.framework
    │   │           ├── FirebaseAnalytics
    │   │           ├── Headers
    │   │           │   ├── FIRAnalytics+AppDelegate.h
    │   │           │   ├── FIRAnalytics.h
    │   │           │   ├── FIREventNames.h
    │   │           │   ├── FIRParameterNames.h
    │   │           │   ├── FIRUserPropertyNames.h
    │   │           │   └── FirebaseAnalytics.h
    │   │           └── Modules
    │   │               └── module.modulemap
    │   ├── FirebaseAuthInterop
    │   │   ├── Interop
    │   │   │   └── Auth
    │   │   │       └── Public
    │   │   │           └── FIRAuthInterop.h
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── FirebaseCore
    │   │   ├── Firebase
    │   │   │       └── Public
    │   │   │           ├── FIRApp.h
    │   │   │           ├── FIRConfiguration.h
    │   │   │           ├── FIRLoggerLevel.h
    │   │   │           ├── FIROptions.h
    │   │   │           └── FirebaseCore.h
    │   │   ├── LICENSE
    │   │   └── README.md
    |   |   
    │   ├── FirebaseCoreDiagnostics
    │   │   ├── Firebase
    │   │   │   ├── Core
    │   │   │   └── CoreDiagnostics
    │   │   ├── LICENSE
    │   │   └── README.md
    |   |   
    │   ├── FirebaseCoreDiagnosticsInterop
    │   │   ├── Interop
    │   │   │   └── CoreDiagnostics
    │   │   │       └── Public
    │   │   │           ├── FIRCoreDiagnosticsData.h
    │   │   │           └── FIRCoreDiagnosticsInterop.h
    │   │   ├── LICENSE
    │   │   └── README.md
    |   |   
    │   ├── FirebaseDatabase
    │   │   ├── Firebase
    │   │   │   └── Database
    │   │   │      
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── FirebaseInstanceID
    │   │   ├── Firebase
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── GoogleAppMeasurement
    │   │   └── Frameworks
    │   │       └── GoogleAppMeasurement.framework
    │   │           ├── GoogleAppMeasurement
    │   │           └── Modules
    │   │               └── module.modulemap
    │   ├── GoogleDataTransport
    │   │   ├── GoogleDataTransport
    │   │   │   └── GDTCORLibrary
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── GoogleDataTransportCCTSupport
    │   │   ├── GoogleDataTransport
    │   │   ├── GoogleDataTransportCCTSupport
    │   │   │   └── GDTCCTLibrary
    │   │   │       ├── GDTCCTNanopbHelpers.m
    │   │   │       ├── GDTCCTPrioritizer.m
    │   │   │       ├── GDTCCTUploader.m
    │   │   │       ├── GDTFLLPrioritizer.m
    │   │   │       ├── GDTFLLUploader.m
    │   │   │       ├── Private
    │   │   │       │   ├── GDTCCTNanopbHelpers.h
    │   │   │       │   ├── GDTCCTPrioritizer.h
    │   │   │       │   ├── GDTCCTUploader.h
    │   │   │       │   ├── GDTFLLPrioritizer.h
    │   │   │       │   └── GDTFLLUploader.h
    │   │   │       └── Protogen
    │   │   │           └── nanopb
    │   │   │               ├── cct.nanopb.c
    │   │   │               └── cct.nanopb.h
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── GoogleUtilities
    │   │   ├── GoogleUtilities
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── Headers
    │   ├── Local\ Podspecs
    │   ├── Manifest.lock
    │   ├── Pods.xcodeproj
    │   │   ├── project.pbxproj
    │   │   └── xcuserdata
    │   │       └── alecgoldberg.xcuserdatad
    │   │           └── xcschemes
    │   │               ├── Firebase.xcscheme
    │   │               ├── FirebaseAnalytics.xcscheme
    │   │               ├── FirebaseAuthInterop.xcscheme
    │   │               ├── FirebaseCore.xcscheme
    │   │               ├── FirebaseCoreDiagnostics.xcscheme
    │   │               ├── FirebaseCoreDiagnosticsInterop.xcscheme
    │   │               ├── FirebaseDatabase.xcscheme
    │   │               ├── FirebaseInstanceID.xcscheme
    │   │               ├── GoogleAppMeasurement.xcscheme
    │   │               ├── GoogleDataTransport.xcscheme
    │   │               ├── GoogleDataTransportCCTSupport.xcscheme
    │   │               ├── GoogleUtilities.xcscheme
    │   │               ├── Pods-wardrobe.xcscheme
    │   │               ├── SwiftGifOrigin.xcscheme
    │   │               ├── leveldb-library.xcscheme
    │   │               ├── nanopb.xcscheme
    │   │               └── xcschememanagement.plist
    │   ├── SwiftGifOrigin
    │   │   ├── LICENSE
    │   │   ├── README.md
    │   │   ├── SwiftGif
    │   │   └── SwiftGifCommon
    │   │       └── UIImage+Gif.swift
    │   ├── Target\ Support\ Files
    │   │   ├── Firebase
    │   │   │   └── Firebase.xcconfig
    │   │   ├── FirebaseAnalytics
    │   │   │   └── FirebaseAnalytics.xcconfig
    │   │   ├── FirebaseAuthInterop
    │   │   │   └── FirebaseAuthInterop.xcconfig
    │   │   ├── FirebaseCore
    │   │   │   ├── FirebaseCore-Info.plist
    │   │   │   ├── FirebaseCore-dummy.m
    │   │   │   ├── FirebaseCore-umbrella.h
    │   │   │   ├── FirebaseCore.modulemap
    │   │   │   └── FirebaseCore.xcconfig
    │   │   ├── FirebaseCoreDiagnostics
    │   │   │   ├── FirebaseCoreDiagnostics-Info.plist
    │   │   │   ├── FirebaseCoreDiagnostics-dummy.m
    │   │   │   ├── FirebaseCoreDiagnostics-umbrella.h
    │   │   │   ├── FirebaseCoreDiagnostics.modulemap
    │   │   │   └── FirebaseCoreDiagnostics.xcconfig
    │   │   ├── FirebaseCoreDiagnosticsInterop
    │   │   │   └── FirebaseCoreDiagnosticsInterop.xcconfig
    │   │   ├── FirebaseDatabase
    │   │   │   ├── FirebaseDatabase-Info.plist
    │   │   │   ├── FirebaseDatabase-dummy.m
    │   │   │   ├── FirebaseDatabase-umbrella.h
    │   │   │   ├── FirebaseDatabase.modulemap
    │   │   │   └── FirebaseDatabase.xcconfig
    │   │   ├── FirebaseInstanceID
    │   │   │   ├── FirebaseInstanceID-Info.plist
    │   │   │   ├── FirebaseInstanceID-dummy.m
    │   │   │   ├── FirebaseInstanceID-umbrella.h
    │   │   │   ├── FirebaseInstanceID.modulemap
    │   │   │   └── FirebaseInstanceID.xcconfig
    │   │   ├── GoogleAppMeasurement
    │   │   │   └── GoogleAppMeasurement.xcconfig
    │   │   ├── GoogleDataTransport
    │   │   │   ├── GoogleDataTransport-Info.plist
    │   │   │   ├── GoogleDataTransport-dummy.m
    │   │   │   ├── GoogleDataTransport-umbrella.h
    │   │   │   ├── GoogleDataTransport.modulemap
    │   │   │   └── GoogleDataTransport.xcconfig
    │   │   ├── GoogleDataTransportCCTSupport
    │   │   │   ├── GoogleDataTransportCCTSupport-Info.plist
    │   │   │   ├── GoogleDataTransportCCTSupport-dummy.m
    │   │   │   ├── GoogleDataTransportCCTSupport-umbrella.h
    │   │   │   ├── GoogleDataTransportCCTSupport.modulemap
    │   │   │   └── GoogleDataTransportCCTSupport.xcconfig
    │   │   ├── GoogleUtilities
    │   │   │   ├── GoogleUtilities-Info.plist
    │   │   │   ├── GoogleUtilities-dummy.m
    │   │   │   ├── GoogleUtilities-prefix.pch
    │   │   │   ├── GoogleUtilities-umbrella.h
    │   │   │   ├── GoogleUtilities.modulemap
    │   │   │   └── GoogleUtilities.xcconfig
    │   │   ├── Pods-wardrobe
    │   │   │   ├── Pods-wardrobe-Info.plist
    │   │   │   ├── Pods-wardrobe-acknowledgements.markdown
    │   │   │   ├── Pods-wardrobe-acknowledgements.plist
    │   │   │   ├── Pods-wardrobe-dummy.m
    │   │   │   ├── Pods-wardrobe-frameworks-Debug-input-files.xcfilelist
    │   │   │   ├── Pods-wardrobe-frameworks-Debug-output-files.xcfilelist
    │   │   │   ├── Pods-wardrobe-frameworks-Release-input-files.xcfilelist
    │   │   │   ├── Pods-wardrobe-frameworks-Release-output-files.xcfilelist
    │   │   │   ├── Pods-wardrobe-frameworks.sh
    │   │   │   ├── Pods-wardrobe-umbrella.h
    │   │   │   ├── Pods-wardrobe.debug.xcconfig
    │   │   │   ├── Pods-wardrobe.modulemap
    │   │   │   └── Pods-wardrobe.release.xcconfig
    │   │   ├── SwiftGifOrigin
    │   │   │   ├── SwiftGifOrigin-Info.plist
    │   │   │   ├── SwiftGifOrigin-dummy.m
    │   │   │   ├── SwiftGifOrigin-prefix.pch
    │   │   │   ├── SwiftGifOrigin-umbrella.h
    │   │   │   ├── SwiftGifOrigin.modulemap
    │   │   │   └── SwiftGifOrigin.xcconfig
    │   │   ├── leveldb-library
    │   │   │   ├── leveldb-library-Info.plist
    │   │   │   ├── leveldb-library-dummy.m
    │   │   │   ├── leveldb-library-prefix.pch
    │   │   │   ├── leveldb-library-umbrella.h
    │   │   │   ├── leveldb-library.modulemap
    │   │   │   └── leveldb-library.xcconfig
    │   │   └── nanopb
    │   │       ├── nanopb-Info.plist
    │   │       ├── nanopb-dummy.m
    │   │       ├── nanopb-prefix.pch
    │   │       ├── nanopb-umbrella.h
    │   │       ├── nanopb.modulemap
    │   │       └── nanopb.xcconfig
    │   ├── leveldb-library
    │   │   ├── LICENSE
    │   │   ├── README.md
    │   │   ├── db
    │   └── nanopb
    │       ├── LICENSE.txt
    │       ├── README.md
    │       ├── pb.h
    │       ├── pb_common.c
    │       ├── pb_common.h
    │       ├── pb_decode.c
    │       ├── pb_decode.h
    │       ├── pb_encode.c
    │       └── pb_encode.h
    |   
    ├── wardrobe
    |   
    │   ├── ARTestViewController.swift
    │   ├── AppDelegate.swift
    │   ├── Assets.xcassets
    │   │   ├── AppIcon.appiconset
    │   │   │   ├── 1024.png
    │   │   │   ├── 120.png
    │   │   │   ├── 152.png
    │   │   │   ├── 167.png
    │   │   │   ├── 180.png
    │   │   │   ├── 76.png
    │   │   │   └── Contents.json
    │   │   ├── Contents.json
    │   │   ├── black_denim_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── Fabric_Denim_002_ROUGH.jpg
    │   │   ├── black_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── renli-su-black-Fine-Black-Texture-Tee-Shirt.jpg
    │   │   ├── blue_fabric.imageset
    │   │   │   ├── 19313273-t-shirt-color-texture-background.jpg
    │   │   │   └── Contents.json
    │   │   ├── button_up_shirt.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── T.jpg
    │   │   ├── camo_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── Fabric_Camo_003_basecolor.jpg
    │   │   ├── cap.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── flat-bill-snapback-cap-cap94-white1520957531.jpg
    │   │   ├── chinos.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── cn16737124.jpg
    │   │   ├── dress.imageset
    │   │   │   ├── 30414465386857m.jpeg
    │   │   │   └── Contents.json
    │   │   ├── green_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── green-heather-knit-t-shit-fabric-texture.jpg
    │   │   ├── help.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── pokemon-go-present-future-1.jpg
    │   │   ├── help_gif.dataset
    │   │   │   ├── Contents.json
    │   │   │   └── ezgif.com-crop.gif
    │   │   ├── jeans_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── Fabric_Denim_002_COLOR.jpg
    │   │   ├── khaki_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── everytexture.com-stock-fabric-texture-00061-1024x768.jpg
    │   │   ├── orange_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── orange-micro-fiber-cloth-fabric-texture.jpg
    │   │   ├── red_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── red-heather-knit-t-shirt-fabric-texture.jpg
    │   │   ├── sample.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── download.png
    │   │   ├── silver_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── silver_fabric.png
    │   │   ├── sneakers.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── shopping.jpg
    │   │   ├── white_denim_fabric.imageset
    │   │   │   ├── Contents.json
    │   │   │   └── Fabric_Denim_002_OCC.jpg
    │   │   └── white_fabric.imageset
    │   │       ├── Contents.json
    │   │       └── white_fabric.jpg
    |   |   
    │   ├── Base.lproj
    │   │   ├── LaunchScreen.storyboard
    │   │   └── Main.storyboard
    │   ├── BrowseDetailTableViewCell.swift
    │   ├── BrowseDetailTableViewController.swift
    │   ├── BrowseTableViewCell.swift
    │   ├── BrowseTableViewController.swift
    │   ├── CustomizeViewController.swift
    │   ├── Globals.swift
    │   ├── GoogleService-Info.plist
    │   ├── Info.plist
    │   ├── PurchaseTableViewCell.swift
    │   ├── PurchaseViewController.swift
    │   ├── art.scnassets
    │   │   ├── clothing
    │   │   │   ├── Button_Up_Shirt.scn
    │   │   │   ├── Cap.scn
    │   │   │   ├── Chinos.scn
    │   │   │   ├── Dress.scn
    │   │   │   └── Sneakers.scn
    │   │   └── models
    │   │       ├── female_model.scn
    │   │       ├── male_model.scn
    │   │       └── other_model.scn
    │   ├── customizeButton.swift
    │   ├── silver_fabric.png
    │   ├── testUIButton.swift
    │   └── white_fabric.jpg
    |   
    ├── wardrobe.xcodeproj
    |   
    │   ├── project.pbxproj
    │   ├── project.xcworkspace
    │   │   ├── contents.xcworkspacedata
    │   │   ├── xcshareddata
    │   │   │   └── IDEWorkspaceChecks.plist
    │   │   └── xcuserdata
    │   │       ├── alecgoldberg.xcuserdatad
    │   │       │   └── UserInterfaceState.xcuserstate
    │   │       ├── chualan.xcuserdatad
    │   │       │   └── UserInterfaceState.xcuserstate
    │   │       ├── jacksonmcintyre.xcuserdatad
    │   │       │   └── UserInterfaceState.xcuserstate
    │   │       ├── jmandwee.xcuserdatad
    │   │       │   └── UserInterfaceState.xcuserstate
    │   │       └── swang.xcuserdatad
    │   │           └── UserInterfaceState.xcuserstate
    │   ├── xcshareddata
    │   │   └── xcschemes
    │   │       └── wardrobe.xcscheme
    │   └── xcuserdata
    │       ├── alecgoldberg.xcuserdatad
    │       │   ├── xcdebugger
    │       │   │   └── Breakpoints_v2.xcbkptlist
    │       │   └── xcschemes
    │       │       └── xcschememanagement.plist
    │       └── chualan.xcuserdatad
    │           └── xcschemes
    │               └── xcschememanagement.plist
    └── wardrobe.xcworkspace
        ├── contents.xcworkspacedata
        ├── xcshareddata
        │   └── IDEWorkspaceChecks.plist
        └── xcuserdata
            ├── alecgoldberg.xcuserdatad
            │   ├── UserInterfaceState.xcuserstate
            │   └── xcdebugger
            │       └── Breakpoints_v2.xcbkptlist
            ├── chualan.xcuserdatad
            │   └── UserInterfaceState.xcuserstate
            └── jmandwee.xcuserdatad
                └── UserInterfaceState.xcuserstate

207 directories, 805 files

```

# iOS Starter App Instructions:

1.  Download, update, and install xCode if you don't already have it installed (https://developer.apple.com/xcode/)
2.  Open the 441StarterApp.xcodeproj file in the 441StarterAppiOS folder
3.  (optional) Connect an iOS device using a lightning connector if you are not planning on using the simulator
4.  Press the "play" button at the top left corner of the interface
5.  Watch you simulator/device start and load the application
6.  Done!

# Backend Starter App Instructions:
1. Download, update, and install Postman if you don't already have it installed (https://www.getpostman.com/)
2. Connect to IP address http://167.99.60.42/getchatts/ to get chatt data from backend server with GET request
3. Connect to IP address http://167.99.60.42/addchatt/ to add new chatt data to backend server in JSON format with POST request
4. Connect to IP address http://167.99.60.42/getchatts/ again to verify that newly added chatt is in the database
5. Done!

# Wardrobe App Instructions:

1.  Download, update, and install xCode if you don't already have it installed (https://developer.apple.com/xcode/)
2.  Open the wardrobe.xcworkspace (if you don't open the workspace it won't compile!) file in the wardrobe folder
3.  (optional) Connect an iOS device using a lightning connector if you are not planning on using the simulator
4.  If iOS device is connected, select the device from the simulator drop-down options next to the "Wardrobe" scheme selection
    (found in the gray rectangle to the right of the "stop" button), otherwise choose a simulator device
5.  Press the "play" button at the top left corner of the interface
6.  Watch you simulator/device start and load the application
7.  Done!