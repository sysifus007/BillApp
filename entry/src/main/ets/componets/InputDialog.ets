@CustomDialog
export default struct InputDialog {
  @State showTitle: string = ''
  @Link title: string
  @Link money: string
  @Link desc: string
  @Link type: string
  controller: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在最后
  cancel: Function = () => {
  }
  confirm: Function = () => {
  }

  build() {
    Column() {
      Text(this.showTitle).fontSize(20).margin({ top: 10, bottom: 10 })


      Row() {

        Text("类别:").height(50)
          .margin({ right: 10 })
          .fontSize(22)

        Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
          Row() {
            Radio({ group: "type", value: "1" })
              .checked(this.type == "1")
              .onChange(res => {
                if (res) {
                  this.type = "1"
                }
              })
            Text("收入")
              .fontSize(22)
              .onClick(e => {
                this.type = "1"
              })
          }.margin({ right: 30 })

          Row() {
            Radio({ group: "type", value: "2" })
              .checked(this.type == "2")
              .onChange(res => {
                if (res) {
                  this.type = "2"
                }
              })
            Text("支出")
              .fontSize(22).onClick(e => {
              this.type = "2"
            })
          }.layoutWeight(1)
        }
      }
      .height(50)
      .margin({ top: 10 })
      .width('90%')

      Row() {

        Text("标题:").height(50)
          .margin({ right: 10 })
          .fontSize(22)
        TextInput({ placeholder: '请输入标题', text: this.title })
          .layoutWeight(1)
          .height("100%")
          .onChange((value: string) => {
            this.title = value
          })
      }
      .height(50)
      .margin({ top: 10 })
      .width('90%')


      Row() {

        Text("金额:").height(50)
          .margin({ right: 10 })
          .fontSize(22)
        TextInput({ placeholder: '请输入金额', text: this.money })
          .layoutWeight(1)
          .height("100%")
          .type(InputType.Number)
          .onChange((value: string) => {
            this.money = value
          })
      }
      .height(50)
      .margin({ top: 10 })
      .width('90%')


      Row() {

        Text("备注:").height(50)
          .margin({ right: 10 })
          .fontSize(22)
        TextInput({ placeholder: '请输入备注信息', text: this.desc })
          .layoutWeight(1)
          .height("100%")
          .onChange((value: string) => {
            this.desc = value
          })
      }
      .height(50)
      .margin({ top: 10 })
      .width('90%')


      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button("取消")
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button("确定")
          .onClick(() => {
            this.controller.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10, top: 20 })
    }

    // dialog默认的borderRadius为24vp，如果需要使用border属性，请和borderRadius属性一起使用。
  }
}

