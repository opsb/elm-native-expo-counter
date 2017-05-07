# Example project for elm-native-ui with react expo

## Getting started

```
$ npm install -g create-react-native-app
$ elm-install
$ yarn install
$ npm run build
$ npm run start
```

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
