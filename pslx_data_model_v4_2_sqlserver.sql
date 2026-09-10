--------------------------------------------------------------------------
-- PSLXスキーマ 4.2  SQL Server (T-SQL) 用 DDL
-- 変換元: 汎用SQL(DBML由来, MSSQLエクスポート)
-- 変換ルール:
--   nvarchar(255)           -> NVARCHAR(n)  (id/*_id列は36, description等の長文列は1000, その他は100)
--   decimal (精度未指定)     -> DECIMAL(18,4)
--   datetime                -> DATETIME2
--   外部キー制約に CONSTRAINT 名を明示付与(FK_テーブル名_カラム名)
--   テーブル/カラムのコメントは sp_addextendedproperty (MS_Description) で付与
--     ※ Oracle版の COMMENT ON 定義から日本語説明を移植
--   対象: SQL Server 2016 以降 (DATETIME2 / NVARCHAR(MAX)非使用のため下位互換あり)
--------------------------------------------------------------------------

CREATE TABLE [enterprise] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [area] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [site] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [enterprise_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_line] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [area_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [calendar] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [term] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [calendar_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_plan] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [production_item_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [capacity_plan] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_plan] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [production_item_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_plan] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [production_item_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [asset] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [asset_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [asset_group] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [asset_structure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [parent_asset_group_id] NVARCHAR(36),
  [child_asset_group_id] NVARCHAR(36),
  [parent_asset_id] NVARCHAR(36),
  [child_asset_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [asset_specification] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [asset_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [monitoring_content] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [asset_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [monitoring_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [monitoring_content_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [asset_id] NVARCHAR(36),
  [production_item_group_id] NVARCHAR(36),
  [production_process_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_group] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_structure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [parent_production_item_group_id] NVARCHAR(36),
  [child_production_item_group_id] NVARCHAR(36),
  [parent_production_item_id] NVARCHAR(36),
  [child_production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_function] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_specification] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_portion] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_document] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [file_link] NVARCHAR(1000),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_issue] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [production_item_group_id] NVARCHAR(36),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [issue_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_countermeasure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_issue_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_item_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [production_schedule_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_process] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_operation] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_process_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [work_hours] DECIMAL(18,4),
  [work_days] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_content] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_operation_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_assignment] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_operation_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_capacity] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [term_id] NVARCHAR(36),
  [production_item_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [maximum_value] DECIMAL(18,4),
  [minimum_value] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_order] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_process_id] NVARCHAR(36),
  [production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [due_at] DATETIME2,
  [release_at] DATETIME2,
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_schedule] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_order_id] NVARCHAR(36),
  [production_operation_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [production_line_id] NVARCHAR(36),
  [production_item_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_performance] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [term_id] NVARCHAR(36),
  [production_process_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [time] DECIMAL(18,4),
  [time_unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_schedule_id] NVARCHAR(36),
  [production_content_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_document] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_id] NVARCHAR(36),
  [production_process_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [file_link] NVARCHAR(1000),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_issue] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_process_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [issue_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [production_countermeasure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_issue_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_line_id] NVARCHAR(36),
  [asset_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [energy_node_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_group] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [asset_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_structure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [parent_equipment_group_id] NVARCHAR(36),
  [child_equipment_group_id] NVARCHAR(36),
  [parent_equipment_id] NVARCHAR(36),
  [child_equipment_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_function] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_specification] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_portion] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_document] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [file_link] NVARCHAR(1000),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_issue] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [issue_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_countermeasure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_issue_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_process] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [specification] NVARCHAR(1000),
  [equipment_group_id] NVARCHAR(36),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_operation] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_process_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [work_hours] DECIMAL(18,4),
  [work_days] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_content] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_operation_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_assignment] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_operation_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_capacity] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [term_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [maximum_value] DECIMAL(18,4),
  [minimum_value] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_order] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_process_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [due_at] DATETIME2,
  [release_at] DATETIME2,
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_schedule] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_operation_id] NVARCHAR(36),
  [equipment_order_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_performance] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [term_id] NVARCHAR(36),
  [equipment_process_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [time] DECIMAL(18,4),
  [time_unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [equipment_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [equipment_content_id] NVARCHAR(36),
  [equipment_schedule_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_line_id] NVARCHAR(36),
  [asset_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_group] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [asset_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_structure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_group_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_skill] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_specification] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_portion] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_document] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [file_link] NVARCHAR(1000),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_issue] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [issue_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [personnel_countermeasure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_issue_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [note] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_process] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [personnel_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_operation] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [work_process_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [work_hours] DECIMAL(18,4),
  [work_days] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_content] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [work_operation_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_assignment] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [work_operation_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_capacity] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [maximum_value] DECIMAL(18,4),
  [minimum_value] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_order] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [work_process_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [due_at] DATETIME2,
  [release_at] DATETIME2,
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_schedule] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [work_order_id] NVARCHAR(36),
  [work_operation_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [personnel_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_performance] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [work_process_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [time] DECIMAL(18,4),
  [time_unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [work_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [work_schedule_id] NVARCHAR(36),
  [work_content_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [inventory_item] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [production_line_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [lead_time] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [inventory_capacity] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [production_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [maximum_value] DECIMAL(18,4),
  [minimum_value] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [inventory_order] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [production_order_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [due_at] DATETIME2,
  [release_at] DATETIME2,
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [inventory_schedule] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [inventory_transfer_id] NVARCHAR(36),
  [inventory_order_id] NVARCHAR(36),
  [from_inventory_item_id] NVARCHAR(36),
  [to_inventory_item_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [inventory_transfer] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [inventory_item_id] NVARCHAR(36),
  [equipment_group_id] NVARCHAR(36),
  [personnel_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [time] DECIMAL(18,4),
  [time_unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [inventory_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [inventory_item_id] NVARCHAR(36),
  [inventory_schedule_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_group] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_structure] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_function] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_specification] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_node] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_capacity] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [site_id] NVARCHAR(36),
  [term_id] NVARCHAR(36),
  [energy_group_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [maximum_value] DECIMAL(18,4),
  [minimum_value] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_order] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_node_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [due_at] DATETIME2,
  [release_at] DATETIME2,
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_schedule] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_order_id] NVARCHAR(36),
  [index_no] DECIMAL(18,4),
  [specification] NVARCHAR(1000),
  [planned_value] DECIMAL(18,4),
  [actual_value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_performance] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_node_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [time] DECIMAL(18,4),
  [time_unit] NVARCHAR(100),
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [energy_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [energy_schedule_id] NVARCHAR(36),
  [equipment_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [customer] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_item] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [customer_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [lead_time] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_document] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [customer_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [due_at] DATETIME2,
  [order_at] DATETIME2,
  [receiving_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_order] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [sales_document_id] NVARCHAR(36),
  [sales_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [due_at] DATETIME2,
  [release_at] DATETIME2,
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_specification] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [sales_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_invoice] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [customer_id] NVARCHAR(36),
  [shipping_result_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [invoice_at] DATETIME2,
  [payment_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_forecast] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [sales_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [forecast_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [sales_quotation] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [customer_id] NVARCHAR(36),
  [sales_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [due_at] DATETIME2,
  [quotation_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [shipping_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [sales_order_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [supplier] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_item] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [production_item_id] NVARCHAR(36),
  [supplier_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [lead_time] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_document] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [supplier_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [due_at] DATETIME2,
  [order_at] DATETIME2,
  [receiving_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_order] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [purchase_document_id] NVARCHAR(36),
  [purchase_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [due_at] DATETIME2,
  [release_at] DATETIME2,
  [start_at] DATETIME2,
  [end_at] DATETIME2,
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_specification] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [purchase_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_invoice] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [supplier_id] NVARCHAR(36),
  [receiving_result_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [invoice_at] DATETIME2,
  [payment_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_forecast] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [purchase_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [forecast_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [purchase_quotation] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [supplier_id] NVARCHAR(36),
  [purchase_item_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [unit_price] DECIMAL(18,4),
  [price] DECIMAL(18,4),
  [due_at] DATETIME2,
  [quotation_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

CREATE TABLE [receiving_result] (
  [id] NVARCHAR(36) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(100),
  [category] NVARCHAR(100),
  [status] NVARCHAR(100),
  [description] NVARCHAR(1000),
  [purchase_order_id] NVARCHAR(36),
  [specification] NVARCHAR(1000),
  [value] DECIMAL(18,4),
  [unit] NVARCHAR(100),
  [location] NVARCHAR(100),
  [result_at] DATETIME2,
  [created_at] DATETIME2,
  [updated_at] DATETIME2,
  [created_by] NVARCHAR(100),
  [approved_by] NVARCHAR(100),
  [remark] NVARCHAR(1000)
);
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '事業者: 自社および取引先となる企業を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'enterprise',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エリア: サイト内の区画、フロア、または管理単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'area',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'サイト: 生産活動を行う工場や拠点を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '事業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'enterprise_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'site',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産ライン: 生産工程を実行するラインまたは設備群を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エリアID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'area_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_line',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'カレンダ: 稼働日、休日、シフトなどの操業条件を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'calendar',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'ターム: カレンダを構成する時間区間を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'カレンダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'calendar_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'term',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産計画: 生産数量や期間に関する計画を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '計画数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_plan',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '能力計画: 生産能力の確保や配分計画を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '計画数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'capacity_plan',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '販売計画: 期間ごとの販売目標計画を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '計画数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_plan',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '購買計画: 期間ごとの調達目標計画を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '計画数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_plan',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'アセット: 生産活動に関わる資産の共通情報を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットグループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'asset_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'アセットグループ: 共通属性をもつアセットの分類単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_group',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'アセット構成: アセット間の構成関係や階層構造を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '親アセットグループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'parent_asset_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '子アセットグループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'child_asset_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '親アセットID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'parent_asset_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '子アセットID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'child_asset_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_structure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'アセット仕様: アセットに求められる仕様や性能条件を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'asset_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'asset_specification',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '監視内容: 設備や工程で監視する対象項目を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'asset_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_content',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '監視結果: 監視項目に対する実測値や状態結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '監視内容ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'monitoring_content_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'monitoring_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産品目: 生産対象となる製品、部品、材料を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'asset_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'production_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目グループ: 共通特性をもつ生産品目の分類単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_group',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目構成: 生産品目の部品表や構成関係を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '親品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'parent_production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '子品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'child_production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '親生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'parent_production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '子生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'child_production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_structure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目機能: 生産品目が提供する機能や役割を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_function',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目仕様: 生産品目の仕様、品質条件、性能条件を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_specification',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目部位: 生産品目を構成する識別可能な部位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_portion',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目図書: 生産品目に関連する図面や仕様書を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ファイル',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'file_link';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_document',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目事象: 生産品目に関連する不具合や課題を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '事象日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'issue_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_issue',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目対策: 品目事象に対する対策内容を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目事象ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'production_item_issue_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_countermeasure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '品目結果: 生産品目を生産して得られた実体を示す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産指示ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'production_schedule_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_item_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産工程: 技術的に定義された生産工程を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_process',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産手順: 生産工程を具体化した作業手順を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'production_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'work_hours';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産日数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'work_days';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_operation',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産内容: 生産手順を構成する詳細な作業項目を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'production_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_content',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産割当: 生産指示に対するリソース割当を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'production_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_assignment',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産能力: 生産ラインや工程の能力情報を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '品目グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'production_item_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最大値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'maximum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最小値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'minimum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_capacity',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産オーダ: 生産を要求する指示単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'production_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発行日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'release_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_order',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産指示: 生産オーダに基づく実行指示を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'production_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'production_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産ラインID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'production_line_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '予定数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_schedule',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産実績: 実際の生産量や稼働実績を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'production_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'time_unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_performance',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産結果: 生産指示の結果として得られた実行結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産指示ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'production_schedule_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産項目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'production_content_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産図書: 生産工程に関連する技術文書を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'production_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ファイル',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'file_link';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_document',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産事象: 生産活動で発生した問題や異常を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産プロセスID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'production_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '事象日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'issue_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_issue',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '生産対策: 生産事象に対する改善や対策を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産事象ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'production_issue_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'production_countermeasure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備: 生産作業を実行する機械や装置を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産ラインID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'production_line_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'asset_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギ接点ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'energy_node_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備グループ: 共通機能をもつ設備の分類単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットグループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'asset_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_group',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備構成: 設備の親子関係や構成情報を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '親設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'parent_equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '子設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'child_equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '親設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'parent_equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '子設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'child_equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_structure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備機能: 設備がもつ機能や役割を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_function',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備仕様: 設備に求められる性能や仕様条件を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_specification',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備部位: 設備を構成する識別可能な部位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_portion',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備図書: 設備に関連する図面やマニュアルを表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ファイル',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'file_link';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_document',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備事象: 設備に発生した故障や異常を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '事象日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'issue_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_issue',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備対策: 設備事象に対する対策内容を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備事象ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'equipment_issue_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_countermeasure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備工程: 設備に関する保全や稼働の工程を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_process',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備手順: 設備工程を実行する具体的な手順を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'equipment_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'work_hours';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産日数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'work_days';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_operation',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備内容: 設備手順を構成する詳細な作業項目を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'equipment_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_content',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備割当: 生産手順に対する設備割当を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'equipment_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_assignment',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備能力: 設備がもつ処理能力や性能を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最大値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'maximum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最小値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'minimum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_capacity',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備オーダ: 設備に対する作業要求を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'equipment_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発行日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'release_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_order',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備指示: 設備オーダに基づく実行指示を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'equipment_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'equipment_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '予定数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_schedule',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備実績: 設備の稼働実績や運転結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'equipment_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'time_unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_performance',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '設備結果: 設備作業の結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備項目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'equipment_content_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備指示ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'equipment_schedule_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'equipment_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者: 生産活動に従事する作業者を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産ラインID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'production_line_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'asset_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者グループ: 共通役割をもつ作業者のグループを表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'アセットグループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'asset_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_group',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者構成: 作業者間の階層や代替関係を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_structure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者スキル: 作業者が保有する技能や資格を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_skill',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者仕様: 作業者に求められる資格や条件を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_specification',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者部位: 作業者の身体的または機能的な部位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_portion',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者図書: 作業者に関連する教育資料や記録を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ファイル',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'file_link';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_document',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者事象: 作業者に関連する問題や事故を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '事象日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'issue_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_issue',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業者対策: 作業者事象に対する改善や対策を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者事象ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'personnel_issue_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '摘要',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'note';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'personnel_countermeasure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業工程: 人作業として定義された工程を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_process',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業手順: 作業工程を実行する具体的な手順を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'work_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産工数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'work_hours';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産日数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'work_days';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_operation',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業内容: 作業手順を構成する詳細な作業項目を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'work_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_content',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業割当: 作業指示に対するリソース割当を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'work_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_assignment',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業能力: 作業者または作業班の能力を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最大値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'maximum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最小値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'minimum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_capacity',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業オーダ: 作業者に対する作業要求を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業工程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'work_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発行日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'release_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_order',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業指示: 作業オーダに基づく実行指示を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'work_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業手順ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'work_operation_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'personnel_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '予定数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_schedule',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業実績: 作業者または作業班の実績を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'work_process_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'time_unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_performance',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '作業結果: 作業の実行結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業指示ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'work_schedule_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業項目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'work_content_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'work_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '在庫品目: 在庫場所ごとの管理品目を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産ラインID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'production_line_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '日数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'lead_time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_item',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '在庫能力: 在庫場所の保管能力を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最大値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'maximum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最小値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'minimum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_capacity',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '在庫オーダ: 在庫品目の移動・補充オーダを表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'production_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発行日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'release_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_order',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '在庫指示: 在庫品目の移動・補充指示を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '在庫移動ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'inventory_transfer_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '在庫オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'inventory_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '移動元在庫品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'from_inventory_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '移動先在庫品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'to_inventory_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '予定数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_schedule',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '在庫移動: 在庫品目の数量増減結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '在庫品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'inventory_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'equipment_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作業者グループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'personnel_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'time_unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_transfer',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '在庫数量: ある時点における在庫数量を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '在庫品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'inventory_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '在庫指示ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'inventory_schedule_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'inventory_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ: 生産活動に必要なエネルギを表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギグループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'energy_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギグループ: エネルギ源の分類単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_group',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ構成: エネルギ供給の構成関係を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'energy_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_structure',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ機能: エネルギがもつ機能を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'energy_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_function',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ仕様: エネルギに求められる仕様条件を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'energy_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_specification',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ接点: エネルギの供給・消費の接続点を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'energy_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_node',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ能力: 共有可能なエネルギ供給能力を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'サイトID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'site_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'タームID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'term_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギグループID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'energy_group_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最大値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'maximum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '最小値',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'minimum_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_capacity',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギオーダ: エネルギの供給・消費オーダを表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギ接点ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'energy_node_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発行日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'release_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_order',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ指示: エネルギの供給・消費指示を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギオーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'energy_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '追番',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'index_no';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '予定数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'planned_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '実績数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'actual_value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_schedule',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ実績: エネルギの供給・消費実績を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギ接点ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'energy_node_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '時間単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'time_unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '開始日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '終了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_performance',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'エネルギ結果: エネルギ接点ごとの記録結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'エネルギ指示ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'energy_schedule_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '設備ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'equipment_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'energy_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '得意先: 販売品目を提供する相手の事業者を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'customer',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '販売品目: 得意先に提供される生産品目を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '得意先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'customer_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '日数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'lead_time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_item',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '受注伝票: 得意先からの注文の管理単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '得意先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'customer_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発注日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'order_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '入荷日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'receiving_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_document',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '受注明細: 販売品目ごとの受注内容を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '販売伝票ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'sales_document_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '販売品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'sales_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発行日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'release_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_order',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '販売仕様: 得意先ごとの販売条件・仕様を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '販売品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'sales_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_specification',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '販売請求: 得意先に発行する請求情報を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '得意先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'customer_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '出荷実績ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'shipping_result_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '請求日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'invoice_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '支払日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'payment_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_invoice',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '受注内示: 得意先からの需要予測情報を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '販売品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'sales_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '内示日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'forecast_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_forecast',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '販売見積: 得意先への見積依頼と回答を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '得意先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'customer_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '販売品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'sales_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '見積日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'quotation_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'sales_quotation',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '出荷明細: 販売品目の出荷結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '販売オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'sales_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'shipping_result',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '仕入先: 資材・部品を調達する相手の事業者を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'supplier',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '購買品目: 仕入先から提供される生産品目を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '生産品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'production_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕入先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'supplier_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '日数',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'lead_time';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_item',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '購買伝票: 仕入先への注文の管理単位を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕入先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'supplier_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発注日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'order_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '入荷日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'receiving_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_document',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '購買明細: 仕入先への個々の注文内容を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '購買伝票ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'purchase_document_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '購買品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'purchase_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '発行日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'release_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '着手日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'start_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '完了日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'end_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_order',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '購買仕様: 仕入先ごとの購買条件・仕様を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '購買品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'purchase_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_specification',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '購買請求: 仕入先から受け取る請求情報を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕入先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'supplier_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '入荷実績ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'receiving_result_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '請求日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'invoice_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '支払日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'payment_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_invoice',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '仕入内示: 仕入先への仕入予測通知を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '購買品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'purchase_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '内示日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'forecast_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_forecast',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '購買見積: 仕入先への見積依頼と回答を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕入先ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'supplier_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '購買品目ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'purchase_item_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単価',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'unit_price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '金額',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'price';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '納期',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'due_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '見積日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'quotation_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'purchase_quotation',
@level2type = N'Column', @level2name = 'remark';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = '入荷明細: 購買品目の入荷結果を表す。',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '名称',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '分類',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '状態',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '説明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '購買オーダID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'purchase_order_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '仕様',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'specification';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '数量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'value';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '単位',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'unit';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '場所',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'location';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '結果日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'result_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '登録日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '更新日時',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'updated_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '作成者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '承認者',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'approved_by';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '備考',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'receiving_result',
@level2type = N'Column', @level2name = 'remark';
GO


ALTER TABLE [area] ADD CONSTRAINT [FK_area_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [site] ADD CONSTRAINT [FK_site_enterprise_id] FOREIGN KEY ([enterprise_id]) REFERENCES [enterprise] ([id]);
GO

ALTER TABLE [production_line] ADD CONSTRAINT [FK_production_line_area_id] FOREIGN KEY ([area_id]) REFERENCES [area] ([id]);
GO

ALTER TABLE [calendar] ADD CONSTRAINT [FK_calendar_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [term] ADD CONSTRAINT [FK_term_calendar_id] FOREIGN KEY ([calendar_id]) REFERENCES [calendar] ([id]);
GO

ALTER TABLE [production_plan] ADD CONSTRAINT [FK_production_plan_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [production_plan] ADD CONSTRAINT [FK_production_plan_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [production_plan] ADD CONSTRAINT [FK_production_plan_production_item_group_id] FOREIGN KEY ([production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [capacity_plan] ADD CONSTRAINT [FK_capacity_plan_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [capacity_plan] ADD CONSTRAINT [FK_capacity_plan_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [capacity_plan] ADD CONSTRAINT [FK_capacity_plan_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [capacity_plan] ADD CONSTRAINT [FK_capacity_plan_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [sales_plan] ADD CONSTRAINT [FK_sales_plan_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [sales_plan] ADD CONSTRAINT [FK_sales_plan_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [sales_plan] ADD CONSTRAINT [FK_sales_plan_production_item_group_id] FOREIGN KEY ([production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [purchase_plan] ADD CONSTRAINT [FK_purchase_plan_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [purchase_plan] ADD CONSTRAINT [FK_purchase_plan_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [purchase_plan] ADD CONSTRAINT [FK_purchase_plan_production_item_group_id] FOREIGN KEY ([production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [asset] ADD CONSTRAINT [FK_asset_asset_group_id] FOREIGN KEY ([asset_group_id]) REFERENCES [asset_group] ([id]);
GO

ALTER TABLE [asset_structure] ADD CONSTRAINT [FK_asset_structure_parent_asset_group_id] FOREIGN KEY ([parent_asset_group_id]) REFERENCES [asset_group] ([id]);
GO

ALTER TABLE [asset_structure] ADD CONSTRAINT [FK_asset_structure_child_asset_group_id] FOREIGN KEY ([child_asset_group_id]) REFERENCES [asset_group] ([id]);
GO

ALTER TABLE [asset_structure] ADD CONSTRAINT [FK_asset_structure_parent_asset_id] FOREIGN KEY ([parent_asset_id]) REFERENCES [asset] ([id]);
GO

ALTER TABLE [asset_structure] ADD CONSTRAINT [FK_asset_structure_child_asset_id] FOREIGN KEY ([child_asset_id]) REFERENCES [asset] ([id]);
GO

ALTER TABLE [asset_specification] ADD CONSTRAINT [FK_asset_specification_asset_id] FOREIGN KEY ([asset_id]) REFERENCES [asset] ([id]);
GO

ALTER TABLE [monitoring_content] ADD CONSTRAINT [FK_monitoring_content_asset_id] FOREIGN KEY ([asset_id]) REFERENCES [asset] ([id]);
GO

ALTER TABLE [monitoring_result] ADD CONSTRAINT [FK_monitoring_result_monitoring_content_id] FOREIGN KEY ([monitoring_content_id]) REFERENCES [monitoring_content] ([id]);
GO

ALTER TABLE [monitoring_result] ADD CONSTRAINT [FK_monitoring_result_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [production_item] ADD CONSTRAINT [FK_production_item_asset_id] FOREIGN KEY ([asset_id]) REFERENCES [asset] ([id]);
GO

ALTER TABLE [production_item] ADD CONSTRAINT [FK_production_item_production_item_group_id] FOREIGN KEY ([production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [production_item] ADD CONSTRAINT [FK_production_item_production_process_id] FOREIGN KEY ([production_process_id]) REFERENCES [production_process] ([id]);
GO

ALTER TABLE [production_item_structure] ADD CONSTRAINT [FK_production_item_structure_parent_production_item_group_id] FOREIGN KEY ([parent_production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [production_item_structure] ADD CONSTRAINT [FK_production_item_structure_child_production_item_group_id] FOREIGN KEY ([child_production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [production_item_structure] ADD CONSTRAINT [FK_production_item_structure_parent_production_item_id] FOREIGN KEY ([parent_production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_structure] ADD CONSTRAINT [FK_production_item_structure_child_production_item_id] FOREIGN KEY ([child_production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_function] ADD CONSTRAINT [FK_production_item_function_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_specification] ADD CONSTRAINT [FK_production_item_specification_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_portion] ADD CONSTRAINT [FK_production_item_portion_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_document] ADD CONSTRAINT [FK_production_item_document_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_issue] ADD CONSTRAINT [FK_production_item_issue_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_issue] ADD CONSTRAINT [FK_production_item_issue_production_item_group_id] FOREIGN KEY ([production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [production_item_countermeasure] ADD CONSTRAINT [FK_production_item_countermeasure_production_item_issue_id] FOREIGN KEY ([production_item_issue_id]) REFERENCES [production_item_issue] ([id]);
GO

ALTER TABLE [production_item_result] ADD CONSTRAINT [FK_production_item_result_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_item_result] ADD CONSTRAINT [FK_production_item_result_production_schedule_id] FOREIGN KEY ([production_schedule_id]) REFERENCES [production_schedule] ([id]);
GO

ALTER TABLE [production_process] ADD CONSTRAINT [FK_production_process_production_item_group_id] FOREIGN KEY ([production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [production_operation] ADD CONSTRAINT [FK_production_operation_production_process_id] FOREIGN KEY ([production_process_id]) REFERENCES [production_process] ([id]);
GO

ALTER TABLE [production_operation] ADD CONSTRAINT [FK_production_operation_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [production_operation] ADD CONSTRAINT [FK_production_operation_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [production_content] ADD CONSTRAINT [FK_production_content_production_operation_id] FOREIGN KEY ([production_operation_id]) REFERENCES [production_operation] ([id]);
GO

ALTER TABLE [production_assignment] ADD CONSTRAINT [FK_production_assignment_production_operation_id] FOREIGN KEY ([production_operation_id]) REFERENCES [production_operation] ([id]);
GO

ALTER TABLE [production_assignment] ADD CONSTRAINT [FK_production_assignment_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [production_assignment] ADD CONSTRAINT [FK_production_assignment_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [production_capacity] ADD CONSTRAINT [FK_production_capacity_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [production_capacity] ADD CONSTRAINT [FK_production_capacity_production_item_group_id] FOREIGN KEY ([production_item_group_id]) REFERENCES [production_item_group] ([id]);
GO

ALTER TABLE [production_order] ADD CONSTRAINT [FK_production_order_production_process_id] FOREIGN KEY ([production_process_id]) REFERENCES [production_process] ([id]);
GO

ALTER TABLE [production_order] ADD CONSTRAINT [FK_production_order_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_schedule] ADD CONSTRAINT [FK_production_schedule_production_order_id] FOREIGN KEY ([production_order_id]) REFERENCES [production_order] ([id]);
GO

ALTER TABLE [production_schedule] ADD CONSTRAINT [FK_production_schedule_production_operation_id] FOREIGN KEY ([production_operation_id]) REFERENCES [production_operation] ([id]);
GO

ALTER TABLE [production_schedule] ADD CONSTRAINT [FK_production_schedule_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [production_schedule] ADD CONSTRAINT [FK_production_schedule_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [production_schedule] ADD CONSTRAINT [FK_production_schedule_production_line_id] FOREIGN KEY ([production_line_id]) REFERENCES [production_line] ([id]);
GO

ALTER TABLE [production_schedule] ADD CONSTRAINT [FK_production_schedule_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_performance] ADD CONSTRAINT [FK_production_performance_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [production_performance] ADD CONSTRAINT [FK_production_performance_production_process_id] FOREIGN KEY ([production_process_id]) REFERENCES [production_process] ([id]);
GO

ALTER TABLE [production_result] ADD CONSTRAINT [FK_production_result_production_schedule_id] FOREIGN KEY ([production_schedule_id]) REFERENCES [production_schedule] ([id]);
GO

ALTER TABLE [production_result] ADD CONSTRAINT [FK_production_result_production_content_id] FOREIGN KEY ([production_content_id]) REFERENCES [production_content] ([id]);
GO

ALTER TABLE [production_result] ADD CONSTRAINT [FK_production_result_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [production_result] ADD CONSTRAINT [FK_production_result_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [production_document] ADD CONSTRAINT [FK_production_document_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [production_document] ADD CONSTRAINT [FK_production_document_production_process_id] FOREIGN KEY ([production_process_id]) REFERENCES [production_process] ([id]);
GO

ALTER TABLE [production_issue] ADD CONSTRAINT [FK_production_issue_production_process_id] FOREIGN KEY ([production_process_id]) REFERENCES [production_process] ([id]);
GO

ALTER TABLE [production_issue] ADD CONSTRAINT [FK_production_issue_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [production_issue] ADD CONSTRAINT [FK_production_issue_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [production_countermeasure] ADD CONSTRAINT [FK_production_countermeasure_production_issue_id] FOREIGN KEY ([production_issue_id]) REFERENCES [production_issue] ([id]);
GO

ALTER TABLE [equipment] ADD CONSTRAINT [FK_equipment_production_line_id] FOREIGN KEY ([production_line_id]) REFERENCES [production_line] ([id]);
GO

ALTER TABLE [equipment] ADD CONSTRAINT [FK_equipment_asset_id] FOREIGN KEY ([asset_id]) REFERENCES [asset] ([id]);
GO

ALTER TABLE [equipment] ADD CONSTRAINT [FK_equipment_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [equipment] ADD CONSTRAINT [FK_equipment_energy_node_id] FOREIGN KEY ([energy_node_id]) REFERENCES [energy_node] ([id]);
GO

ALTER TABLE [equipment_group] ADD CONSTRAINT [FK_equipment_group_asset_group_id] FOREIGN KEY ([asset_group_id]) REFERENCES [asset_group] ([id]);
GO

ALTER TABLE [equipment_structure] ADD CONSTRAINT [FK_equipment_structure_parent_equipment_group_id] FOREIGN KEY ([parent_equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [equipment_structure] ADD CONSTRAINT [FK_equipment_structure_child_equipment_group_id] FOREIGN KEY ([child_equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [equipment_structure] ADD CONSTRAINT [FK_equipment_structure_parent_equipment_id] FOREIGN KEY ([parent_equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_structure] ADD CONSTRAINT [FK_equipment_structure_child_equipment_id] FOREIGN KEY ([child_equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_function] ADD CONSTRAINT [FK_equipment_function_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_specification] ADD CONSTRAINT [FK_equipment_specification_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_portion] ADD CONSTRAINT [FK_equipment_portion_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_document] ADD CONSTRAINT [FK_equipment_document_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_issue] ADD CONSTRAINT [FK_equipment_issue_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_issue] ADD CONSTRAINT [FK_equipment_issue_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [equipment_countermeasure] ADD CONSTRAINT [FK_equipment_countermeasure_equipment_issue_id] FOREIGN KEY ([equipment_issue_id]) REFERENCES [equipment_issue] ([id]);
GO

ALTER TABLE [equipment_process] ADD CONSTRAINT [FK_equipment_process_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [equipment_operation] ADD CONSTRAINT [FK_equipment_operation_equipment_process_id] FOREIGN KEY ([equipment_process_id]) REFERENCES [equipment_process] ([id]);
GO

ALTER TABLE [equipment_operation] ADD CONSTRAINT [FK_equipment_operation_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [equipment_operation] ADD CONSTRAINT [FK_equipment_operation_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [equipment_content] ADD CONSTRAINT [FK_equipment_content_equipment_operation_id] FOREIGN KEY ([equipment_operation_id]) REFERENCES [equipment_operation] ([id]);
GO

ALTER TABLE [equipment_assignment] ADD CONSTRAINT [FK_equipment_assignment_equipment_operation_id] FOREIGN KEY ([equipment_operation_id]) REFERENCES [equipment_operation] ([id]);
GO

ALTER TABLE [equipment_assignment] ADD CONSTRAINT [FK_equipment_assignment_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_assignment] ADD CONSTRAINT [FK_equipment_assignment_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [equipment_capacity] ADD CONSTRAINT [FK_equipment_capacity_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [equipment_capacity] ADD CONSTRAINT [FK_equipment_capacity_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [equipment_order] ADD CONSTRAINT [FK_equipment_order_equipment_process_id] FOREIGN KEY ([equipment_process_id]) REFERENCES [equipment_process] ([id]);
GO

ALTER TABLE [equipment_schedule] ADD CONSTRAINT [FK_equipment_schedule_equipment_operation_id] FOREIGN KEY ([equipment_operation_id]) REFERENCES [equipment_operation] ([id]);
GO

ALTER TABLE [equipment_schedule] ADD CONSTRAINT [FK_equipment_schedule_equipment_order_id] FOREIGN KEY ([equipment_order_id]) REFERENCES [equipment_order] ([id]);
GO

ALTER TABLE [equipment_schedule] ADD CONSTRAINT [FK_equipment_schedule_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [equipment_schedule] ADD CONSTRAINT [FK_equipment_schedule_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [equipment_performance] ADD CONSTRAINT [FK_equipment_performance_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [equipment_performance] ADD CONSTRAINT [FK_equipment_performance_equipment_process_id] FOREIGN KEY ([equipment_process_id]) REFERENCES [equipment_process] ([id]);
GO

ALTER TABLE [equipment_result] ADD CONSTRAINT [FK_equipment_result_equipment_content_id] FOREIGN KEY ([equipment_content_id]) REFERENCES [equipment_content] ([id]);
GO

ALTER TABLE [equipment_result] ADD CONSTRAINT [FK_equipment_result_equipment_schedule_id] FOREIGN KEY ([equipment_schedule_id]) REFERENCES [equipment_schedule] ([id]);
GO

ALTER TABLE [personnel] ADD CONSTRAINT [FK_personnel_production_line_id] FOREIGN KEY ([production_line_id]) REFERENCES [production_line] ([id]);
GO

ALTER TABLE [personnel] ADD CONSTRAINT [FK_personnel_asset_id] FOREIGN KEY ([asset_id]) REFERENCES [asset] ([id]);
GO

ALTER TABLE [personnel] ADD CONSTRAINT [FK_personnel_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [personnel_group] ADD CONSTRAINT [FK_personnel_group_asset_group_id] FOREIGN KEY ([asset_group_id]) REFERENCES [asset_group] ([id]);
GO

ALTER TABLE [personnel_structure] ADD CONSTRAINT [FK_personnel_structure_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [personnel_structure] ADD CONSTRAINT [FK_personnel_structure_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [personnel_skill] ADD CONSTRAINT [FK_personnel_skill_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [personnel_specification] ADD CONSTRAINT [FK_personnel_specification_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [personnel_portion] ADD CONSTRAINT [FK_personnel_portion_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [personnel_document] ADD CONSTRAINT [FK_personnel_document_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [personnel_issue] ADD CONSTRAINT [FK_personnel_issue_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [personnel_issue] ADD CONSTRAINT [FK_personnel_issue_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [personnel_countermeasure] ADD CONSTRAINT [FK_personnel_countermeasure_personnel_issue_id] FOREIGN KEY ([personnel_issue_id]) REFERENCES [personnel_issue] ([id]);
GO

ALTER TABLE [work_process] ADD CONSTRAINT [FK_work_process_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [work_operation] ADD CONSTRAINT [FK_work_operation_work_process_id] FOREIGN KEY ([work_process_id]) REFERENCES [work_process] ([id]);
GO

ALTER TABLE [work_operation] ADD CONSTRAINT [FK_work_operation_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [work_operation] ADD CONSTRAINT [FK_work_operation_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [work_content] ADD CONSTRAINT [FK_work_content_work_operation_id] FOREIGN KEY ([work_operation_id]) REFERENCES [work_operation] ([id]);
GO

ALTER TABLE [work_assignment] ADD CONSTRAINT [FK_work_assignment_work_operation_id] FOREIGN KEY ([work_operation_id]) REFERENCES [work_operation] ([id]);
GO

ALTER TABLE [work_assignment] ADD CONSTRAINT [FK_work_assignment_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [work_assignment] ADD CONSTRAINT [FK_work_assignment_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [work_capacity] ADD CONSTRAINT [FK_work_capacity_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [work_capacity] ADD CONSTRAINT [FK_work_capacity_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [work_capacity] ADD CONSTRAINT [FK_work_capacity_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [work_order] ADD CONSTRAINT [FK_work_order_work_process_id] FOREIGN KEY ([work_process_id]) REFERENCES [work_process] ([id]);
GO

ALTER TABLE [work_schedule] ADD CONSTRAINT [FK_work_schedule_work_order_id] FOREIGN KEY ([work_order_id]) REFERENCES [work_order] ([id]);
GO

ALTER TABLE [work_schedule] ADD CONSTRAINT [FK_work_schedule_work_operation_id] FOREIGN KEY ([work_operation_id]) REFERENCES [work_operation] ([id]);
GO

ALTER TABLE [work_schedule] ADD CONSTRAINT [FK_work_schedule_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [work_schedule] ADD CONSTRAINT [FK_work_schedule_personnel_id] FOREIGN KEY ([personnel_id]) REFERENCES [personnel] ([id]);
GO

ALTER TABLE [work_performance] ADD CONSTRAINT [FK_work_performance_work_process_id] FOREIGN KEY ([work_process_id]) REFERENCES [work_process] ([id]);
GO

ALTER TABLE [work_performance] ADD CONSTRAINT [FK_work_performance_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [work_result] ADD CONSTRAINT [FK_work_result_work_schedule_id] FOREIGN KEY ([work_schedule_id]) REFERENCES [work_schedule] ([id]);
GO

ALTER TABLE [work_result] ADD CONSTRAINT [FK_work_result_work_content_id] FOREIGN KEY ([work_content_id]) REFERENCES [work_content] ([id]);
GO

ALTER TABLE [inventory_item] ADD CONSTRAINT [FK_inventory_item_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [inventory_item] ADD CONSTRAINT [FK_inventory_item_production_line_id] FOREIGN KEY ([production_line_id]) REFERENCES [production_line] ([id]);
GO

ALTER TABLE [inventory_capacity] ADD CONSTRAINT [FK_inventory_capacity_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [inventory_capacity] ADD CONSTRAINT [FK_inventory_capacity_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [inventory_capacity] ADD CONSTRAINT [FK_inventory_capacity_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [inventory_order] ADD CONSTRAINT [FK_inventory_order_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [inventory_order] ADD CONSTRAINT [FK_inventory_order_production_order_id] FOREIGN KEY ([production_order_id]) REFERENCES [production_order] ([id]);
GO

ALTER TABLE [inventory_schedule] ADD CONSTRAINT [FK_inventory_schedule_inventory_transfer_id] FOREIGN KEY ([inventory_transfer_id]) REFERENCES [inventory_transfer] ([id]);
GO

ALTER TABLE [inventory_schedule] ADD CONSTRAINT [FK_inventory_schedule_inventory_order_id] FOREIGN KEY ([inventory_order_id]) REFERENCES [inventory_order] ([id]);
GO

ALTER TABLE [inventory_schedule] ADD CONSTRAINT [FK_inventory_schedule_from_inventory_item_id] FOREIGN KEY ([from_inventory_item_id]) REFERENCES [inventory_item] ([id]);
GO

ALTER TABLE [inventory_schedule] ADD CONSTRAINT [FK_inventory_schedule_to_inventory_item_id] FOREIGN KEY ([to_inventory_item_id]) REFERENCES [inventory_item] ([id]);
GO

ALTER TABLE [inventory_transfer] ADD CONSTRAINT [FK_inventory_transfer_inventory_item_id] FOREIGN KEY ([inventory_item_id]) REFERENCES [inventory_item] ([id]);
GO

ALTER TABLE [inventory_transfer] ADD CONSTRAINT [FK_inventory_transfer_equipment_group_id] FOREIGN KEY ([equipment_group_id]) REFERENCES [equipment_group] ([id]);
GO

ALTER TABLE [inventory_transfer] ADD CONSTRAINT [FK_inventory_transfer_personnel_group_id] FOREIGN KEY ([personnel_group_id]) REFERENCES [personnel_group] ([id]);
GO

ALTER TABLE [inventory_result] ADD CONSTRAINT [FK_inventory_result_inventory_item_id] FOREIGN KEY ([inventory_item_id]) REFERENCES [inventory_item] ([id]);
GO

ALTER TABLE [inventory_result] ADD CONSTRAINT [FK_inventory_result_inventory_schedule_id] FOREIGN KEY ([inventory_schedule_id]) REFERENCES [inventory_schedule] ([id]);
GO

ALTER TABLE [energy] ADD CONSTRAINT [FK_energy_energy_group_id] FOREIGN KEY ([energy_group_id]) REFERENCES [energy_group] ([id]);
GO

ALTER TABLE [energy_structure] ADD CONSTRAINT [FK_energy_structure_energy_id] FOREIGN KEY ([energy_id]) REFERENCES [energy] ([id]);
GO

ALTER TABLE [energy_function] ADD CONSTRAINT [FK_energy_function_energy_id] FOREIGN KEY ([energy_id]) REFERENCES [energy] ([id]);
GO

ALTER TABLE [energy_specification] ADD CONSTRAINT [FK_energy_specification_energy_id] FOREIGN KEY ([energy_id]) REFERENCES [energy] ([id]);
GO

ALTER TABLE [energy_node] ADD CONSTRAINT [FK_energy_node_energy_id] FOREIGN KEY ([energy_id]) REFERENCES [energy] ([id]);
GO

ALTER TABLE [energy_capacity] ADD CONSTRAINT [FK_energy_capacity_site_id] FOREIGN KEY ([site_id]) REFERENCES [site] ([id]);
GO

ALTER TABLE [energy_capacity] ADD CONSTRAINT [FK_energy_capacity_term_id] FOREIGN KEY ([term_id]) REFERENCES [term] ([id]);
GO

ALTER TABLE [energy_capacity] ADD CONSTRAINT [FK_energy_capacity_energy_group_id] FOREIGN KEY ([energy_group_id]) REFERENCES [energy_group] ([id]);
GO

ALTER TABLE [energy_order] ADD CONSTRAINT [FK_energy_order_energy_node_id] FOREIGN KEY ([energy_node_id]) REFERENCES [energy_node] ([id]);
GO

ALTER TABLE [energy_schedule] ADD CONSTRAINT [FK_energy_schedule_energy_order_id] FOREIGN KEY ([energy_order_id]) REFERENCES [energy_order] ([id]);
GO

ALTER TABLE [energy_performance] ADD CONSTRAINT [FK_energy_performance_energy_node_id] FOREIGN KEY ([energy_node_id]) REFERENCES [energy_node] ([id]);
GO

ALTER TABLE [energy_result] ADD CONSTRAINT [FK_energy_result_energy_schedule_id] FOREIGN KEY ([energy_schedule_id]) REFERENCES [energy_schedule] ([id]);
GO

ALTER TABLE [energy_result] ADD CONSTRAINT [FK_energy_result_equipment_id] FOREIGN KEY ([equipment_id]) REFERENCES [equipment] ([id]);
GO

ALTER TABLE [sales_item] ADD CONSTRAINT [FK_sales_item_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [sales_item] ADD CONSTRAINT [FK_sales_item_customer_id] FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id]);
GO

ALTER TABLE [sales_document] ADD CONSTRAINT [FK_sales_document_customer_id] FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id]);
GO

ALTER TABLE [sales_order] ADD CONSTRAINT [FK_sales_order_sales_document_id] FOREIGN KEY ([sales_document_id]) REFERENCES [sales_document] ([id]);
GO

ALTER TABLE [sales_order] ADD CONSTRAINT [FK_sales_order_sales_item_id] FOREIGN KEY ([sales_item_id]) REFERENCES [sales_item] ([id]);
GO

ALTER TABLE [sales_specification] ADD CONSTRAINT [FK_sales_specification_sales_item_id] FOREIGN KEY ([sales_item_id]) REFERENCES [sales_item] ([id]);
GO

ALTER TABLE [sales_invoice] ADD CONSTRAINT [FK_sales_invoice_customer_id] FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id]);
GO

ALTER TABLE [sales_invoice] ADD CONSTRAINT [FK_sales_invoice_shipping_result_id] FOREIGN KEY ([shipping_result_id]) REFERENCES [shipping_result] ([id]);
GO

ALTER TABLE [sales_forecast] ADD CONSTRAINT [FK_sales_forecast_sales_item_id] FOREIGN KEY ([sales_item_id]) REFERENCES [sales_item] ([id]);
GO

ALTER TABLE [sales_quotation] ADD CONSTRAINT [FK_sales_quotation_customer_id] FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id]);
GO

ALTER TABLE [sales_quotation] ADD CONSTRAINT [FK_sales_quotation_sales_item_id] FOREIGN KEY ([sales_item_id]) REFERENCES [sales_item] ([id]);
GO

ALTER TABLE [shipping_result] ADD CONSTRAINT [FK_shipping_result_sales_order_id] FOREIGN KEY ([sales_order_id]) REFERENCES [sales_order] ([id]);
GO

ALTER TABLE [purchase_item] ADD CONSTRAINT [FK_purchase_item_production_item_id] FOREIGN KEY ([production_item_id]) REFERENCES [production_item] ([id]);
GO

ALTER TABLE [purchase_item] ADD CONSTRAINT [FK_purchase_item_supplier_id] FOREIGN KEY ([supplier_id]) REFERENCES [supplier] ([id]);
GO

ALTER TABLE [purchase_document] ADD CONSTRAINT [FK_purchase_document_supplier_id] FOREIGN KEY ([supplier_id]) REFERENCES [supplier] ([id]);
GO

ALTER TABLE [purchase_order] ADD CONSTRAINT [FK_purchase_order_purchase_document_id] FOREIGN KEY ([purchase_document_id]) REFERENCES [purchase_document] ([id]);
GO

ALTER TABLE [purchase_order] ADD CONSTRAINT [FK_purchase_order_purchase_item_id] FOREIGN KEY ([purchase_item_id]) REFERENCES [purchase_item] ([id]);
GO

ALTER TABLE [purchase_specification] ADD CONSTRAINT [FK_purchase_specification_purchase_item_id] FOREIGN KEY ([purchase_item_id]) REFERENCES [purchase_item] ([id]);
GO

ALTER TABLE [purchase_invoice] ADD CONSTRAINT [FK_purchase_invoice_supplier_id] FOREIGN KEY ([supplier_id]) REFERENCES [supplier] ([id]);
GO

ALTER TABLE [purchase_invoice] ADD CONSTRAINT [FK_purchase_invoice_receiving_result_id] FOREIGN KEY ([receiving_result_id]) REFERENCES [receiving_result] ([id]);
GO

ALTER TABLE [purchase_forecast] ADD CONSTRAINT [FK_purchase_forecast_purchase_item_id] FOREIGN KEY ([purchase_item_id]) REFERENCES [purchase_item] ([id]);
GO

ALTER TABLE [purchase_quotation] ADD CONSTRAINT [FK_purchase_quotation_supplier_id] FOREIGN KEY ([supplier_id]) REFERENCES [supplier] ([id]);
GO

ALTER TABLE [purchase_quotation] ADD CONSTRAINT [FK_purchase_quotation_purchase_item_id] FOREIGN KEY ([purchase_item_id]) REFERENCES [purchase_item] ([id]);
GO

ALTER TABLE [receiving_result] ADD CONSTRAINT [FK_receiving_result_purchase_order_id] FOREIGN KEY ([purchase_order_id]) REFERENCES [purchase_order] ([id]);
GO


-- ==== テーブル/カラム コメント (拡張プロパティ) ====

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事業者: 自社および取引先となる企業を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'enterprise', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エリア: サイト内の区画、フロア、または管理単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'area', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイト: 生産活動を行う工場や拠点を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'enterprise_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'site', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産ライン: 生産工程を実行するラインまたは設備群を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エリアID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'area_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_line', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'カレンダ: 稼働日、休日、シフトなどの操業条件を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'calendar', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ターム: カレンダを構成する時間区間を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'カレンダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'calendar_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'term', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産計画: 生産数量や期間に関する計画を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'計画数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_plan', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'能力計画: 生産能力の確保や配分計画を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'計画数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'capacity_plan', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売計画: 期間ごとの販売目標計画を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'計画数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_plan', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買計画: 期間ごとの調達目標計画を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'計画数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_plan', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセット: 生産活動に関わる資産の共通情報を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットグループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'asset_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットグループ: 共通属性をもつアセットの分類単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_group', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセット構成: アセット間の構成関係や階層構造を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'親アセットグループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'parent_asset_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'子アセットグループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'child_asset_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'親アセットID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'parent_asset_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'子アセットID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'child_asset_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_structure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセット仕様: アセットに求められる仕様や性能条件を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'asset_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'asset_specification', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'監視内容: 設備や工程で監視する対象項目を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'asset_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_content', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'監視結果: 監視項目に対する実測値や状態結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'監視内容ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'monitoring_content_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'monitoring_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目: 生産対象となる製品、部品、材料を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'asset_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'production_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループ: 共通特性をもつ生産品目の分類単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_group', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目構成: 生産品目の部品表や構成関係を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'親品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'parent_production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'子品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'child_production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'親生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'parent_production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'子生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'child_production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_structure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目機能: 生産品目が提供する機能や役割を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_function', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目仕様: 生産品目の仕様、品質条件、性能条件を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_specification', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目部位: 生産品目を構成する識別可能な部位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_portion', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目図書: 生産品目に関連する図面や仕様書を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ファイル', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'file_link';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_document', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目事象: 生産品目に関連する不具合や課題を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事象日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'issue_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_issue', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目対策: 品目事象に対する対策内容を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目事象ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'production_item_issue_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_countermeasure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目結果: 生産品目を生産して得られた実体を示す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産指示ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'production_schedule_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_item_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工程: 技術的に定義された生産工程を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_process', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産手順: 生産工程を具体化した作業手順を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'production_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'work_hours';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産日数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'work_days';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_operation', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産内容: 生産手順を構成する詳細な作業項目を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'production_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_content', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産割当: 生産指示に対するリソース割当を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'production_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_assignment', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産能力: 生産ラインや工程の能力情報を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品目グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'production_item_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最大値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'maximum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最小値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'minimum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_capacity', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産オーダ: 生産を要求する指示単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'production_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発行日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'release_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_order', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産指示: 生産オーダに基づく実行指示を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'production_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'production_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産ラインID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'production_line_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'予定数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_schedule', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産実績: 実際の生産量や稼働実績を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'production_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'time_unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_performance', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産結果: 生産指示の結果として得られた実行結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産指示ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'production_schedule_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産項目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'production_content_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産図書: 生産工程に関連する技術文書を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'production_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ファイル', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'file_link';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_document', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産事象: 生産活動で発生した問題や異常を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産プロセスID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'production_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事象日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'issue_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_issue', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産対策: 生産事象に対する改善や対策を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産事象ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'production_issue_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'production_countermeasure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備: 生産作業を実行する機械や装置を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産ラインID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'production_line_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'asset_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ接点ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'energy_node_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループ: 共通機能をもつ設備の分類単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットグループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'asset_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_group', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備構成: 設備の親子関係や構成情報を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'親設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'parent_equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'子設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'child_equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'親設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'parent_equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'子設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'child_equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_structure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備機能: 設備がもつ機能や役割を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_function', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備仕様: 設備に求められる性能や仕様条件を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_specification', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備部位: 設備を構成する識別可能な部位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_portion', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備図書: 設備に関連する図面やマニュアルを表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ファイル', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'file_link';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_document', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備事象: 設備に発生した故障や異常を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事象日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'issue_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_issue', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備対策: 設備事象に対する対策内容を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備事象ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'equipment_issue_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_countermeasure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備工程: 設備に関する保全や稼働の工程を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_process', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備手順: 設備工程を実行する具体的な手順を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'equipment_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'work_hours';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産日数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'work_days';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_operation', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備内容: 設備手順を構成する詳細な作業項目を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'equipment_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_content', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備割当: 生産手順に対する設備割当を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'equipment_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_assignment', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備能力: 設備がもつ処理能力や性能を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最大値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'maximum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最小値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'minimum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_capacity', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備オーダ: 設備に対する作業要求を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'equipment_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発行日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'release_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_order', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備指示: 設備オーダに基づく実行指示を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'equipment_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'equipment_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'予定数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_schedule', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備実績: 設備の稼働実績や運転結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'equipment_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'time_unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_performance', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備結果: 設備作業の結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備項目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'equipment_content_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備指示ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'equipment_schedule_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'equipment_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者: 生産活動に従事する作業者を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産ラインID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'production_line_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'asset_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループ: 共通役割をもつ作業者のグループを表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'アセットグループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'asset_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_group', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者構成: 作業者間の階層や代替関係を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_structure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者スキル: 作業者が保有する技能や資格を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_skill', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者仕様: 作業者に求められる資格や条件を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_specification', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者部位: 作業者の身体的または機能的な部位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_portion', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者図書: 作業者に関連する教育資料や記録を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ファイル', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'file_link';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_document', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者事象: 作業者に関連する問題や事故を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'事象日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'issue_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_issue', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者対策: 作業者事象に対する改善や対策を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者事象ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'personnel_issue_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摘要', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'note';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'personnel_countermeasure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業工程: 人作業として定義された工程を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_process', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業手順: 作業工程を実行する具体的な手順を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'work_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産工数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'work_hours';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産日数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'work_days';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_operation', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業内容: 作業手順を構成する詳細な作業項目を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'work_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_content', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業割当: 作業指示に対するリソース割当を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'work_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_assignment', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業能力: 作業者または作業班の能力を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最大値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'maximum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最小値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'minimum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_capacity', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業オーダ: 作業者に対する作業要求を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業工程ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'work_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発行日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'release_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_order', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業指示: 作業オーダに基づく実行指示を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'work_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業手順ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'work_operation_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'personnel_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'予定数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_schedule', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業実績: 作業者または作業班の実績を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'work_process_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'time_unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_performance', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業結果: 作業の実行結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業指示ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'work_schedule_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業項目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'work_content_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'work_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫品目: 在庫場所ごとの管理品目を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産ラインID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'production_line_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'lead_time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_item', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫能力: 在庫場所の保管能力を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最大値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'maximum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最小値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'minimum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_capacity', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫オーダ: 在庫品目の移動・補充オーダを表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'production_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発行日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'release_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_order', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫指示: 在庫品目の移動・補充指示を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫移動ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'inventory_transfer_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'inventory_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'移動元在庫品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'from_inventory_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'移動先在庫品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'to_inventory_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'予定数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_schedule', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫移動: 在庫品目の数量増減結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'inventory_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'equipment_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作業者グループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'personnel_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'time_unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_transfer', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫数量: ある時点における在庫数量を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'inventory_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'在庫指示ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'inventory_schedule_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'inventory_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ: 生産活動に必要なエネルギを表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギグループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'energy_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギグループ: エネルギ源の分類単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_group', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ構成: エネルギ供給の構成関係を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'energy_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_structure', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ機能: エネルギがもつ機能を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'energy_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_function', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ仕様: エネルギに求められる仕様条件を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'energy_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_specification', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ接点: エネルギの供給・消費の接続点を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'energy_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_node', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ能力: 共有可能なエネルギ供給能力を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'サイトID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'site_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'タームID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'term_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギグループID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'energy_group_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最大値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'maximum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最小値', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'minimum_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_capacity', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギオーダ: エネルギの供給・消費オーダを表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ接点ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'energy_node_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発行日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'release_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_order', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ指示: エネルギの供給・消費指示を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギオーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'energy_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'追番', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'index_no';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'予定数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'planned_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'実績数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'actual_value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_schedule', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ実績: エネルギの供給・消費実績を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ接点ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'energy_node_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'時間単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'time_unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'開始日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'終了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_performance', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ結果: エネルギ接点ごとの記録結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'エネルギ指示ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'energy_schedule_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'設備ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'equipment_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'energy_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'得意先: 販売品目を提供する相手の事業者を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'customer', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売品目: 得意先に提供される生産品目を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'得意先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'customer_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'lead_time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_item', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'受注伝票: 得意先からの注文の管理単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'得意先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'customer_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発注日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'order_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'入荷日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'receiving_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_document', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'受注明細: 販売品目ごとの受注内容を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売伝票ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'sales_document_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'sales_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発行日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'release_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_order', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売仕様: 得意先ごとの販売条件・仕様を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'sales_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_specification', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売請求: 得意先に発行する請求情報を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'得意先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'customer_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出荷実績ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'shipping_result_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'請求日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'invoice_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'支払日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'payment_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_invoice', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'受注内示: 得意先からの需要予測情報を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'sales_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内示日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'forecast_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_forecast', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売見積: 得意先への見積依頼と回答を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'得意先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'customer_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'sales_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'見積日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'quotation_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'sales_quotation', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出荷明細: 販売品目の出荷結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'販売オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'sales_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'shipping_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕入先: 資材・部品を調達する相手の事業者を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'supplier', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買品目: 仕入先から提供される生産品目を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生産品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'production_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕入先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'supplier_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日数', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'lead_time';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_item', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買伝票: 仕入先への注文の管理単位を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕入先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'supplier_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発注日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'order_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'入荷日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'receiving_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_document', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買明細: 仕入先への個々の注文内容を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買伝票ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'purchase_document_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'purchase_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'発行日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'release_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'着手日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'start_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'完了日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'end_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_order', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買仕様: 仕入先ごとの購買条件・仕様を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'purchase_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_specification', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買請求: 仕入先から受け取る請求情報を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕入先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'supplier_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'入荷実績ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'receiving_result_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'請求日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'invoice_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'支払日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'payment_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_invoice', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕入内示: 仕入先への仕入予測通知を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'purchase_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内示日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'forecast_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_forecast', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買見積: 仕入先への見積依頼と回答を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕入先ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'supplier_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買品目ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'purchase_item_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単価', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'unit_price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金額', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'price';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'納期', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'due_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'見積日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'quotation_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'purchase_quotation', @level2type = N'COLUMN', @level2name = N'remark';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'入荷明細: 購買品目の入荷結果を表す。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'name';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分類', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'category';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状態', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'status';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'説明', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'description';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'購買オーダID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'purchase_order_id';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'仕様', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'specification';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数量', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'value';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'単位', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'unit';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'場所', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'location';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'結果日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'result_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登録日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'created_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新日時', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'updated_at';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'作成者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'created_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'承認者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'approved_by';
GO

EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'備考', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',  @level1name = N'receiving_result', @level2type = N'COLUMN', @level2name = N'remark';
GO

