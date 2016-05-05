# Calculate the total daily heart beats using the Fitbit API

An easy setup using [webscript.io](https://webscript.io) as a plug and play LUA script runner. You can start by creating a redirect for your Oauth authentication.

1) Create redirect URL in webscript with a simple `return 200` script.

2) Register a Fitbit app: https://dev.fitbit.com/

3) Get a Fitbit Oauth token by visiting (edit the webscript redirect URL from 1) & APPID from 2)): https://www.fitbit.com/oauth2/authorize?client_id=APPID&redirect_uri=https:%2F%2FYOURSUBDOMAIN.webscript.io%2FYOURSCRIPTURL&scope=activity%20nutrition%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=31536000&response_type=token

The return URL will include your token: https://YOURSUBDOMAIN.webscript.io/YOURSCRIPTURL#scope=nutrition+weight+location+social+settings+heartrate+sleep+activity+profile&user_id=XYZ&token_type=Bearer&expires_in=30820074&access_token=A.LONG.ACCESS.TOKEN

access_token=**YOURTOKEN**

4) Create a second webscript script and copy-paste `daily-hr-count.lua`. Add your token on `line 2`.

5) Visit your script URL.
