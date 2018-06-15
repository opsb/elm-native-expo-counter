import MessageQueue from 'react-native/Libraries/BatchedBridge/MessageQueue.js';
MessageQueue.spy(info => {
  var name = `${info.module ? info.module + '.' : ''}${info.method}`;
  if (name !== 'RCTDeviceEventEmitter.emit' &&
    name !== 'Networking.sendRequest') {
    // console.log(name);
    console.log(`${info.type === 0 ? 'N->JS' : 'JS->N'} : ` +
      `${info.module ? info.module + '.' : ''}${info.method}` +
      `(${JSON.stringify(info.args)})`,
    );
  }
});

const Elm = require('./elm');
export default Elm.Main.start();
