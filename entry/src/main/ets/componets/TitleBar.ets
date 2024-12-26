import router from '@ohos.router';

@Component
export struct TitleBar {
  isShowLeft = true
  leftClickEvent = () => {
    router.back()
  }
  title = '标题'
  @Prop isShowRight: boolean
  rightImage: ResourceStr = ''
  rightClickEvent: Function = () => {
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.back'))
          .width(55)
          .height(55)
          .padding(16)
          .enabled(this.isShowLeft)
          .visibility(this.isShowLeft ? Visibility.Visible : Visibility.Hidden)
          .onClick(this.leftClickEvent)

        Text(this.title).fontSize(18).textAlign(TextAlign.Center).layoutWeight(1)

        Image(this.rightImage)
          .width(55)
          .height(55)
          .padding(17)
          .enabled(this.isShowRight)
          .visibility(this.isShowRight ? Visibility.Visible : Visibility.Hidden)
          .onClick(() => {
            this.rightClickEvent()
          })

      }.width('100%').height(50)

      Divider().color('#e3e2e2')
    }
    .padding({ top: 35 })
    .backgroundColor(Color.White)
  }
}