# Capacitor UDPClient Plugin

[![npm][npm-udp-client]][npm-udp-client-url]
[![node build][build-node-udp-client]][build-badge-node]
[![ios build][build-ios-udp-client]][build-badge-ios]

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

[npm-udp-client]: https://img.shields.io/npm/v/@aiao/udp-client?label=&style=flat-square
[npm-udp-client-url]: https://www.npmjs.com/@aiao/udp-client

<!-- build -->

[build-ios-udp-client]: https://github.com/aiao-io/udp-client/actions?query=workflow:iOS
[build-node-udp-client]: https://github.com/aiao-io/udp-client/actions?query=workflow:Node

<!-- badge -->

[build-badge-node]: https://github.com/aiao-io/udp-client/workflows/Node/badge.svg
[build-badge-ios]: https://github.com/aiao-io/udp-client/workflows/iOS/badge.svg
