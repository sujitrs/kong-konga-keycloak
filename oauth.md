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

## Which is one if fit for what ?

![image](https://user-images.githubusercontent.com/23429265/166479314-8e64abb0-fa37-4beb-a892-d2f979a769b3.png)

* **First party or third party client :** A first party client is a client that you trust enough to handle the end user’s authorization credentials. For example Spotify’s iPhone app is owned and developed by Spotify so therefore they implicitly trust it. A third party client is a client that you don’t trust.
* **Access Token Owner:** An access token represents a permission granted to a client to access some protected resources. If you are authorizing a machine to access resources and you don’t require the permission of a user to access said resources you should implement the client credentials grant. If you require the permission of a user to access resources you need to determine the client type.
* **Client Type:** 
  * A web application > Is a confidential client running on a web server.  Resource owners access the client via an HTML user interface rendered in a user-agent on the device used by the resource owner.  The client credentials as well as any access token issued to the client are stored on the web server and are not exposed to or accessible by the resource owner.
  * A user-agent-based application > A user-agent-based application is a public client in which the client code is downloaded from a web server and executes within a user-agent (e.g., web browser) on the device used by the resource       owner.  Protocol data and credentials are easily accessible (and often visible) to the resource owner.  Since such applications reside within the user-agent, they can make seamless use of the       user-agent capabilities when requesting authorization.
  * A native application > A native application is a public client installed and executed on the device used by the resource owner.  Protocol data and credentials are accessible to the resource owner.  It is assumed that any client authentication credentials included in the application can be extracted.  On the other hand, dynamically issued credentials such as access tokens or refresh tokens can receive an acceptable level of protection.  At a minimum, these credentials are protected from hostile servers with which the application may interact.  On some platforms, these credentials might be protected from other applications residing on the same device.


