declare module '@capacitor/core' {
  interface PluginRegistry {
    AiaoUDPClient: AiaoUDPClientPlugin;
  }
}

export interface AiaoUDPClientPlugin {
  setup(options: { host: string; port: number }): Promise<{ host: string; port: number }>;
  send(options: { value: string }): Promise<boolean>;
}
