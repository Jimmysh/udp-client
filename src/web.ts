import { WebPlugin } from '@capacitor/core';
import { AiaoUDPClientPlugin } from './definitions';

export class AiaoUDPClientWeb extends WebPlugin implements AiaoUDPClientPlugin {
  constructor() {
    super({
      name: 'AiaoUDPClient',
      platforms: ['web']
    });
  }

  setup(options: { host: string; port: number }): Promise<{ host: string; port: number }> {
    return Promise.resolve(options);
  }
  send(_?: { value: string }): Promise<boolean> {
    return Promise.resolve(true);
  }
}

const AiaoUDPClient = new AiaoUDPClientWeb();

export { AiaoUDPClient };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(AiaoUDPClient);
