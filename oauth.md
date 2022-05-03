# OAuth 

There are four types of grant
* Three-legged Authorization Code flow (RFC 6742 Section 4.1)
* Client Credentials Grant flow (RFC 6742 Section 4.4)
* Implicit Grant flow which allows to provision a token as a result of the authorization process (RFC 6742 Section 4.2)
* Resource Owner Password Credentials Grant flow (RFC 6742 Section 4.3)

## OAuth 2.0 terminology
* Resource Owner: the entity that can grant access to a protected resource. Typically this is the end-user.
* Client: an application requesting access to a protected resource on behalf of the Resource Owner.
* Resource Server: the server hosting the protected resources. This is the API you want to access.
* Authorization Server: the server that authenticates the Resource Owner and issues Access Tokens after getting proper authorization. In this case, Auth0.
* User Agent: the agent used by the Resource Owner to interact with the Client, for example a browser or a native application.

![image](https://user-images.githubusercontent.com/23429265/166479084-4d936166-2beb-4c96-a129-842cff682139.png)

## Which one is fit for which usecase ?

![image](https://user-images.githubusercontent.com/23429265/166479314-8e64abb0-fa37-4beb-a892-d2f979a769b3.png)

* **First party or third party client :** A first party client is a client that you trust enough to handle the end user’s authorization credentials. For example Spotify’s iPhone app is owned and developed by Spotify so therefore they implicitly trust it. A third party client is a client that you don’t trust.
* **Access Token Owner:** An access token represents a permission granted to a client to access some protected resources. If you are authorizing a machine to access resources and you don’t require the permission of a user to access said resources you should implement the client credentials grant. If you require the permission of a user to access resources you need to determine the client type.
* **Client Type:** 
  * A web application > Is a confidential client running on a web server.  Resource owners access the client via an HTML user interface rendered in a user-agent on the device used by the resource owner.  The client credentials as well as any access token issued to the client are stored on the web server and are not exposed to or accessible by the resource owner.
  * A user-agent-based application > A user-agent-based application is a public client in which the client code is downloaded from a web server and executes within a user-agent (e.g., web browser) on the device used by the resource       owner.  Protocol data and credentials are easily accessible (and often visible) to the resource owner.  Since such applications reside within the user-agent, they can make seamless use of the       user-agent capabilities when requesting authorization.
  * A native application > A native application is a public client installed and executed on the device used by the resource owner.  Protocol data and credentials are accessible to the resource owner.  It is assumed that any client authentication credentials included in the application can be extracted.  On the other hand, dynamically issued credentials such as access tokens or refresh tokens can receive an acceptable level of protection.  At a minimum, these credentials are protected from hostile servers with which the application may interact.  On some platforms, these credentials might be protected from other applications residing on the same device.

## Client Credentials Grant (RFC 6749, section 4.4).
 Microservices and APIs
 ![image](https://user-images.githubusercontent.com/23429265/166450799-332e1f4a-f0b5-4f0c-86a6-5aba4005e8c3.png)

## Authorisation Code Grant (RFC 6742 Section 4.1)
 Web Application with Server Backend: Because regular web apps are server-side apps where the source code is not publicly exposed, they can use the Authorization Code Flow, which exchanges an Authorization Code for a token.

 ![image](https://user-images.githubusercontent.com/23429265/166450892-cecccd43-cba8-42c8-b28d-0fbb512613cc.png)

## Password Grant (RFC 6742 Section 4.3)

Trusted Client/First party - Native App or User Agent Based Apps
![image](https://user-images.githubusercontent.com/23429265/166454396-32296cbf-38ad-42c7-90c3-8384a7c48012.png)

## Authorisation Code Flow with PKCE
 During authentication, mobile and native applications can use the Authorization Code Flow, but they require additional security. Additionally, single-page apps have special challenges. To mitigate these, OAuth 2.0 provides a version of the Authorization Code Flow which makes use of a Proof Key for Code Exchange (PKCE).
When public clients (e.g., native and single-page applications) request Access Tokens, some additional security concerns are posed that are not mitigated by the Authorization Code Flow alone. This is because:

* Native apps : Cannot securely store a Client Secret. Decompiling the app will reveal the Client Secret, which is bound to the app and is the same for all users and devices. May make use of a custom URL scheme to capture redirects (e.g., MyApp://) potentially allowing malicious applications to receive an Authorization Code from your Authorization Server.

* Single-page apps: Cannot securely store a Client Secret because their entire source is available to the browser.
Given these situations, OAuth 2.0 provides a version of the Authorization Code Flow which makes use of a Proof Key for Code Exchange (PKCE) (defined in OAuth 2.0 RFC 7636).

The PKCE-enhanced Authorization Code Flow introduces a secret created by the calling application that can be verified by the authorization server; this secret is called the Code Verifier. Additionally, the calling app creates a transform value of the Code Verifier called the Code Challenge and sends this value over HTTPS to retrieve an Authorization Code. This way, a malicious attacker can only intercept the Authorization Code, and they cannot exchange it for a token without the Code Verifier.

![image](https://user-images.githubusercontent.com/23429265/166483893-1e0d3fd5-9f7b-410a-b4f5-d765fd9fbef9.png)

 
## Implicit Grant (RFC 6742 Section 4.2)
 For Third Party/Untrusted Client User Agent Based Apps
 ![image](https://user-images.githubusercontent.com/23429265/166450929-b5a8a93d-f40b-4eda-ba51-be2a92c5a41f.png)


