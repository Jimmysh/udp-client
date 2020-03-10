# Capacitor UDPClient Plugin

[![npm][npm-udp-client]][npm-udp-client-url]
[![node build][badge-node]][badge-node-url]
[![ios build][badge-ios]][badge-ios-url]

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

[badge-ios-url]: https://github.com/aiao-io/udp-client/actions?query=workflow:iOS
[badge-node-url]: https://github.com/aiao-io/udp-client/actions?query=workflow:Node

<!-- badge -->

[badge-node]: https://github.com/aiao-io/udp-client/workflows/Node/badge.svg
[badge-ios]: https://github.com/aiao-io/udp-client/workflows/iOS/badge.svg
