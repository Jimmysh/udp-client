# Capacitor UDPClient Plugin

[![npm][npm-udp-client]][npm-udp-client-url]
![node build][badge-node]
![ios build][badge-ios]

[npm-udp-client]: https://img.shields.io/npm/v/@aiao/udp-client?label=&style=flat-square
[npm-udp-client-url]: https://www.npmjs.com/@aiao/udp-client
[badge-node]: https://github.com/aiao-io/udp-client/workflows/Node/badge.svg
[badge-ios]: https://github.com/aiao-io/udp-client/workflows/iOS/badge.svg

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
