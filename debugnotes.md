# Debug

## Alamofire 5

> **Error**: Module 'Alamofire' has no member named 'request'
> 
> **Solution**: Use the namespace AF.request instead of Alamofire.request



## Print for debug

```swift
print((#file as NSString).lastPathComponent)	//print only filename
print(#function)								//print the name of function
print(#line)									//print line
print("Test")
```

 Tips from <https://www.youtube.com/watch?v=F4R53bRWonA>.

