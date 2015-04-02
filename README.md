# AppleWatchDemo-Android
此项目简单演示Apple Watch Kit 如何集成环信的SDK
current only few features were implemented but subject to be implemented more in future

##InterfaceController
Apple Watch App Extension bridge implementation，which is the bridge connecting to IOS App

##AppDelegate
###IOS App delegate
func application(application: UIApplication!, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]!, reply: (([NSObject : AnyObject]!) -> Void)!)

##HXSDKHelper
The helper class of HuanXin SDK in which only one sendTextMessage is implemented but more helper APIs will be implemented in this class.
