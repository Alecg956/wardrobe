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
    │   │   │   └── Core
    │   │   │       ├── FIRAnalyticsConfiguration.m
    │   │   │       ├── FIRApp.m
    │   │   │       ├── FIRAppAssociationRegistration.m
    │   │   │       ├── FIRBundleUtil.m
    │   │   │       ├── FIRComponent.m
    │   │   │       ├── FIRComponentContainer.m
    │   │   │       ├── FIRComponentType.m
    │   │   │       ├── FIRConfiguration.m
    │   │   │       ├── FIRCoreDiagnosticsConnector.m
    │   │   │       ├── FIRDependency.m
    │   │   │       ├── FIRDiagnosticsData.m
    │   │   │       ├── FIRErrors.m
    │   │   │       ├── FIRLogger.m
    │   │   │       ├── FIROptions.m
    │   │   │       ├── FIRVersion.m
    │   │   │       ├── Private
    │   │   │       │   ├── FIRAnalyticsConfiguration.h
    │   │   │       │   ├── FIRAppAssociationRegistration.h
    │   │   │       │   ├── FIRAppInternal.h
    │   │   │       │   ├── FIRBundleUtil.h
    │   │   │       │   ├── FIRComponent.h
    │   │   │       │   ├── FIRComponentContainer.h
    │   │   │       │   ├── FIRComponentContainerInternal.h
    │   │   │       │   ├── FIRComponentType.h
    │   │   │       │   ├── FIRConfigurationInternal.h
    │   │   │       │   ├── FIRCoreDiagnosticsConnector.h
    │   │   │       │   ├── FIRDependency.h
    │   │   │       │   ├── FIRDiagnosticsData.h
    │   │   │       │   ├── FIRErrorCode.h
    │   │   │       │   ├── FIRErrors.h
    │   │   │       │   ├── FIRLibrary.h
    │   │   │       │   ├── FIRLogger.h
    │   │   │       │   ├── FIROptionsInternal.h
    │   │   │       │   └── FIRVersion.h
    │   │   │       └── Public
    │   │   │           ├── FIRApp.h
    │   │   │           ├── FIRConfiguration.h
    │   │   │           ├── FIRLoggerLevel.h
    │   │   │           ├── FIROptions.h
    │   │   │           └── FirebaseCore.h
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── FirebaseCoreDiagnostics
    │   │   ├── Firebase
    │   │   │   ├── Core
    │   │   │   └── CoreDiagnostics
    │   │   │       └── FIRCDLibrary
    │   │   │           ├── FIRCoreDiagnostics.m
    │   │   │           ├── FIRCoreDiagnosticsDateFileStorage.h
    │   │   │           ├── FIRCoreDiagnosticsDateFileStorage.m
    │   │   │           └── Protogen
    │   │   │               └── nanopb
    │   │   │                   ├── firebasecore.nanopb.c
    │   │   │                   └── firebasecore.nanopb.h
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── FirebaseCoreDiagnosticsInterop
    │   │   ├── Interop
    │   │   │   └── CoreDiagnostics
    │   │   │       └── Public
    │   │   │           ├── FIRCoreDiagnosticsData.h
    │   │   │           └── FIRCoreDiagnosticsInterop.h
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── FirebaseDatabase
    │   │   ├── Firebase
    │   │   │   └── Database
    │   │   │       ├── Api
    │   │   │       │   ├── FIRDataSnapshot.m
    │   │   │       │   ├── FIRDatabase.m
    │   │   │       │   ├── FIRDatabaseComponent.h
    │   │   │       │   ├── FIRDatabaseComponent.m
    │   │   │       │   ├── FIRDatabaseConfig.h
    │   │   │       │   ├── FIRDatabaseConfig.m
    │   │   │       │   ├── FIRDatabaseQuery.m
    │   │   │       │   ├── FIRMutableData.m
    │   │   │       │   ├── FIRServerValue.m
    │   │   │       │   ├── FIRTransactionResult.m
    │   │   │       │   └── Private
    │   │   │       │       ├── FIRDataSnapshot_Private.h
    │   │   │       │       ├── FIRDatabaseQuery_Private.h
    │   │   │       │       ├── FIRDatabaseReference_Private.h
    │   │   │       │       ├── FIRDatabase_Private.h
    │   │   │       │       ├── FIRMutableData_Private.h
    │   │   │       │       ├── FIRTransactionResult_Private.h
    │   │   │       │       └── FTypedefs_Private.h
    │   │   │       ├── Constants
    │   │   │       │   ├── FConstants.h
    │   │   │       │   └── FConstants.m
    │   │   │       ├── Core
    │   │   │       │   ├── FCompoundHash.h
    │   │   │       │   ├── FCompoundHash.m
    │   │   │       │   ├── FListenProvider.h
    │   │   │       │   ├── FListenProvider.m
    │   │   │       │   ├── FPersistentConnection.h
    │   │   │       │   ├── FPersistentConnection.m
    │   │   │       │   ├── FQueryParams.h
    │   │   │       │   ├── FQueryParams.m
    │   │   │       │   ├── FQuerySpec.h
    │   │   │       │   ├── FQuerySpec.m
    │   │   │       │   ├── FRangeMerge.h
    │   │   │       │   ├── FRangeMerge.m
    │   │   │       │   ├── FRepo.h
    │   │   │       │   ├── FRepo.m
    │   │   │       │   ├── FRepoInfo.h
    │   │   │       │   ├── FRepoInfo.m
    │   │   │       │   ├── FRepoManager.h
    │   │   │       │   ├── FRepoManager.m
    │   │   │       │   ├── FRepo_Private.h
    │   │   │       │   ├── FServerValues.h
    │   │   │       │   ├── FServerValues.m
    │   │   │       │   ├── FSnapshotHolder.h
    │   │   │       │   ├── FSnapshotHolder.m
    │   │   │       │   ├── FSparseSnapshotTree.h
    │   │   │       │   ├── FSparseSnapshotTree.m
    │   │   │       │   ├── FSyncPoint.h
    │   │   │       │   ├── FSyncPoint.m
    │   │   │       │   ├── FSyncTree.h
    │   │   │       │   ├── FSyncTree.m
    │   │   │       │   ├── FWriteRecord.h
    │   │   │       │   ├── FWriteRecord.m
    │   │   │       │   ├── FWriteTree.h
    │   │   │       │   ├── FWriteTree.m
    │   │   │       │   ├── FWriteTreeRef.h
    │   │   │       │   ├── FWriteTreeRef.m
    │   │   │       │   ├── Operation
    │   │   │       │   │   ├── FAckUserWrite.h
    │   │   │       │   │   ├── FAckUserWrite.m
    │   │   │       │   │   ├── FMerge.h
    │   │   │       │   │   ├── FMerge.m
    │   │   │       │   │   ├── FOperation.h
    │   │   │       │   │   ├── FOperationSource.h
    │   │   │       │   │   ├── FOperationSource.m
    │   │   │       │   │   ├── FOverwrite.h
    │   │   │       │   │   └── FOverwrite.m
    │   │   │       │   ├── Utilities
    │   │   │       │   │   ├── FIRRetryHelper.h
    │   │   │       │   │   ├── FIRRetryHelper.m
    │   │   │       │   │   ├── FImmutableTree.h
    │   │   │       │   │   ├── FImmutableTree.m
    │   │   │       │   │   ├── FPath.h
    │   │   │       │   │   ├── FPath.m
    │   │   │       │   │   ├── FTree.h
    │   │   │       │   │   ├── FTree.m
    │   │   │       │   │   ├── FTreeNode.h
    │   │   │       │   │   └── FTreeNode.m
    │   │   │       │   └── View
    │   │   │       │       ├── FCacheNode.h
    │   │   │       │       ├── FCacheNode.m
    │   │   │       │       ├── FCancelEvent.h
    │   │   │       │       ├── FCancelEvent.m
    │   │   │       │       ├── FChange.h
    │   │   │       │       ├── FChange.m
    │   │   │       │       ├── FChildEventRegistration.h
    │   │   │       │       ├── FChildEventRegistration.m
    │   │   │       │       ├── FDataEvent.h
    │   │   │       │       ├── FDataEvent.m
    │   │   │       │       ├── FEvent.h
    │   │   │       │       ├── FEventRaiser.h
    │   │   │       │       ├── FEventRaiser.m
    │   │   │       │       ├── FEventRegistration.h
    │   │   │       │       ├── FKeepSyncedEventRegistration.h
    │   │   │       │       ├── FKeepSyncedEventRegistration.m
    │   │   │       │       ├── FValueEventRegistration.h
    │   │   │       │       ├── FValueEventRegistration.m
    │   │   │       │       ├── FView.h
    │   │   │       │       ├── FView.m
    │   │   │       │       ├── FViewCache.h
    │   │   │       │       ├── FViewCache.m
    │   │   │       │       └── Filter
    │   │   │       │           ├── FChildChangeAccumulator.h
    │   │   │       │           ├── FChildChangeAccumulator.m
    │   │   │       │           ├── FCompleteChildSource.h
    │   │   │       │           ├── FIndexedFilter.h
    │   │   │       │           ├── FIndexedFilter.m
    │   │   │       │           ├── FLimitedFilter.h
    │   │   │       │           ├── FLimitedFilter.m
    │   │   │       │           └── FNodeFilter.h
    │   │   │       ├── FClock.h
    │   │   │       ├── FClock.m
    │   │   │       ├── FEventGenerator.h
    │   │   │       ├── FEventGenerator.m
    │   │   │       ├── FIRDatabaseConfig_Private.h
    │   │   │       ├── FIRDatabaseReference.m
    │   │   │       ├── FIndex.h
    │   │   │       ├── FIndex.m
    │   │   │       ├── FKeyIndex.h
    │   │   │       ├── FKeyIndex.m
    │   │   │       ├── FListenComplete.h
    │   │   │       ├── FListenComplete.m
    │   │   │       ├── FMaxNode.h
    │   │   │       ├── FMaxNode.m
    │   │   │       ├── FNamedNode.h
    │   │   │       ├── FNamedNode.m
    │   │   │       ├── FPathIndex.h
    │   │   │       ├── FPathIndex.m
    │   │   │       ├── FPriorityIndex.h
    │   │   │       ├── FPriorityIndex.m
    │   │   │       ├── FRangedFilter.h
    │   │   │       ├── FRangedFilter.m
    │   │   │       ├── FTransformedEnumerator.h
    │   │   │       ├── FTransformedEnumerator.m
    │   │   │       ├── FValueIndex.h
    │   │   │       ├── FValueIndex.m
    │   │   │       ├── FViewProcessor.h
    │   │   │       ├── FViewProcessor.m
    │   │   │       ├── FViewProcessorResult.h
    │   │   │       ├── FViewProcessorResult.m
    │   │   │       ├── Login
    │   │   │       │   ├── FAuthTokenProvider.h
    │   │   │       │   ├── FAuthTokenProvider.m
    │   │   │       │   ├── FIRNoopAuthTokenProvider.h
    │   │   │       │   └── FIRNoopAuthTokenProvider.m
    │   │   │       ├── Persistence
    │   │   │       │   ├── FCachePolicy.h
    │   │   │       │   ├── FCachePolicy.m
    │   │   │       │   ├── FLevelDBStorageEngine.h
    │   │   │       │   ├── FLevelDBStorageEngine.m
    │   │   │       │   ├── FPendingPut.h
    │   │   │       │   ├── FPendingPut.m
    │   │   │       │   ├── FPersistenceManager.h
    │   │   │       │   ├── FPersistenceManager.m
    │   │   │       │   ├── FPruneForest.h
    │   │   │       │   ├── FPruneForest.m
    │   │   │       │   ├── FStorageEngine.h
    │   │   │       │   ├── FTrackedQuery.h
    │   │   │       │   ├── FTrackedQuery.m
    │   │   │       │   ├── FTrackedQueryManager.h
    │   │   │       │   └── FTrackedQueryManager.m
    │   │   │       ├── Public
    │   │   │       │   ├── FIRDataEventType.h
    │   │   │       │   ├── FIRDataSnapshot.h
    │   │   │       │   ├── FIRDatabase.h
    │   │   │       │   ├── FIRDatabaseQuery.h
    │   │   │       │   ├── FIRDatabaseReference.h
    │   │   │       │   ├── FIRMutableData.h
    │   │   │       │   ├── FIRServerValue.h
    │   │   │       │   ├── FIRTransactionResult.h
    │   │   │       │   └── FirebaseDatabase.h
    │   │   │       ├── Realtime
    │   │   │       │   ├── FConnection.h
    │   │   │       │   ├── FConnection.m
    │   │   │       │   ├── FWebSocketConnection.h
    │   │   │       │   └── FWebSocketConnection.m
    │   │   │       ├── Snapshot
    │   │   │       │   ├── FChildrenNode.h
    │   │   │       │   ├── FChildrenNode.m
    │   │   │       │   ├── FCompoundWrite.h
    │   │   │       │   ├── FCompoundWrite.m
    │   │   │       │   ├── FEmptyNode.h
    │   │   │       │   ├── FEmptyNode.m
    │   │   │       │   ├── FIndexedNode.h
    │   │   │       │   ├── FIndexedNode.m
    │   │   │       │   ├── FLeafNode.h
    │   │   │       │   ├── FLeafNode.m
    │   │   │       │   ├── FNode.h
    │   │   │       │   ├── FSnapshotUtilities.h
    │   │   │       │   └── FSnapshotUtilities.m
    │   │   │       ├── Utilities
    │   │   │       │   ├── FAtomicNumber.h
    │   │   │       │   ├── FAtomicNumber.m
    │   │   │       │   ├── FEventEmitter.h
    │   │   │       │   ├── FEventEmitter.m
    │   │   │       │   ├── FNextPushId.h
    │   │   │       │   ├── FNextPushId.m
    │   │   │       │   ├── FParsedUrl.h
    │   │   │       │   ├── FParsedUrl.m
    │   │   │       │   ├── FStringUtilities.h
    │   │   │       │   ├── FStringUtilities.m
    │   │   │       │   ├── FTypedefs.h
    │   │   │       │   ├── FUtilities.h
    │   │   │       │   ├── FUtilities.m
    │   │   │       │   ├── FValidation.h
    │   │   │       │   ├── FValidation.m
    │   │   │       │   └── Tuples
    │   │   │       │       ├── FTupleBoolBlock.h
    │   │   │       │       ├── FTupleBoolBlock.m
    │   │   │       │       ├── FTupleCallbackStatus.h
    │   │   │       │       ├── FTupleCallbackStatus.m
    │   │   │       │       ├── FTupleFirebase.h
    │   │   │       │       ├── FTupleFirebase.m
    │   │   │       │       ├── FTupleNodePath.h
    │   │   │       │       ├── FTupleNodePath.m
    │   │   │       │       ├── FTupleObjectNode.h
    │   │   │       │       ├── FTupleObjectNode.m
    │   │   │       │       ├── FTupleObjects.h
    │   │   │       │       ├── FTupleObjects.m
    │   │   │       │       ├── FTupleOnDisconnect.h
    │   │   │       │       ├── FTupleOnDisconnect.m
    │   │   │       │       ├── FTuplePathValue.h
    │   │   │       │       ├── FTuplePathValue.m
    │   │   │       │       ├── FTupleRemovedQueriesEvents.h
    │   │   │       │       ├── FTupleRemovedQueriesEvents.m
    │   │   │       │       ├── FTupleSetIdPath.h
    │   │   │       │       ├── FTupleSetIdPath.m
    │   │   │       │       ├── FTupleStringNode.h
    │   │   │       │       ├── FTupleStringNode.m
    │   │   │       │       ├── FTupleTSN.h
    │   │   │       │       ├── FTupleTSN.m
    │   │   │       │       ├── FTupleTransaction.h
    │   │   │       │       ├── FTupleTransaction.m
    │   │   │       │       ├── FTupleUserCallback.h
    │   │   │       │       └── FTupleUserCallback.m
    │   │   │       └── third_party
    │   │   │           ├── FImmutableSortedDictionary
    │   │   │           │   └── FImmutableSortedDictionary
    │   │   │           │       ├── FArraySortedDictionary.h
    │   │   │           │       ├── FArraySortedDictionary.m
    │   │   │           │       ├── FImmutableSortedDictionary.h
    │   │   │           │       ├── FImmutableSortedDictionary.m
    │   │   │           │       ├── FImmutableSortedSet.h
    │   │   │           │       ├── FImmutableSortedSet.m
    │   │   │           │       ├── FLLRBEmptyNode.h
    │   │   │           │       ├── FLLRBEmptyNode.m
    │   │   │           │       ├── FLLRBNode.h
    │   │   │           │       ├── FLLRBValueNode.h
    │   │   │           │       ├── FLLRBValueNode.m
    │   │   │           │       ├── FTreeSortedDictionary.h
    │   │   │           │       ├── FTreeSortedDictionary.m
    │   │   │           │       ├── FTreeSortedDictionaryEnumerator.h
    │   │   │           │       └── FTreeSortedDictionaryEnumerator.m
    │   │   │           ├── SocketRocket
    │   │   │           │   ├── FSRWebSocket.h
    │   │   │           │   ├── FSRWebSocket.m
    │   │   │           │   ├── NSData+SRB64Additions.h
    │   │   │           │   ├── NSData+SRB64Additions.m
    │   │   │           │   ├── fbase64.c
    │   │   │           │   └── fbase64.h
    │   │   │           └── Wrap-leveldb
    │   │   │               ├── APLevelDB.h
    │   │   │               └── APLevelDB.mm
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── FirebaseInstanceID
    │   │   ├── Firebase
    │   │   │   └── InstanceID
    │   │   │       ├── FIRIMessageCode.h
    │   │   │       ├── FIRInstanceID+Private.m
    │   │   │       ├── FIRInstanceID.m
    │   │   │       ├── FIRInstanceIDAPNSInfo.h
    │   │   │       ├── FIRInstanceIDAPNSInfo.m
    │   │   │       ├── FIRInstanceIDAuthKeyChain.h
    │   │   │       ├── FIRInstanceIDAuthKeyChain.m
    │   │   │       ├── FIRInstanceIDAuthService.h
    │   │   │       ├── FIRInstanceIDAuthService.m
    │   │   │       ├── FIRInstanceIDBackupExcludedPlist.h
    │   │   │       ├── FIRInstanceIDBackupExcludedPlist.m
    │   │   │       ├── FIRInstanceIDCheckinPreferences+Internal.h
    │   │   │       ├── FIRInstanceIDCheckinPreferences+Internal.m
    │   │   │       ├── FIRInstanceIDCheckinPreferences.m
    │   │   │       ├── FIRInstanceIDCheckinPreferences_Private.h
    │   │   │       ├── FIRInstanceIDCheckinService.h
    │   │   │       ├── FIRInstanceIDCheckinService.m
    │   │   │       ├── FIRInstanceIDCheckinStore.h
    │   │   │       ├── FIRInstanceIDCheckinStore.m
    │   │   │       ├── FIRInstanceIDCombinedHandler.h
    │   │   │       ├── FIRInstanceIDCombinedHandler.m
    │   │   │       ├── FIRInstanceIDConstants.h
    │   │   │       ├── FIRInstanceIDConstants.m
    │   │   │       ├── FIRInstanceIDDefines.h
    │   │   │       ├── FIRInstanceIDKeyPair.h
    │   │   │       ├── FIRInstanceIDKeyPair.m
    │   │   │       ├── FIRInstanceIDKeyPairStore.h
    │   │   │       ├── FIRInstanceIDKeyPairStore.m
    │   │   │       ├── FIRInstanceIDKeyPairUtilities.h
    │   │   │       ├── FIRInstanceIDKeyPairUtilities.m
    │   │   │       ├── FIRInstanceIDKeychain.h
    │   │   │       ├── FIRInstanceIDKeychain.m
    │   │   │       ├── FIRInstanceIDLogger.h
    │   │   │       ├── FIRInstanceIDLogger.m
    │   │   │       ├── FIRInstanceIDStore.h
    │   │   │       ├── FIRInstanceIDStore.m
    │   │   │       ├── FIRInstanceIDStringEncoding.h
    │   │   │       ├── FIRInstanceIDStringEncoding.m
    │   │   │       ├── FIRInstanceIDTokenDeleteOperation.h
    │   │   │       ├── FIRInstanceIDTokenDeleteOperation.m
    │   │   │       ├── FIRInstanceIDTokenFetchOperation.h
    │   │   │       ├── FIRInstanceIDTokenFetchOperation.m
    │   │   │       ├── FIRInstanceIDTokenInfo.h
    │   │   │       ├── FIRInstanceIDTokenInfo.m
    │   │   │       ├── FIRInstanceIDTokenManager.h
    │   │   │       ├── FIRInstanceIDTokenManager.m
    │   │   │       ├── FIRInstanceIDTokenOperation+Private.h
    │   │   │       ├── FIRInstanceIDTokenOperation.h
    │   │   │       ├── FIRInstanceIDTokenOperation.m
    │   │   │       ├── FIRInstanceIDTokenStore.h
    │   │   │       ├── FIRInstanceIDTokenStore.m
    │   │   │       ├── FIRInstanceIDURLQueryItem.h
    │   │   │       ├── FIRInstanceIDURLQueryItem.m
    │   │   │       ├── FIRInstanceIDUtilities.h
    │   │   │       ├── FIRInstanceIDUtilities.m
    │   │   │       ├── FIRInstanceIDVersionUtilities.h
    │   │   │       ├── FIRInstanceIDVersionUtilities.m
    │   │   │       ├── NSError+FIRInstanceID.h
    │   │   │       ├── NSError+FIRInstanceID.m
    │   │   │       ├── Private
    │   │   │       │   ├── FIRInstanceID+Private.h
    │   │   │       │   ├── FIRInstanceIDCheckinPreferences.h
    │   │   │       │   └── FIRInstanceID_Private.h
    │   │   │       └── Public
    │   │   │           ├── FIRInstanceID.h
    │   │   │           └── FirebaseInstanceID.h
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
    │   │   │       ├── GDTCORAssert.m
    │   │   │       ├── GDTCORClock.m
    │   │   │       ├── GDTCORConsoleLogger.m
    │   │   │       ├── GDTCORDataFuture.m
    │   │   │       ├── GDTCOREvent.m
    │   │   │       ├── GDTCORLifecycle.m
    │   │   │       ├── GDTCORPlatform.m
    │   │   │       ├── GDTCORReachability.m
    │   │   │       ├── GDTCORRegistrar.m
    │   │   │       ├── GDTCORStorage.m
    │   │   │       ├── GDTCORStoredEvent.m
    │   │   │       ├── GDTCORTransformer.m
    │   │   │       ├── GDTCORTransport.m
    │   │   │       ├── GDTCORUploadCoordinator.m
    │   │   │       ├── GDTCORUploadPackage.m
    │   │   │       ├── Private
    │   │   │       │   ├── GDTCOREvent_Private.h
    │   │   │       │   ├── GDTCORReachability.h
    │   │   │       │   ├── GDTCORReachability_Private.h
    │   │   │       │   ├── GDTCORRegistrar_Private.h
    │   │   │       │   ├── GDTCORStorage.h
    │   │   │       │   ├── GDTCORStorage_Private.h
    │   │   │       │   ├── GDTCORTransformer.h
    │   │   │       │   ├── GDTCORTransformer_Private.h
    │   │   │       │   ├── GDTCORTransport_Private.h
    │   │   │       │   ├── GDTCORUploadCoordinator.h
    │   │   │       │   └── GDTCORUploadPackage_Private.h
    │   │   │       └── Public
    │   │   │           ├── GDTCORAssert.h
    │   │   │           ├── GDTCORClock.h
    │   │   │           ├── GDTCORConsoleLogger.h
    │   │   │           ├── GDTCORDataFuture.h
    │   │   │           ├── GDTCOREvent.h
    │   │   │           ├── GDTCOREventDataObject.h
    │   │   │           ├── GDTCOREventTransformer.h
    │   │   │           ├── GDTCORLifecycle.h
    │   │   │           ├── GDTCORPlatform.h
    │   │   │           ├── GDTCORPrioritizer.h
    │   │   │           ├── GDTCORRegistrar.h
    │   │   │           ├── GDTCORStoredEvent.h
    │   │   │           ├── GDTCORTargets.h
    │   │   │           ├── GDTCORTransport.h
    │   │   │           ├── GDTCORUploadPackage.h
    │   │   │           ├── GDTCORUploader.h
    │   │   │           └── GoogleDataTransport.h
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
    │   │   │   ├── AppDelegateSwizzler
    │   │   │   │   ├── GULAppDelegateSwizzler.m
    │   │   │   │   ├── Internal
    │   │   │   │   │   └── GULAppDelegateSwizzler_Private.h
    │   │   │   │   └── Private
    │   │   │   │       ├── GULAppDelegateSwizzler.h
    │   │   │   │       └── GULApplication.h
    │   │   │   ├── Common
    │   │   │   │   └── GULLoggerCodes.h
    │   │   │   ├── Environment
    │   │   │   │   └── third_party
    │   │   │   │       ├── GULAppEnvironmentUtil.h
    │   │   │   │       └── GULAppEnvironmentUtil.m
    │   │   │   ├── Logger
    │   │   │   │   ├── GULLogger.m
    │   │   │   │   ├── Private
    │   │   │   │   │   └── GULLogger.h
    │   │   │   │   └── Public
    │   │   │   │       └── GULLoggerLevel.h
    │   │   │   ├── MethodSwizzler
    │   │   │   │   ├── GULSwizzler.m
    │   │   │   │   └── Private
    │   │   │   │       ├── GULOriginalIMPConvenienceMacros.h
    │   │   │   │       └── GULSwizzler.h
    │   │   │   ├── NSData+zlib
    │   │   │   │   ├── GULNSData+zlib.h
    │   │   │   │   └── GULNSData+zlib.m
    │   │   │   ├── Network
    │   │   │   │   ├── GULMutableDictionary.m
    │   │   │   │   ├── GULNetwork.m
    │   │   │   │   ├── GULNetworkConstants.m
    │   │   │   │   ├── GULNetworkURLSession.m
    │   │   │   │   └── Private
    │   │   │   │       ├── GULMutableDictionary.h
    │   │   │   │       ├── GULNetwork.h
    │   │   │   │       ├── GULNetworkConstants.h
    │   │   │   │       ├── GULNetworkLoggerProtocol.h
    │   │   │   │       ├── GULNetworkMessageCode.h
    │   │   │   │       └── GULNetworkURLSession.h
    │   │   │   ├── Reachability
    │   │   │   │   ├── GULReachabilityChecker+Internal.h
    │   │   │   │   ├── GULReachabilityChecker.m
    │   │   │   │   └── Private
    │   │   │   │       ├── GULReachabilityChecker.h
    │   │   │   │       └── GULReachabilityMessageCode.h
    │   │   │   └── UserDefaults
    │   │   │       ├── GULUserDefaults.m
    │   │   │       └── Private
    │   │   │           └── GULUserDefaults.h
    │   │   ├── LICENSE
    │   │   └── README.md
    │   ├── Headers
    │   │   ├── Private
    │   │   │   ├── Firebase
    │   │   │   │   └── Firebase.h -> ../../../Firebase/CoreOnly/Sources/Firebase.h
    │   │   │   ├── FirebaseAuthInterop
    │   │   │   │   └── FIRAuthInterop.h -> ../../../FirebaseAuthInterop/Interop/Auth/Public/FIRAuthInterop.h
    │   │   │   └── FirebaseCoreDiagnosticsInterop
    │   │   │       ├── FIRCoreDiagnosticsData.h -> ../../../FirebaseCoreDiagnosticsInterop/Interop/CoreDiagnostics/Public/FIRCoreDiagnosticsData.h
    │   │   │       └── FIRCoreDiagnosticsInterop.h -> ../../../FirebaseCoreDiagnosticsInterop/Interop/CoreDiagnostics/Public/FIRCoreDiagnosticsInterop.h
    │   │   └── Public
    │   │       ├── Firebase
    │   │       │   └── Firebase.h -> ../../../Firebase/CoreOnly/Sources/Firebase.h
    │   │       ├── FirebaseAuthInterop
    │   │       │   └── FIRAuthInterop.h -> ../../../FirebaseAuthInterop/Interop/Auth/Public/FIRAuthInterop.h
    │   │       └── FirebaseCoreDiagnosticsInterop
    │   │           ├── FIRCoreDiagnosticsData.h -> ../../../FirebaseCoreDiagnosticsInterop/Interop/CoreDiagnostics/Public/FIRCoreDiagnosticsData.h
    │   │           └── FIRCoreDiagnosticsInterop.h -> ../../../FirebaseCoreDiagnosticsInterop/Interop/CoreDiagnostics/Public/FIRCoreDiagnosticsInterop.h
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
    │   │   │   ├── builder.cc
    │   │   │   ├── builder.h
    │   │   │   ├── c.cc
    │   │   │   ├── db_impl.cc
    │   │   │   ├── db_impl.h
    │   │   │   ├── db_iter.cc
    │   │   │   ├── db_iter.h
    │   │   │   ├── dbformat.cc
    │   │   │   ├── dbformat.h
    │   │   │   ├── dumpfile.cc
    │   │   │   ├── filename.cc
    │   │   │   ├── filename.h
    │   │   │   ├── log_format.h
    │   │   │   ├── log_reader.cc
    │   │   │   ├── log_reader.h
    │   │   │   ├── log_writer.cc
    │   │   │   ├── log_writer.h
    │   │   │   ├── memtable.cc
    │   │   │   ├── memtable.h
    │   │   │   ├── repair.cc
    │   │   │   ├── skiplist.h
    │   │   │   ├── snapshot.h
    │   │   │   ├── table_cache.cc
    │   │   │   ├── table_cache.h
    │   │   │   ├── version_edit.cc
    │   │   │   ├── version_edit.h
    │   │   │   ├── version_set.cc
    │   │   │   ├── version_set.h
    │   │   │   ├── write_batch.cc
    │   │   │   └── write_batch_internal.h
    │   │   ├── include
    │   │   │   └── leveldb
    │   │   │       ├── c.h
    │   │   │       ├── cache.h
    │   │   │       ├── comparator.h
    │   │   │       ├── db.h
    │   │   │       ├── dumpfile.h
    │   │   │       ├── env.h
    │   │   │       ├── export.h
    │   │   │       ├── filter_policy.h
    │   │   │       ├── iterator.h
    │   │   │       ├── options.h
    │   │   │       ├── slice.h
    │   │   │       ├── status.h
    │   │   │       ├── table.h
    │   │   │       ├── table_builder.h
    │   │   │       └── write_batch.h
    │   │   ├── port
    │   │   │   ├── port.h
    │   │   │   ├── port_example.h
    │   │   │   ├── port_stdcxx.h
    │   │   │   └── thread_annotations.h
    │   │   ├── table
    │   │   │   ├── block.cc
    │   │   │   ├── block.h
    │   │   │   ├── block_builder.cc
    │   │   │   ├── block_builder.h
    │   │   │   ├── filter_block.cc
    │   │   │   ├── filter_block.h
    │   │   │   ├── format.cc
    │   │   │   ├── format.h
    │   │   │   ├── iterator.cc
    │   │   │   ├── iterator_wrapper.h
    │   │   │   ├── merger.cc
    │   │   │   ├── merger.h
    │   │   │   ├── table.cc
    │   │   │   ├── table_builder.cc
    │   │   │   ├── two_level_iterator.cc
    │   │   │   └── two_level_iterator.h
    │   │   └── util
    │   │       ├── arena.cc
    │   │       ├── arena.h
    │   │       ├── bloom.cc
    │   │       ├── cache.cc
    │   │       ├── coding.cc
    │   │       ├── coding.h
    │   │       ├── comparator.cc
    │   │       ├── crc32c.cc
    │   │       ├── crc32c.h
    │   │       ├── env.cc
    │   │       ├── env_posix.cc
    │   │       ├── env_posix_test_helper.h
    │   │       ├── env_windows_test_helper.h
    │   │       ├── filter_policy.cc
    │   │       ├── hash.cc
    │   │       ├── hash.h
    │   │       ├── histogram.cc
    │   │       ├── histogram.h
    │   │       ├── logging.cc
    │   │       ├── logging.h
    │   │       ├── mutexlock.h
    │   │       ├── no_destructor.h
    │   │       ├── options.cc
    │   │       ├── posix_logger.h
    │   │       ├── random.h
    │   │       ├── status.cc
    │   │       ├── testharness.cc
    │   │       ├── testharness.h
    │   │       ├── testutil.h
    │   │       └── windows_logger.h
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
    (found in the gray rectangle to the right of the "stop" button)
5.  Press the "play" button at the top left corner of the interface
6.  Watch you simulator/device start and load the application
7.  Done!