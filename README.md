# Capacitor UDPClient Plugin

[![npm][npm-udp-client]][npm-udp-client-url]
[![Node build][badge-node]][badge-node-url]
[![iOS build][badge-ios]][badge-ios-url]

## Installation

```sh
yarn add @aiao/udp-client
```

## Use

```ts
import { Plugins } from '@capacitor/core';

const { AiaoUDPClient } = Plugins;

await AiaoUDPClient.setup({ '127.0.0.1', port: 123 });
await AiaoUDPClient.send({ value: 'aaa' });
```

<!-- npm -->

[npm-udp-client-url]: https://www.npmjs.com/@aiao/udp-client
[npm-udp-client]: https://img.shields.io/npm/v/@aiao/udp-client?label=&style=flat-square

<!-- badge -->

[badge-ios-url]: https://github.com/aiao-io/udp-client/actions?query=workflow:iOS
[badge-ios]: https://github.com/aiao-io/udp-client/workflows/iOS/badge.svg?branch=master
[badge-node-url]: https://github.com/aiao-io/udp-client/actions?query=workflow:Node
[badge-node]: https://github.com/aiao-io/udp-client/workflows/Node/badge.svg?branch=master
