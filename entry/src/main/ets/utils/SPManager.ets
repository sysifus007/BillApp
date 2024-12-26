import { preferences } from '@kit.ArkData';

export class SPManager {
  private static mInstance: SPManager;
  private pre: preferences.Preferences | null = null;
  private isInitSuccess: boolean = false;


  // 防止实例化
  private constructor() {
  }

  static getInstance(): SPManager {
    if (!SPManager.mInstance) {
      SPManager.mInstance = new SPManager();
      SPManager.mInstance.init();
    }
    return SPManager.mInstance;
  }


  private init() {

    let options: preferences.Options = { name: 'myStore' };
    this.pre = preferences.getPreferencesSync(getContext(this), options);
    this.isInitSuccess = true;
    console.error("preference初始化成功");
  }


  save(key: string, value: string) {
    if(this.pre) {
        this.pre.putSync(key, value);
    }
  }


  async get(key: string, defaults: string): Promise<string> {
    if(this.pre) {
      let value: preferences.ValueType = this.pre.getSync(key, defaults);
      console.error("==========getSync=========" + value);
       return value as string;

    }

    return "";
  }
}