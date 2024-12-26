import router from '@ohos.router';
import CommonConstants from '../constants/CommonConstants';
import { SPManager } from '../utils/SPManager';


@Entry
@Component
struct SplashPage {
  @State countDownSeconds: number = 5;  //倒计时5秒
  private timeId: number = 0;//计时器ID

  onPageShow() {
    SPManager.getInstance()
    this.timeId = setInterval(() => {//开始倒计时
      if (this.countDownSeconds == 0) {
        this.jumpToAppHomePage();
      } else {
        this.countDownSeconds--;
      }
    }, 1000);
  }

  onPageHide() {
    clearInterval(this.timeId);//取消倒计时
    router.clear()
  }

  /**
   * 跳转到主页
   */
  jumpToAppHomePage() {
    router.pushUrl({
      url: "pages/login/LoginPage"
    })
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Image("https://b0.bdstatic.com/e9a304772a5f686271c290264ded884a.jpg")
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
      Text($r('app.string.advertising_text_title', this.countDownSeconds))
        .fontColor(Color.White)
        .fontSize($r('app.float.advertising_text_font_size'))
        .letterSpacing(CommonConstants.ADVERTISING_TITLE_TEXT_LETTER_SPACING)
        .backgroundColor($r('app.color.advertising_text_background_color'))
        .border({
          radius: $r('app.float.advertising_text_radius'),
          width: $r('app.float.advertising_text_border_width'),
          color: Color.White
        })
        .margin({
          top: $r('app.float.advertising_title_text_margin_top'),
          left: $r('app.float.advertising_title_text_margin_left')
        })
        .padding({
          left: $r('app.float.advertising_text_padding_left'),
          top: $r('app.float.advertising_text_padding_top'),
          right: $r('app.float.advertising_text_padding_left'),
          bottom: $r('app.float.advertising_text_padding_bottom')
        })
        .onClick(() => {
          this.jumpToAppHomePage();
        })
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
  }
}
