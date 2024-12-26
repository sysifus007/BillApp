import relationalStore from '@ohos.data.relationalStore';
import AccountData from '../bean/AccountData';
import Rdb from '../rdb';
import { CommonTable } from './CommonTable';

export default class AccountTable {

  /**
   * Account table config.
   */
  static readonly ACCOUNT_TABLE: CommonTable = {
    tableName: 'accountTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS accountTable(id INTEGER PRIMARY KEY AUTOINCREMENT, account TEXT, ' +
      'nick TEXT, ' +
      'pwd TEXT)',
    columns: ['id', 'account', 'nick', 'pwd']
  };


  private accountTable = new Rdb(AccountTable.ACCOUNT_TABLE.tableName, AccountTable.ACCOUNT_TABLE.sqlCreate,
    AccountTable.ACCOUNT_TABLE.columns);

  constructor(callback: Function = () => {
  }) {
    this.accountTable.getRdbStore(callback);
  }

  getRdbStore(callback: Function = () => {
  }) {
    this.accountTable.getRdbStore(callback);
  }

  insertData(account: AccountData, callback: Function) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(account);
    this.accountTable.insertData(valueBucket, callback);
  }

  deleteData(account: AccountData, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(AccountTable.ACCOUNT_TABLE.tableName);
    predicates.equalTo('id', account.id);
    this.accountTable.deleteData(predicates, callback);
  }


  deleteAllData(callback: Function) {
    let predicates = new relationalStore.RdbPredicates(AccountTable.ACCOUNT_TABLE.tableName);

    this.accountTable.deleteData(predicates, callback);
  }

  updateData(account: AccountData, callback: Function) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(account);
    let predicates = new relationalStore.RdbPredicates(AccountTable.ACCOUNT_TABLE.tableName);
    predicates.equalTo('id', account.id);
    this.accountTable.updateData(predicates, valueBucket, callback);
  }

  query(name: string, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(AccountTable.ACCOUNT_TABLE.tableName);
    predicates.equalTo('account', name);
    this.accountTable.query(predicates, (resultSet: relationalStore.ResultSet) => {
      let count: number = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        callback([]);
      } else {
        resultSet.goToFirstRow();
        const result: AccountData[] = [];
        for (let i = 0; i < count; i++) {
          let tmp: AccountData = {
            id: 0,
            account: '',
            pwd: '',
            nick: ''
          };
          tmp.id = resultSet.getDouble(resultSet.getColumnIndex('id'));
          tmp.account = resultSet.getString(resultSet.getColumnIndex('account'));
          tmp.nick = resultSet.getString(resultSet.getColumnIndex('nick'));

          tmp.pwd = resultSet.getString(resultSet.getColumnIndex('pwd'));

          result[i] = tmp;
          resultSet.goToNextRow();
        }
        callback(result);
      }
    });
  }


  login(name: string, pwd: string, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(AccountTable.ACCOUNT_TABLE.tableName);

    predicates.equalTo('account', name).equalTo("pwd", pwd);

    this.accountTable.query(predicates, (resultSet: relationalStore.ResultSet) => {
      let count: number = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        callback([]);
      } else {
        resultSet.goToFirstRow();
        const result: AccountData[] = [];
        for (let i = 0; i < count; i++) {
          let tmp: AccountData = {
            id: 0,
            account: '',
            pwd: '',
            nick: ''
          };
          tmp.id = resultSet.getDouble(resultSet.getColumnIndex('id'));
          tmp.account = resultSet.getString(resultSet.getColumnIndex('account'));
          tmp.nick = resultSet.getString(resultSet.getColumnIndex('nick'));

          tmp.pwd = resultSet.getString(resultSet.getColumnIndex('pwd'));

          result[i] = tmp;
          resultSet.goToNextRow();
        }
        callback(result);
      }
    });
  }
}

function generateBucket(account: AccountData): relationalStore.ValuesBucket {
  let obj: relationalStore.ValuesBucket = {};
  obj.account = account.account;
  obj.pwd = account.pwd;
  obj.nick = account.nick;
  return obj;
}