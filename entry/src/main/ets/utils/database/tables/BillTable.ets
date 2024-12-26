import relationalStore from '@ohos.data.relationalStore';
import BillInfo from '../bean/BillInfo';
import Book from '../bean/BillInfo';
import Rdb from '../rdb';
import { CommonTable } from './CommonTable';

export default class BillTable {
  /**
   * 建表语句
   */
  ACCOUNT_TABLE: CommonTable = {
    tableName: 'billTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS billTable(id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'uid INTEGER, ' +
      'title TEXT, ' +
      'money TEXT, ' +
      'desc TEXT, ' +
      'type INTEGER, ' +
      'time TEXT)',
    columns: ['id', 'uid', 'title', 'money', "desc", "type", "time"]
  };
  private accountTable = new Rdb(this.ACCOUNT_TABLE.tableName, this.ACCOUNT_TABLE.sqlCreate,
    this.ACCOUNT_TABLE.columns);

  constructor(callback: Function = () => {
  }) {
    this.accountTable.getRdbStore(callback);
  }

  getRdbStore(callback: Function = () => {
  }) {
    this.accountTable.getRdbStore(callback);
  }

  insertData(account: Book, callback: Function) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(account);
    this.accountTable.insertData(valueBucket, callback);
  }

  deleteData(account: Book, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(this.ACCOUNT_TABLE.tableName);
    predicates.equalTo('id', account.id);
    this.accountTable.deleteData(predicates, callback);
  }


  deleteAllData(callback: Function) {
    let predicates = new relationalStore.RdbPredicates(this.ACCOUNT_TABLE.tableName);

    this.accountTable.deleteData(predicates, callback);
  }

  updateData(account: Book, callback: Function) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(account);
    let predicates = new relationalStore.RdbPredicates(this.ACCOUNT_TABLE.tableName);
    predicates.equalTo("id", account.id);
    this.accountTable.updateData(predicates, valueBucket, callback);
  }

  query(uid: number, callback: Function, isAll: boolean = true) {
    let predicates = new relationalStore.RdbPredicates(this.ACCOUNT_TABLE.tableName);
    predicates.equalTo('uid', uid);
    predicates.orderByDesc("time")
    this.accountTable.query(predicates, (resultSet: relationalStore.ResultSet) => {
      let count: number = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        callback([]);
      } else {
        resultSet.goToFirstRow();
        const result: Book[] = [];
        for (let i = 0; i < count; i++) {
          let tmp: Book = {} as BillInfo;

          // columns: ['id', 'uid', 'title', 'money',"desc","type","time"]
          tmp.id = resultSet.getDouble(resultSet.getColumnIndex('id'));
          tmp.uid = resultSet.getLong(resultSet.getColumnIndex('uid'));
          tmp.title = resultSet.getString(resultSet.getColumnIndex('title'));
          tmp.money = resultSet.getString(resultSet.getColumnIndex('money'));
          tmp.desc = resultSet.getString(resultSet.getColumnIndex('desc'));
          tmp.type = resultSet.getLong(resultSet.getColumnIndex('type'));
          tmp.time = resultSet.getString(resultSet.getColumnIndex('time'));

          result[i] = tmp;
          resultSet.goToNextRow();
        }
        callback(result);
      }
    });
  }
}

function generateBucket(account: Book): relationalStore.ValuesBucket {
  let obj: relationalStore.ValuesBucket = {};

  if (account.id) {
    obj.id = account.id;
  }
  obj.uid = account.uid;
  obj.title = account.title;
  obj.money = account.money;
  obj.desc = account.desc;
  obj.type = account.type;
  obj.time = account.time;

  // columns: ['id', 'uid', 'title', 'money',"desc","type","time"]
  //
  return obj;
}