# Snapkit

**SnapKit** is a **DSL** to make Auto Layout easy on both iOS and OS X, you can integrate SnapKit into your Xcode project using CocoaPods, Carthage or Swift Package Manager. SnapKit is released under the MIT license.

### Installation

```bash
# 1 - Installation
$ gem install cocoapods

# 2 - Specify info about SnapKit in Podfile

# 3 - Install SnapKit
$ pod install
```

`Podfile`:

```bash
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'SnaoKitDemo' do
    pod 'SnapKit', '~> 5.0.0'
end
```



### Usage

```swift
import SnapKit

class MyViewController: UIViewController {
    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(box)
        box.backgroundColor = .green
        box.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
    }
}
```



### Example

````Swift
import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        
        let userNameTextField = UITextField()
        self.view.addSubview(userNameTextField)
        userNameTextField.placeholder = "Input the username"
        userNameTextField.textColor = .black
        userNameTextField.textAlignment = .center
        userNameTextField.backgroundColor = .white
        userNameTextField.layer.borderWidth = 1
        userNameTextField.layer.borderColor = .init(red: 238/255, green: 90/255, blue: 36/255, alpha: 1.0)
        userNameTextField.layer.cornerRadius = 8
        userNameTextField.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        
        let passwordTextField = UITextField()
        self.view.addSubview(passwordTextField)
        passwordTextField.placeholder = "Input the correct password"
        passwordTextField.textColor = .black
        passwordTextField.textAlignment = .center
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = .init(red: 238/255, green: 90/255, blue: 36/255, alpha: 1.0)
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.masksToBounds = true
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(userNameTextField.snp.topMargin).offset(50)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
        }
        
        let signButton = UIButton(type: .custom)
        self.view.addSubview(signButton)
        signButton.backgroundColor = .orange
        signButton.setTitle("Sign", for: .normal)
        signButton.setTitleColor(.white, for: .normal)
        signButton.isEnabled = true
        signButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        signButton.layer.cornerRadius = 8
        signButton.layer.masksToBounds = true
        signButton.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(passwordTextField.snp.topMargin).offset(50)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
        }
    }
}
````

***Reference***

[https://github.com/SnapKit/SnapKit](https://github.com/SnapKit/SnapKit)

