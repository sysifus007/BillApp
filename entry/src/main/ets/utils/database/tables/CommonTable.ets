export interface CommonTable {
  tableName: string; //表名
  sqlCreate: string;//建表语句
  columns: string[];//字段数组
}