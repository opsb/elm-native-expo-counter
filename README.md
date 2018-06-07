# Example project for elm-native-ui with react expo

## Getting started

```
$ npm install -g create-react-native-app
$ npm install -g elm-github-install       # or: gem install elm_install
$ npm install -g yarn                     # if you don't have yarn installed already
$ elm-install               # on Windows: %appdata%\npm\elm-install
$ yarn install              # on Windows: %appdata%\npm\yarn install
$ npm run build             # on Windows: %appdata%\npm\elm-make src/Main.elm --output elm.js
$ npm run start
```

(In case of hash errors in `yarn install`, try deleting `yarn.lock`, running `yarn cache clean` and again
`yarn install`.)

Then install the react Expo app on iphone or android and use the QR code shown in your console to start the app


## Auto rebuild
A quick solution is to use entr (`$ brew install entr`).

#### Console1
```
$ find src | entr sh -c "npm run build"
```

#### Console2
```
$ npm run start
```
