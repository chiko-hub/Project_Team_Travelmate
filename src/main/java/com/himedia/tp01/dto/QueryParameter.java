package com.himedia.tp01.dto;

public class QueryParameter {
    private String tableName;
    private String columnName;
    private String key;

    public QueryParameter(String tableName, String columnName, String key) {
        this.tableName = tableName;
        this.columnName = columnName;
        this.key = key;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
