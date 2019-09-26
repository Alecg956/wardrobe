# App Makers

Directory Structure:

```
.
├── 441StarterAppBackend
│   │  
│   ├── README.md
│   ├── chatter
│   │   ├── __init__.py
│   │   ├── admin.py
│   │   ├── migrations
│   │   │   └── __init__.py
│   │   ├── models.py
│   │   ├── tests.py
│   │   └── views.py
│   │  
│   ├── django_project
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── settings.py.orig
│   │   ├── urls.py
│   │   └── wsgi.py
│   └── manage.py
│  
├── 441StarterAppiOS
│   │  
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
└── README.md
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
5. Done
