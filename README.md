# Structured Networking

Strongly typed networking built on top of Combine

#### What the API looks like

```swift
let networking = Networking(
    baseURLStringProvider: { (request) -> String in
        return "http://exampleapi.com"
    }
)

LoginEndpoint(body: LoginRequestBody(useername: "me", password: "something"))
	.execute(with: networking)
	.sink { (completion) in
       // error checking
   } receiveValue: { (response: AuthResponse) in
       print(response)
   }
```


#### How to define endpoints
Endpoints define all aspects of the request and response in types. If an endpoint doesnt have a params, query or a body you can use Void to indicate this is unused.

*NOTE*: It is your responsibility to define how `Parameters` fit in the endpoint

```swift
public struct LoginEndpoint: APIRequest {

    public typealias Parameters = Void
    public typealias Query = Void
    public typealias Body = LoginRequestBody
    
    public typealias ResponseBody = AuthResponse

    public static let method: HTTPMethod = .post

    public var parameters: Parameters = ()
    public var query: Query = ()
    public var body: LoginRequestBody

    public var endpoint: String {
        "/users/login"
    }
}

```

#### Accompanying endpoint structures

```swift
public struct LoginRequestBody: Codable {
    public var password: String
    public var username: String
}

```

```swift
public struct AuthResponse: Codable {
    public var refreshToken: String
    public var refreshTokenExpiry: Date
    public var token: String
    public var tokenExpiry: Date
}

```
