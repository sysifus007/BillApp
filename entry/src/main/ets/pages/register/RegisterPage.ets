import router from '@ohos.router'
import promptAction from '@ohos.promptAction';
import { SPManager } from '../../utils/SPManager';
import AccountData from '../../utils/database/bean/AccountData';
import AccountTable from '../../utils/database/tables/AccountTable';
import { Toast } from '../../componets/Toast';


@Extend(TextInput)
function inputStyle() {
  .width("100%")
  .height(50)
  .margin(20)
  .borderRadius(8)
  .fontSize(30)
  .type(InputType.Normal)
  .fontColor(Color.White)
  .backgroundColor("#3fff")
}


@Entry
@Component
struct RegisterPage {
  @State userName: string = "1";
  @State pwd: string = "1";
  @State nick: string = "1";
  private isToHomePage: boolean = false;
  @State accounts: Array<AccountData> = [];
  private AccountTable = new AccountTable(() => {
  });
  @State accountData: AccountData = {
    id: 0,
    account: '',
    pwd: '',
    nick: ''
  };

  register() {

    if (this.userName.trim() == '') {
      promptAction.showToast({
        message: '请输入用户名',
        duration: 2000,
        bottom: 400
      })
      return;
    }

    if (this.nick.trim() == '') {
      promptAction.showToast({
        message: '请输入昵称',
        duration: 2000,
        bottom: 400
      })
      return;
    }

    if (this.pwd.trim() == '') {
      promptAction.showToast({
        message: '请输入密码',
        duration: 2000,
        bottom: 400
      })
      return;
    }


    this.AccountTable.getRdbStore(() => {
      this.AccountTable.query(this.userName, (result: AccountData[]) => {
        if (result.length == 0) {
          SPManager.getInstance().save("name", this.userName)
          this.accountData = {
            id: 0,
            account: this.userName,
            pwd: this.pwd,
            nick: this.nick
          };
          this.accept(this.accountData)
          Toast.showToast("注册成功")
          router.back()
        } else {
          Toast.showToast("用户名已存在")
        }
      });
    });


  }

  accept(newAccount: AccountData): void {
    this.AccountTable.insertData(newAccount, (id: number) => {
      newAccount.id = id;
    });
  }

  onPageHide() {
    this.isToHomePage && router.clear();
  }

  build() {

    Stack() {
      Row() {
        Column() {


          Row() {
            Image($r("app.media.icon_back"))
              .width(30)
              .alignSelf(ItemAlign.Start)
              .margin({ right: 5 })
            Text("返回")
              .fontColor(Color.White)
              .fontSize(25)
              .layoutWeight(1)
          }.onClick(e=>{
            router.back()
          })

          Image($r("app.media.yaocai"))
            .width(120)
            .height(120)
            .margin({ top: 10 })


          Text("财务记账")
            .fontSize(30)
            .fontColor("#fff")
            .margin({
              top: 20,
              bottom: 40
            })

          TextInput({ placeholder: "账号", text: this.userName })
            .inputStyle()
            .onChange(value => {
              this.userName = value;
            })
          TextInput({ placeholder: "昵称", text: this.nick })
            .inputStyle()
            .onChange(value => {
              this.nick = value;
            })
          TextInput({ placeholder: "密码", text: this.pwd })
            .inputStyle()// .type(InputType.Password)
            .onChange(value => {
              this.pwd = value;
            })


          Button('注 册', { type: ButtonType.Capsule })
            .backgroundColor('#1296db')
            .width("75%")
            .height(55)
            .fontSize(30)
            .type(ButtonType.Normal)
            .borderRadius(8)
            .margin(30)
            .onClick(() => {
              this.register();
            })
        }.width('90%')
        .borderRadius(8)
        .margin({ left: "5%" })

      }
      .width('100%')
      .height("100%")
      .backgroundImage("https://img.zcool.cn/community/016c8d5544e8de0000019ae9d50bee.jpg")
      .backgroundImageSize({ width: '100%', height: '100%' })

    }

  }
}