import router from '@ohos.router'
import promptAction from '@ohos.promptAction';
import { SPManager } from '../../utils/SPManager';
import AccountData from '../../utils/database/bean/AccountData';
import { Toast } from '../../componets/Toast';
import AccountTable from '../../utils/database/tables/AccountTable';


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
struct LoginPage {
  @State userName: string = "1";
  @State pwd: string = "1";
  private isToHomePage: boolean = false;
  private AccountTable = new AccountTable(() => {
  });

  toLogin() {

    if (this.userName.trim() == '') {
      promptAction.showToast({
        message: '请输入用户名',
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
      this.AccountTable.login(this.userName, this.pwd, (result: AccountData[]) => {

        let isSuccessLogin = result.length > 0;
        if (isSuccessLogin) {
          SPManager.getInstance().save("uid", result[0].id + "")

          SPManager.getInstance().save("name", result[0].account)
          SPManager.getInstance().save("nick", result[0].nick)

          Toast.showToast("登陆成功")
          this.isToHomePage = true

          router.pushUrl({
            url: "pages/Index"
          })

        } else {
          Toast.showToast("用户名密码错误")
        }
      });
    });


  }

  onPageHide() {
    this.isToHomePage && router.clear()
  }

  build() {

    Stack() {
      Row() {
        Column() {

          Image($r("app.media.yaocai"))
            .width(120)
            .height(120)
            .margin({ top: 10 })

          Text("财务记账")
            .fontSize(30)
            .fontColor("#fff")
            .letterSpacing(2)
            .margin({
              top: 20,
              bottom: 40

            })

          TextInput({ placeholder: "账号", text: this.userName })
            .inputStyle()
            .onChange(value => {
              this.userName = value;
            })

          TextInput({ placeholder: "密码", text: this.pwd })
            .inputStyle()// .type(InputType.Password)
            .onChange(value => {
              this.pwd = value;
            })

          Text('还没有账号？去注册')
            .fontSize(18)
            .fontColor('#fff')
            .decoration({ type: TextDecorationType.Underline, color: ('#fff') })
            .textAlign(TextAlign.Start)
            .onClick(() => {
              router.pushUrl({
                url: "pages/register/RegisterPage"
              })
            })

          Button('登 录', { type: ButtonType.Capsule })
            .backgroundColor('#1296db')
            .width("100%")
            .height(55)
            .fontSize(30)
            .type(ButtonType.Normal)
            .borderRadius(8)
            .margin(30)
            .onClick(() => {
              this.toLogin();
            })
        }.width('90%')
        .margin({ left: '5%' })
        .borderRadius(8)

      }
      .width('100%')
      .height("100%")
      .backgroundImage("https://img.zcool.cn/community/016c8d5544e8de0000019ae9d50bee.jpg")
      .backgroundImageSize({ width: '100%', height: '100%' })

    }

  }
}