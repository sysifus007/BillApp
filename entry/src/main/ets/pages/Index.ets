import HintDialog from '../componets/HintDialog';
import InputDialog from '../componets/InputDialog';
import { TitleBar } from '../componets/TitleBar';
import { Toast } from '../componets/Toast';
import BillInfo from '../utils/database/bean/BillInfo';
import BillTable from '../utils/database/tables/BillTable';
import { SPManager } from '../utils/SPManager';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State bookList: BillInfo[] = [] //图书列表
  private billTable = new BillTable(() => { //数据库操作
  });
  private isAdd: boolean = true; //添加或修改
  @State title: string = '' //标题
  @State money: string = '' //金额
  @State desc: string = '' //描述信息
  @State type: string = "1" //收支类型 1：收入  2：支出
  private index: number = -1; //当前操作的列表索引

  //可以编写自定义函数来格式化日期时间。例如：
  formatDateTime(date: Date = new Date) {
    const day = date.getDate().toString().padStart(2, '0');
    const month = (date.getMonth() + 1).toString().padStart(2, '0'); // 月份是从0开始的
    const year = date.getFullYear();
    const hours = date.getHours().toString().padStart(2, '0');
    const minutes = date.getMinutes().toString().padStart(2, '0');
    const seconds = date.getSeconds().toString().padStart(2, '0');

    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  }

  // 自定义提示框
  dialogController: CustomDialogController = new CustomDialogController({
    builder: InputDialog({
      money: this.money,
      desc: this.desc,
      type: this.type,
      showTitle: this.isAdd ? '添加账单' : '修改账单',
      title: this.title,
      confirm: async () => {
        Toast.showToast(this.title + "   " + this.money + "  " + this.desc)

        let uid = parseInt(await SPManager.getInstance().get("uid", ""))
        if (this.isAdd) {
          //插入数据
          this.billTable.insertData({
            id: 0,
            uid: uid,
            title: this.title,
            money: this.money,
            desc: this.desc,
            type: parseInt(this.type),
            time: this.formatDateTime()
          }, (res: object) => {
            console.error(">>>>>>>>>>res>>>>>>>>>>>>>>" + res)
            this.title = ''
            this.money = ''
            this.desc = ''
            this.loadData()
          })
        } else {
          //更新数据
          this.billTable.updateData({
            id: this.bookList[this.index].id,
            uid: uid,
            title: this.title,
            money: this.money,
            desc: this.desc,
            type: parseInt(this.type),
            time: this.formatDateTime()
          }, () => {
            this.title = ''
            this.money = ''
            this.desc = ''
            this.loadData()
          })
        }
      },
      cancel: () => {

      }
    }),
  })

  onPageShow(): void {
    this.loadData()
  }

  //加载数据
  async loadData() {
    let uid = parseInt(await SPManager.getInstance().get("uid", ""))

    this.billTable.getRdbStore(() => {
      this.billTable.query(uid, (result: BillInfo[]) => {
        this.bookList = result;
      });
    });
  }

  // 自定义提示框 - 删除提示
  private deleteDialogController: CustomDialogController = new CustomDialogController({
    builder: HintDialog({
      title: '温馨提示',
      content: '是否要删除本条数据？',
      confirm: () => {

        let item = this.bookList[this.index]
        this.billTable.deleteData(item, () => {
          this.loadData()
          Toast.showToast("删除成功")
        })
      }
    }),
  })

  // 列表项显示
  @Builder
  GoodsItem(item: BillInfo, index: number) {
    Row() {

      Column() {
        Text(item.title).fontSize(18).fontColor('#000')

        Row() {
          Text("金额：")
            .fontSize(14)
            .fontColor('#ff6a6a6a')
            .borderRadius(5)
            .padding({
              right: 5,
              top: 2,
              bottom: 2
            })

          Text((item.type == 1 ? "+" : "-") + item.money)
            .fontSize(16)
            .fontColor(item.type == 1 ? Color.Green : Color.Red)
            .borderRadius(5)
            .padding({
              right: 5,
              top: 2,
              bottom: 2
            })

        }
        .margin({ top: 8 })


        Text("备注:" + item.desc).fontSize(14).fontColor('#777')
          .margin({ top: 8 })

        Blank()
        Row() {
          Blank()
          Row() {
            Text("删除")
              .padding(4)
              .border({ width: 1, color: '#a1a1a1', radius: 3 })
              .onClick(e => {
                this.index = index
                this.deleteDialogController.open()
              })

            Text("修改").margin({ left: 10 })
              .padding(4)
              .border({ width: 1, color: '#a1a1a1', radius: 3 })
              .onClick(e => {
                this.isAdd = false;
                this.index = index
                this.title = item.title
                this.money = item.money
                this.type = item.type + ""
                this.desc = item.desc
                this.dialogController.open()
              })

          }.margin({ bottom: 2 })
        }.width('100%').margin({ top: 5 }).alignItems(VerticalAlign.Bottom)
      }
      .layoutWeight(1)
      .padding({
        top: 15,
        bottom: 10,
        right: 10,
        left: 10
      })
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }.width('95%').backgroundColor(Color.White)
    .margin({ left: "2.5%", top: 3 })
    .borderRadius(8)
  }

  build() {

    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        //标题
        TitleBar({
          title: '财务收支',
          isShowLeft: false,
          isShowRight: true,
          rightImage: $r('app.media.icon_tongji'),
          rightClickEvent: () => {
            router.pushUrl({
              url: "pages/ChartPage"
            })


          }
        })
        if (this.bookList.length > 0) { //有数据显示的内容
          List({ space: 2 }) {
            ForEach(this.bookList, (item: BillInfo, index) => {
              ListItem() {
                this.GoodsItem(item, index)
              }
            }, (item: BillInfo) => JSON.stringify(item))
          }.layoutWeight(1)
          .margin({ top: 5 })

        } else { //没有数据时显示的内容
          Column() {
            Image($r("app.media.empty"))
              .width(100)
              .margin({ bottom: 20 })
            Text('空空如也~').letterSpacing(2).fontSize(18)
              .fontColor('#ff2c2c2c')
          }.layoutWeight(1).width('100%')
          .justifyContent(FlexAlign.Center)
        }
      }
      .height('100%')
      .width('100%')


      //添加
      Text("+")
        .textAlign(TextAlign.Center)
        .width(50)
        .height(50)
        .margin(30)
        .fontSize(38)
        .fontColor(Color.White)
        .borderRadius(200)
        .backgroundColor("#77f")
        .onClick(e => {
          this.isAdd = true;
          this.dialogController.open()
        })


    }.height('100%')
    .width('100%')
    .backgroundImage("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202005%2F06%2F20200506101308_rxxlu.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1731589950&t=a6107d056b47b435ec9c16523f401644")
    .backgroundImageSize({ width: "100%", height: "100%" })

  }
}