## Swift Tips

#### Set the same name

```Swift
var myBook: String?
if let myBook = myBook {
  print(myBook)
}
```

#### Nil Coalescing operator `??`

```Swift
var myBook: String?
var bookName = ""

bookName = myBook ?? "Unknown"
```

#### `?:`

```Swift
var marks = 0
var message = “”
message = marks > 60 ? "Pass" : "Fail"
```

#### MARK

```Swift
//MARK: - Comments
```

#### Default value for parameters

```Swift
func makeRibs (sauce:String = "Barbeque"){
  //the body of the function
}

makeRibs()
makeRibs(sauce:"Chipotle")
```

