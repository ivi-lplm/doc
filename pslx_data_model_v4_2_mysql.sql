--------------------------------------------------------------------------
-- PSLXスキーマ 4.2  MySQL 用 DDL
-- 変換元: 汎用SQL(DBML由来, MySQLエクスポート)
-- 変換ルール:
--   varchar(255)            -> VARCHAR(n)  (id/*_id列は36, description等の長文列は1000, その他は100)
--   decimal (精度未指定)     -> DECIMAL(18,4)
--   datetime                -> DATETIME (そのまま)
--   各テーブルに ENGINE=InnoDB / CHARSET=utf8mb4 / COLLATE=utf8mb4_unicode_ci を付与
--     (日本語データの文字化け防止、外部キー用にInnoDBを明示)
--   テーブルコメントは CREATE TABLE 末尾の COMMENT='...' に統合
--     (元ファイルにあった ALTER TABLE ... COMMENT = '...' の別立て記述を統合)
--   列コメントは元ファイルの COMMENT '...' をそのまま維持
--   外部キー制約に CONSTRAINT `fk_テーブル名_カラム名` を明示付与(64バイト制限内)
--   対象: MySQL 5.7 / 8.0 系
--------------------------------------------------------------------------

CREATE TABLE `enterprise` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='事業者: 自社および取引先となる企業を表す。';

CREATE TABLE `area` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エリア: サイト内の区画、フロア、または管理単位を表す。';

CREATE TABLE `site` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `enterprise_id` VARCHAR(36) COMMENT '事業者ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='サイト: 生産活動を行う工場や拠点を表す。';

CREATE TABLE `production_line` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `area_id` VARCHAR(36) COMMENT 'エリアID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産ライン: 生産工程を実行するラインまたは設備群を表す。';

CREATE TABLE `calendar` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='カレンダ: 稼働日、休日、シフトなどの操業条件を表す。';

CREATE TABLE `term` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `calendar_id` VARCHAR(36) COMMENT 'カレンダID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ターム: カレンダを構成する時間区間を表す。';

CREATE TABLE `production_plan` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `production_item_group_id` VARCHAR(36) COMMENT '品目グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '計画数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産計画: 生産数量や期間に関する計画を表す。';

CREATE TABLE `capacity_plan` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '計画数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='能力計画: 生産能力の確保や配分計画を表す。';

CREATE TABLE `sales_plan` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `production_item_group_id` VARCHAR(36) COMMENT '品目グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '計画数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='販売計画: 期間ごとの販売目標計画を表す。';

CREATE TABLE `purchase_plan` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `production_item_group_id` VARCHAR(36) COMMENT '品目グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '計画数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購買計画: 期間ごとの調達目標計画を表す。';

CREATE TABLE `asset` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `asset_group_id` VARCHAR(36) COMMENT 'アセットグループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='アセット: 生産活動に関わる資産の共通情報を表す。';

CREATE TABLE `asset_group` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='アセットグループ: 共通属性をもつアセットの分類単位を表す。';

CREATE TABLE `asset_structure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `parent_asset_group_id` VARCHAR(36) COMMENT '親アセットグループID',
  `child_asset_group_id` VARCHAR(36) COMMENT '子アセットグループID',
  `parent_asset_id` VARCHAR(36) COMMENT '親アセットID',
  `child_asset_id` VARCHAR(36) COMMENT '子アセットID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='アセット構成: アセット間の構成関係や階層構造を表す。';

CREATE TABLE `asset_specification` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `asset_id` VARCHAR(36) COMMENT 'アセットID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='アセット仕様: アセットに求められる仕様や性能条件を表す。';

CREATE TABLE `monitoring_content` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `asset_id` VARCHAR(36) COMMENT 'アセットID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='監視内容: 設備や工程で監視する対象項目を表す。';

CREATE TABLE `monitoring_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `monitoring_content_id` VARCHAR(36) COMMENT '監視内容ID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='監視結果: 監視項目に対する実測値や状態結果を表す。';

CREATE TABLE `production_item` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `asset_id` VARCHAR(36) COMMENT 'アセットID',
  `production_item_group_id` VARCHAR(36) COMMENT '品目グループID',
  `production_process_id` VARCHAR(36) COMMENT '生産工程ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産品目: 生産対象となる製品、部品、材料を表す。';

CREATE TABLE `production_item_group` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目グループ: 共通特性をもつ生産品目の分類単位を表す。';

CREATE TABLE `production_item_structure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `parent_production_item_group_id` VARCHAR(36) COMMENT '親品目グループID',
  `child_production_item_group_id` VARCHAR(36) COMMENT '子品目グループID',
  `parent_production_item_id` VARCHAR(36) COMMENT '親生産品目ID',
  `child_production_item_id` VARCHAR(36) COMMENT '子生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目構成: 生産品目の部品表や構成関係を表す。';

CREATE TABLE `production_item_function` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目機能: 生産品目が提供する機能や役割を表す。';

CREATE TABLE `production_item_specification` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目仕様: 生産品目の仕様、品質条件、性能条件を表す。';

CREATE TABLE `production_item_portion` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目部位: 生産品目を構成する識別可能な部位を表す。';

CREATE TABLE `production_item_document` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `file_link` VARCHAR(1000) COMMENT 'ファイル',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目図書: 生産品目に関連する図面や仕様書を表す。';

CREATE TABLE `production_item_issue` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `production_item_group_id` VARCHAR(36) COMMENT '品目グループID',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `issue_at` DATETIME COMMENT '事象日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目事象: 生産品目に関連する不具合や課題を表す。';

CREATE TABLE `production_item_countermeasure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_issue_id` VARCHAR(36) COMMENT '品目事象ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目対策: 品目事象に対する対策内容を表す。';

CREATE TABLE `production_item_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `production_schedule_id` VARCHAR(36) COMMENT '生産指示ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品目結果: 生産品目を生産して得られた実体を示す。';

CREATE TABLE `production_process` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_group_id` VARCHAR(36) COMMENT '品目グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産工程: 技術的に定義された生産工程を表す。';

CREATE TABLE `production_operation` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_process_id` VARCHAR(36) COMMENT '生産工程ID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `work_hours` DECIMAL(18,4) COMMENT '生産工数',
  `work_days` DECIMAL(18,4) COMMENT '生産日数',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産手順: 生産工程を具体化した作業手順を表す。';

CREATE TABLE `production_content` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_operation_id` VARCHAR(36) COMMENT '生産手順ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産内容: 生産手順を構成する詳細な作業項目を表す。';

CREATE TABLE `production_assignment` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_operation_id` VARCHAR(36) COMMENT '生産手順ID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産割当: 生産指示に対するリソース割当を表す。';

CREATE TABLE `production_capacity` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `production_item_group_id` VARCHAR(36) COMMENT '品目グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `maximum_value` DECIMAL(18,4) COMMENT '最大値',
  `minimum_value` DECIMAL(18,4) COMMENT '最小値',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産能力: 生産ラインや工程の能力情報を表す。';

CREATE TABLE `production_order` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_process_id` VARCHAR(36) COMMENT '生産工程ID',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `due_at` DATETIME COMMENT '納期',
  `release_at` DATETIME COMMENT '発行日時',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産オーダ: 生産を要求する指示単位を表す。';

CREATE TABLE `production_schedule` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_order_id` VARCHAR(36) COMMENT '生産オーダID',
  `production_operation_id` VARCHAR(36) COMMENT '生産手順ID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `production_line_id` VARCHAR(36) COMMENT '生産ラインID',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '予定数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産指示: 生産オーダに基づく実行指示を表す。';

CREATE TABLE `production_performance` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `production_process_id` VARCHAR(36) COMMENT '生産工程ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `time` DECIMAL(18,4) COMMENT '時間',
  `time_unit` VARCHAR(100) COMMENT '時間単位',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産実績: 実際の生産量や稼働実績を表す。';

CREATE TABLE `production_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_schedule_id` VARCHAR(36) COMMENT '生産指示ID',
  `production_content_id` VARCHAR(36) COMMENT '生産項目ID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産結果: 生産指示の結果として得られた実行結果を表す。';

CREATE TABLE `production_document` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `production_process_id` VARCHAR(36) COMMENT '生産工程ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `file_link` VARCHAR(1000) COMMENT 'ファイル',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産図書: 生産工程に関連する技術文書を表す。';

CREATE TABLE `production_issue` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_process_id` VARCHAR(36) COMMENT '生産プロセスID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `issue_at` DATETIME COMMENT '事象日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産事象: 生産活動で発生した問題や異常を表す。';

CREATE TABLE `production_countermeasure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_issue_id` VARCHAR(36) COMMENT '生産事象ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='生産対策: 生産事象に対する改善や対策を表す。';

CREATE TABLE `equipment` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_line_id` VARCHAR(36) COMMENT '生産ラインID',
  `asset_id` VARCHAR(36) COMMENT 'アセットID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `energy_node_id` VARCHAR(36) COMMENT 'エネルギ接点ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備: 生産作業を実行する機械や装置を表す。';

CREATE TABLE `equipment_group` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `asset_group_id` VARCHAR(36) COMMENT 'アセットグループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備グループ: 共通機能をもつ設備の分類単位を表す。';

CREATE TABLE `equipment_structure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `parent_equipment_group_id` VARCHAR(36) COMMENT '親設備グループID',
  `child_equipment_group_id` VARCHAR(36) COMMENT '子設備グループID',
  `parent_equipment_id` VARCHAR(36) COMMENT '親設備ID',
  `child_equipment_id` VARCHAR(36) COMMENT '子設備ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備構成: 設備の親子関係や構成情報を表す。';

CREATE TABLE `equipment_function` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備機能: 設備がもつ機能や役割を表す。';

CREATE TABLE `equipment_specification` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備仕様: 設備に求められる性能や仕様条件を表す。';

CREATE TABLE `equipment_portion` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備部位: 設備を構成する識別可能な部位を表す。';

CREATE TABLE `equipment_document` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `file_link` VARCHAR(1000) COMMENT 'ファイル',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備図書: 設備に関連する図面やマニュアルを表す。';

CREATE TABLE `equipment_issue` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `issue_at` DATETIME COMMENT '事象日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備事象: 設備に発生した故障や異常を表す。';

CREATE TABLE `equipment_countermeasure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_issue_id` VARCHAR(36) COMMENT '設備事象ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備対策: 設備事象に対する対策内容を表す。';

CREATE TABLE `equipment_process` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備工程: 設備に関する保全や稼働の工程を表す。';

CREATE TABLE `equipment_operation` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_process_id` VARCHAR(36) COMMENT '設備工程ID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `work_hours` DECIMAL(18,4) COMMENT '生産工数',
  `work_days` DECIMAL(18,4) COMMENT '生産日数',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備手順: 設備工程を実行する具体的な手順を表す。';

CREATE TABLE `equipment_content` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_operation_id` VARCHAR(36) COMMENT '設備手順ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備内容: 設備手順を構成する詳細な作業項目を表す。';

CREATE TABLE `equipment_assignment` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_operation_id` VARCHAR(36) COMMENT '設備手順ID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備割当: 生産手順に対する設備割当を表す。';

CREATE TABLE `equipment_capacity` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `maximum_value` DECIMAL(18,4) COMMENT '最大値',
  `minimum_value` DECIMAL(18,4) COMMENT '最小値',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備能力: 設備がもつ処理能力や性能を表す。';

CREATE TABLE `equipment_order` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_process_id` VARCHAR(36) COMMENT '設備工程ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `due_at` DATETIME COMMENT '納期',
  `release_at` DATETIME COMMENT '発行日時',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備オーダ: 設備に対する作業要求を表す。';

CREATE TABLE `equipment_schedule` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_operation_id` VARCHAR(36) COMMENT '設備手順ID',
  `equipment_order_id` VARCHAR(36) COMMENT '設備オーダID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '予定数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備指示: 設備オーダに基づく実行指示を表す。';

CREATE TABLE `equipment_performance` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `equipment_process_id` VARCHAR(36) COMMENT '設備工程ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `time` DECIMAL(18,4) COMMENT '時間',
  `time_unit` VARCHAR(100) COMMENT '時間単位',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備実績: 設備の稼働実績や運転結果を表す。';

CREATE TABLE `equipment_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `equipment_content_id` VARCHAR(36) COMMENT '設備項目ID',
  `equipment_schedule_id` VARCHAR(36) COMMENT '設備指示ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='設備結果: 設備作業の結果を表す。';

CREATE TABLE `personnel` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_line_id` VARCHAR(36) COMMENT '生産ラインID',
  `asset_id` VARCHAR(36) COMMENT 'アセットID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者: 生産活動に従事する作業者を表す。';

CREATE TABLE `personnel_group` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `asset_group_id` VARCHAR(36) COMMENT 'アセットグループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者グループ: 共通役割をもつ作業者のグループを表す。';

CREATE TABLE `personnel_structure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者構成: 作業者間の階層や代替関係を表す。';

CREATE TABLE `personnel_skill` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者スキル: 作業者が保有する技能や資格を表す。';

CREATE TABLE `personnel_specification` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者仕様: 作業者に求められる資格や条件を表す。';

CREATE TABLE `personnel_portion` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者部位: 作業者の身体的または機能的な部位を表す。';

CREATE TABLE `personnel_document` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `file_link` VARCHAR(1000) COMMENT 'ファイル',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者図書: 作業者に関連する教育資料や記録を表す。';

CREATE TABLE `personnel_issue` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `issue_at` DATETIME COMMENT '事象日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者事象: 作業者に関連する問題や事故を表す。';

CREATE TABLE `personnel_countermeasure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_issue_id` VARCHAR(36) COMMENT '作業者事象ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `note` VARCHAR(1000) COMMENT '摘要',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業者対策: 作業者事象に対する改善や対策を表す。';

CREATE TABLE `work_process` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業工程: 人作業として定義された工程を表す。';

CREATE TABLE `work_operation` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `work_process_id` VARCHAR(36) COMMENT '作業工程ID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `work_hours` DECIMAL(18,4) COMMENT '生産工数',
  `work_days` DECIMAL(18,4) COMMENT '生産日数',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業手順: 作業工程を実行する具体的な手順を表す。';

CREATE TABLE `work_content` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `work_operation_id` VARCHAR(36) COMMENT '作業手順ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業内容: 作業手順を構成する詳細な作業項目を表す。';

CREATE TABLE `work_assignment` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `work_operation_id` VARCHAR(36) COMMENT '作業手順ID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業割当: 作業指示に対するリソース割当を表す。';

CREATE TABLE `work_capacity` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `maximum_value` DECIMAL(18,4) COMMENT '最大値',
  `minimum_value` DECIMAL(18,4) COMMENT '最小値',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業能力: 作業者または作業班の能力を表す。';

CREATE TABLE `work_order` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `work_process_id` VARCHAR(36) COMMENT '作業工程ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `due_at` DATETIME COMMENT '納期',
  `release_at` DATETIME COMMENT '発行日時',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業オーダ: 作業者に対する作業要求を表す。';

CREATE TABLE `work_schedule` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `work_order_id` VARCHAR(36) COMMENT '作業オーダID',
  `work_operation_id` VARCHAR(36) COMMENT '作業手順ID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `personnel_id` VARCHAR(36) COMMENT '作業者ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '予定数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業指示: 作業オーダに基づく実行指示を表す。';

CREATE TABLE `work_performance` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `work_process_id` VARCHAR(36) COMMENT '作業オーダID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `time` DECIMAL(18,4) COMMENT '時間',
  `time_unit` VARCHAR(100) COMMENT '時間単位',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業実績: 作業者または作業班の実績を表す。';

CREATE TABLE `work_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `work_schedule_id` VARCHAR(36) COMMENT '作業指示ID',
  `work_content_id` VARCHAR(36) COMMENT '作業項目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作業結果: 作業の実行結果を表す。';

CREATE TABLE `inventory_item` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `production_line_id` VARCHAR(36) COMMENT '生産ラインID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `lead_time` DECIMAL(18,4) COMMENT '日数',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫品目: 在庫場所ごとの管理品目を表す。';

CREATE TABLE `inventory_capacity` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `maximum_value` DECIMAL(18,4) COMMENT '最大値',
  `minimum_value` DECIMAL(18,4) COMMENT '最小値',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫能力: 在庫場所の保管能力を表す。';

CREATE TABLE `inventory_order` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `production_order_id` VARCHAR(36) COMMENT '生産オーダID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `due_at` DATETIME COMMENT '納期',
  `release_at` DATETIME COMMENT '発行日時',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫オーダ: 在庫品目の移動・補充オーダを表す。';

CREATE TABLE `inventory_schedule` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `inventory_transfer_id` VARCHAR(36) COMMENT '在庫移動ID',
  `inventory_order_id` VARCHAR(36) COMMENT '在庫オーダID',
  `from_inventory_item_id` VARCHAR(36) COMMENT '移動元在庫品目ID',
  `to_inventory_item_id` VARCHAR(36) COMMENT '移動先在庫品目ID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '予定数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫指示: 在庫品目の移動・補充指示を表す。';

CREATE TABLE `inventory_transfer` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `inventory_item_id` VARCHAR(36) COMMENT '在庫品目ID',
  `equipment_group_id` VARCHAR(36) COMMENT '設備グループID',
  `personnel_group_id` VARCHAR(36) COMMENT '作業者グループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `time` DECIMAL(18,4) COMMENT '時間',
  `time_unit` VARCHAR(100) COMMENT '時間単位',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫移動: 在庫品目の数量増減結果を表す。';

CREATE TABLE `inventory_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `inventory_item_id` VARCHAR(36) COMMENT '在庫品目ID',
  `inventory_schedule_id` VARCHAR(36) COMMENT '在庫指示ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在庫数量: ある時点における在庫数量を表す。';

CREATE TABLE `energy` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_group_id` VARCHAR(36) COMMENT 'エネルギグループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ: 生産活動に必要なエネルギを表す。';

CREATE TABLE `energy_group` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギグループ: エネルギ源の分類単位を表す。';

CREATE TABLE `energy_structure` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_id` VARCHAR(36) COMMENT 'エネルギID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ構成: エネルギ供給の構成関係を表す。';

CREATE TABLE `energy_function` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_id` VARCHAR(36) COMMENT 'エネルギID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ機能: エネルギがもつ機能を表す。';

CREATE TABLE `energy_specification` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_id` VARCHAR(36) COMMENT 'エネルギID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ仕様: エネルギに求められる仕様条件を表す。';

CREATE TABLE `energy_node` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_id` VARCHAR(36) COMMENT 'エネルギID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ接点: エネルギの供給・消費の接続点を表す。';

CREATE TABLE `energy_capacity` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `site_id` VARCHAR(36) COMMENT 'サイトID',
  `term_id` VARCHAR(36) COMMENT 'タームID',
  `energy_group_id` VARCHAR(36) COMMENT 'エネルギグループID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `maximum_value` DECIMAL(18,4) COMMENT '最大値',
  `minimum_value` DECIMAL(18,4) COMMENT '最小値',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ能力: 共有可能なエネルギ供給能力を表す。';

CREATE TABLE `energy_order` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_node_id` VARCHAR(36) COMMENT 'エネルギ接点ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `due_at` DATETIME COMMENT '納期',
  `release_at` DATETIME COMMENT '発行日時',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギオーダ: エネルギの供給・消費オーダを表す。';

CREATE TABLE `energy_schedule` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_order_id` VARCHAR(36) COMMENT 'エネルギオーダID',
  `index_no` DECIMAL(18,4) COMMENT '追番',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `planned_value` DECIMAL(18,4) COMMENT '予定数量',
  `actual_value` DECIMAL(18,4) COMMENT '実績数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ指示: エネルギの供給・消費指示を表す。';

CREATE TABLE `energy_performance` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_node_id` VARCHAR(36) COMMENT 'エネルギ接点ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `time` DECIMAL(18,4) COMMENT '時間',
  `time_unit` VARCHAR(100) COMMENT '時間単位',
  `start_at` DATETIME COMMENT '開始日時',
  `end_at` DATETIME COMMENT '終了日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ実績: エネルギの供給・消費実績を表す。';

CREATE TABLE `energy_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `energy_schedule_id` VARCHAR(36) COMMENT 'エネルギ指示ID',
  `equipment_id` VARCHAR(36) COMMENT '設備ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='エネルギ結果: エネルギ接点ごとの記録結果を表す。';

CREATE TABLE `customer` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='得意先: 販売品目を提供する相手の事業者を表す。';

CREATE TABLE `sales_item` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `customer_id` VARCHAR(36) COMMENT '得意先ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `lead_time` DECIMAL(18,4) COMMENT '日数',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='販売品目: 得意先に提供される生産品目を表す。';

CREATE TABLE `sales_document` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `customer_id` VARCHAR(36) COMMENT '得意先ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `due_at` DATETIME COMMENT '納期',
  `order_at` DATETIME COMMENT '発注日時',
  `receiving_at` DATETIME COMMENT '入荷日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='受注伝票: 得意先からの注文の管理単位を表す。';

CREATE TABLE `sales_order` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `sales_document_id` VARCHAR(36) COMMENT '販売伝票ID',
  `sales_item_id` VARCHAR(36) COMMENT '販売品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `due_at` DATETIME COMMENT '納期',
  `release_at` DATETIME COMMENT '発行日時',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='受注明細: 販売品目ごとの受注内容を表す。';

CREATE TABLE `sales_specification` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `sales_item_id` VARCHAR(36) COMMENT '販売品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='販売仕様: 得意先ごとの販売条件・仕様を表す。';

CREATE TABLE `sales_invoice` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `customer_id` VARCHAR(36) COMMENT '得意先ID',
  `shipping_result_id` VARCHAR(36) COMMENT '出荷実績ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `invoice_at` DATETIME COMMENT '請求日時',
  `payment_at` DATETIME COMMENT '支払日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='販売請求: 得意先に発行する請求情報を表す。';

CREATE TABLE `sales_forecast` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `sales_item_id` VARCHAR(36) COMMENT '販売品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `forecast_at` DATETIME COMMENT '内示日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='受注内示: 得意先からの需要予測情報を表す。';

CREATE TABLE `sales_quotation` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `customer_id` VARCHAR(36) COMMENT '得意先ID',
  `sales_item_id` VARCHAR(36) COMMENT '販売品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `due_at` DATETIME COMMENT '納期',
  `quotation_at` DATETIME COMMENT '見積日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='販売見積: 得意先への見積依頼と回答を表す。';

CREATE TABLE `shipping_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `sales_order_id` VARCHAR(36) COMMENT '販売オーダID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='出荷明細: 販売品目の出荷結果を表す。';

CREATE TABLE `supplier` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仕入先: 資材・部品を調達する相手の事業者を表す。';

CREATE TABLE `purchase_item` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `production_item_id` VARCHAR(36) COMMENT '生産品目ID',
  `supplier_id` VARCHAR(36) COMMENT '仕入先ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `lead_time` DECIMAL(18,4) COMMENT '日数',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購買品目: 仕入先から提供される生産品目を表す。';

CREATE TABLE `purchase_document` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `supplier_id` VARCHAR(36) COMMENT '仕入先ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `due_at` DATETIME COMMENT '納期',
  `order_at` DATETIME COMMENT '発注日時',
  `receiving_at` DATETIME COMMENT '入荷日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購買伝票: 仕入先への注文の管理単位を表す。';

CREATE TABLE `purchase_order` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `purchase_document_id` VARCHAR(36) COMMENT '購買伝票ID',
  `purchase_item_id` VARCHAR(36) COMMENT '購買品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `due_at` DATETIME COMMENT '納期',
  `release_at` DATETIME COMMENT '発行日時',
  `start_at` DATETIME COMMENT '着手日時',
  `end_at` DATETIME COMMENT '完了日時',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購買明細: 仕入先への個々の注文内容を表す。';

CREATE TABLE `purchase_specification` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `purchase_item_id` VARCHAR(36) COMMENT '購買品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購買仕様: 仕入先ごとの購買条件・仕様を表す。';

CREATE TABLE `purchase_invoice` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `supplier_id` VARCHAR(36) COMMENT '仕入先ID',
  `receiving_result_id` VARCHAR(36) COMMENT '入荷実績ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `invoice_at` DATETIME COMMENT '請求日時',
  `payment_at` DATETIME COMMENT '支払日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購買請求: 仕入先から受け取る請求情報を表す。';

CREATE TABLE `purchase_forecast` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `purchase_item_id` VARCHAR(36) COMMENT '購買品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `forecast_at` DATETIME COMMENT '内示日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仕入内示: 仕入先への仕入予測通知を表す。';

CREATE TABLE `purchase_quotation` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `supplier_id` VARCHAR(36) COMMENT '仕入先ID',
  `purchase_item_id` VARCHAR(36) COMMENT '購買品目ID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `unit_price` DECIMAL(18,4) COMMENT '単価',
  `price` DECIMAL(18,4) COMMENT '金額',
  `due_at` DATETIME COMMENT '納期',
  `quotation_at` DATETIME COMMENT '見積日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購買見積: 仕入先への見積依頼と回答を表す。';

CREATE TABLE `receiving_result` (
  `id` VARCHAR(36) PRIMARY KEY COMMENT 'ID',
  `name` VARCHAR(100) COMMENT '名称',
  `category` VARCHAR(100) COMMENT '分類',
  `status` VARCHAR(100) COMMENT '状態',
  `description` VARCHAR(1000) COMMENT '説明',
  `purchase_order_id` VARCHAR(36) COMMENT '購買オーダID',
  `specification` VARCHAR(1000) COMMENT '仕様',
  `value` DECIMAL(18,4) COMMENT '数量',
  `unit` VARCHAR(100) COMMENT '単位',
  `location` VARCHAR(100) COMMENT '場所',
  `result_at` DATETIME COMMENT '結果日時',
  `created_at` DATETIME COMMENT '登録日時',
  `updated_at` DATETIME COMMENT '更新日時',
  `created_by` VARCHAR(100) COMMENT '作成者',
  `approved_by` VARCHAR(100) COMMENT '承認者',
  `remark` VARCHAR(1000) COMMENT '備考'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='入荷明細: 購買品目の入荷結果を表す。';

ALTER TABLE `area` ADD CONSTRAINT `fk_area_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `site` ADD CONSTRAINT `fk_site_enterprise_id` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`id`);

ALTER TABLE `production_line` ADD CONSTRAINT `fk_production_line_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`);

ALTER TABLE `calendar` ADD CONSTRAINT `fk_calendar_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `term` ADD CONSTRAINT `fk_term_calendar_id` FOREIGN KEY (`calendar_id`) REFERENCES `calendar` (`id`);

ALTER TABLE `production_plan` ADD CONSTRAINT `fk_production_plan_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `production_plan` ADD CONSTRAINT `fk_production_plan_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `production_plan` ADD CONSTRAINT `fk_production_plan_production_item_group_id` FOREIGN KEY (`production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `capacity_plan` ADD CONSTRAINT `fk_capacity_plan_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `capacity_plan` ADD CONSTRAINT `fk_capacity_plan_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `capacity_plan` ADD CONSTRAINT `fk_capacity_plan_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `capacity_plan` ADD CONSTRAINT `fk_capacity_plan_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `sales_plan` ADD CONSTRAINT `fk_sales_plan_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `sales_plan` ADD CONSTRAINT `fk_sales_plan_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `sales_plan` ADD CONSTRAINT `fk_sales_plan_production_item_group_id` FOREIGN KEY (`production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `purchase_plan` ADD CONSTRAINT `fk_purchase_plan_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `purchase_plan` ADD CONSTRAINT `fk_purchase_plan_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `purchase_plan` ADD CONSTRAINT `fk_purchase_plan_production_item_group_id` FOREIGN KEY (`production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `asset` ADD CONSTRAINT `fk_asset_asset_group_id` FOREIGN KEY (`asset_group_id`) REFERENCES `asset_group` (`id`);

ALTER TABLE `asset_structure` ADD CONSTRAINT `fk_asset_structure_parent_asset_group_id` FOREIGN KEY (`parent_asset_group_id`) REFERENCES `asset_group` (`id`);

ALTER TABLE `asset_structure` ADD CONSTRAINT `fk_asset_structure_child_asset_group_id` FOREIGN KEY (`child_asset_group_id`) REFERENCES `asset_group` (`id`);

ALTER TABLE `asset_structure` ADD CONSTRAINT `fk_asset_structure_parent_asset_id` FOREIGN KEY (`parent_asset_id`) REFERENCES `asset` (`id`);

ALTER TABLE `asset_structure` ADD CONSTRAINT `fk_asset_structure_child_asset_id` FOREIGN KEY (`child_asset_id`) REFERENCES `asset` (`id`);

ALTER TABLE `asset_specification` ADD CONSTRAINT `fk_asset_specification_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`);

ALTER TABLE `monitoring_content` ADD CONSTRAINT `fk_monitoring_content_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`);

ALTER TABLE `monitoring_result` ADD CONSTRAINT `fk_monitoring_result_monitoring_content_id` FOREIGN KEY (`monitoring_content_id`) REFERENCES `monitoring_content` (`id`);

ALTER TABLE `monitoring_result` ADD CONSTRAINT `fk_monitoring_result_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `production_item` ADD CONSTRAINT `fk_production_item_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`);

ALTER TABLE `production_item` ADD CONSTRAINT `fk_production_item_production_item_group_id` FOREIGN KEY (`production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `production_item` ADD CONSTRAINT `fk_production_item_production_process_id` FOREIGN KEY (`production_process_id`) REFERENCES `production_process` (`id`);

ALTER TABLE `production_item_structure` ADD CONSTRAINT `fk_production_item_structure_parent_production_item_group_id` FOREIGN KEY (`parent_production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `production_item_structure` ADD CONSTRAINT `fk_production_item_structure_child_production_item_group_id` FOREIGN KEY (`child_production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `production_item_structure` ADD CONSTRAINT `fk_production_item_structure_parent_production_item_id` FOREIGN KEY (`parent_production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_structure` ADD CONSTRAINT `fk_production_item_structure_child_production_item_id` FOREIGN KEY (`child_production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_function` ADD CONSTRAINT `fk_production_item_function_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_specification` ADD CONSTRAINT `fk_production_item_specification_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_portion` ADD CONSTRAINT `fk_production_item_portion_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_document` ADD CONSTRAINT `fk_production_item_document_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_issue` ADD CONSTRAINT `fk_production_item_issue_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_issue` ADD CONSTRAINT `fk_production_item_issue_production_item_group_id` FOREIGN KEY (`production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `production_item_countermeasure` ADD CONSTRAINT `fk_production_item_countermeasure_production_item_issue_id` FOREIGN KEY (`production_item_issue_id`) REFERENCES `production_item_issue` (`id`);

ALTER TABLE `production_item_result` ADD CONSTRAINT `fk_production_item_result_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_item_result` ADD CONSTRAINT `fk_production_item_result_production_schedule_id` FOREIGN KEY (`production_schedule_id`) REFERENCES `production_schedule` (`id`);

ALTER TABLE `production_process` ADD CONSTRAINT `fk_production_process_production_item_group_id` FOREIGN KEY (`production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `production_operation` ADD CONSTRAINT `fk_production_operation_production_process_id` FOREIGN KEY (`production_process_id`) REFERENCES `production_process` (`id`);

ALTER TABLE `production_operation` ADD CONSTRAINT `fk_production_operation_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `production_operation` ADD CONSTRAINT `fk_production_operation_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `production_content` ADD CONSTRAINT `fk_production_content_production_operation_id` FOREIGN KEY (`production_operation_id`) REFERENCES `production_operation` (`id`);

ALTER TABLE `production_assignment` ADD CONSTRAINT `fk_production_assignment_production_operation_id` FOREIGN KEY (`production_operation_id`) REFERENCES `production_operation` (`id`);

ALTER TABLE `production_assignment` ADD CONSTRAINT `fk_production_assignment_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `production_assignment` ADD CONSTRAINT `fk_production_assignment_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `production_capacity` ADD CONSTRAINT `fk_production_capacity_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `production_capacity` ADD CONSTRAINT `fk_production_capacity_production_item_group_id` FOREIGN KEY (`production_item_group_id`) REFERENCES `production_item_group` (`id`);

ALTER TABLE `production_order` ADD CONSTRAINT `fk_production_order_production_process_id` FOREIGN KEY (`production_process_id`) REFERENCES `production_process` (`id`);

ALTER TABLE `production_order` ADD CONSTRAINT `fk_production_order_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_schedule` ADD CONSTRAINT `fk_production_schedule_production_order_id` FOREIGN KEY (`production_order_id`) REFERENCES `production_order` (`id`);

ALTER TABLE `production_schedule` ADD CONSTRAINT `fk_production_schedule_production_operation_id` FOREIGN KEY (`production_operation_id`) REFERENCES `production_operation` (`id`);

ALTER TABLE `production_schedule` ADD CONSTRAINT `fk_production_schedule_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `production_schedule` ADD CONSTRAINT `fk_production_schedule_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `production_schedule` ADD CONSTRAINT `fk_production_schedule_production_line_id` FOREIGN KEY (`production_line_id`) REFERENCES `production_line` (`id`);

ALTER TABLE `production_schedule` ADD CONSTRAINT `fk_production_schedule_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_performance` ADD CONSTRAINT `fk_production_performance_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `production_performance` ADD CONSTRAINT `fk_production_performance_production_process_id` FOREIGN KEY (`production_process_id`) REFERENCES `production_process` (`id`);

ALTER TABLE `production_result` ADD CONSTRAINT `fk_production_result_production_schedule_id` FOREIGN KEY (`production_schedule_id`) REFERENCES `production_schedule` (`id`);

ALTER TABLE `production_result` ADD CONSTRAINT `fk_production_result_production_content_id` FOREIGN KEY (`production_content_id`) REFERENCES `production_content` (`id`);

ALTER TABLE `production_result` ADD CONSTRAINT `fk_production_result_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `production_result` ADD CONSTRAINT `fk_production_result_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `production_document` ADD CONSTRAINT `fk_production_document_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `production_document` ADD CONSTRAINT `fk_production_document_production_process_id` FOREIGN KEY (`production_process_id`) REFERENCES `production_process` (`id`);

ALTER TABLE `production_issue` ADD CONSTRAINT `fk_production_issue_production_process_id` FOREIGN KEY (`production_process_id`) REFERENCES `production_process` (`id`);

ALTER TABLE `production_issue` ADD CONSTRAINT `fk_production_issue_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `production_issue` ADD CONSTRAINT `fk_production_issue_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `production_countermeasure` ADD CONSTRAINT `fk_production_countermeasure_production_issue_id` FOREIGN KEY (`production_issue_id`) REFERENCES `production_issue` (`id`);

ALTER TABLE `equipment` ADD CONSTRAINT `fk_equipment_production_line_id` FOREIGN KEY (`production_line_id`) REFERENCES `production_line` (`id`);

ALTER TABLE `equipment` ADD CONSTRAINT `fk_equipment_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`);

ALTER TABLE `equipment` ADD CONSTRAINT `fk_equipment_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `equipment` ADD CONSTRAINT `fk_equipment_energy_node_id` FOREIGN KEY (`energy_node_id`) REFERENCES `energy_node` (`id`);

ALTER TABLE `equipment_group` ADD CONSTRAINT `fk_equipment_group_asset_group_id` FOREIGN KEY (`asset_group_id`) REFERENCES `asset_group` (`id`);

ALTER TABLE `equipment_structure` ADD CONSTRAINT `fk_equipment_structure_parent_equipment_group_id` FOREIGN KEY (`parent_equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `equipment_structure` ADD CONSTRAINT `fk_equipment_structure_child_equipment_group_id` FOREIGN KEY (`child_equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `equipment_structure` ADD CONSTRAINT `fk_equipment_structure_parent_equipment_id` FOREIGN KEY (`parent_equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_structure` ADD CONSTRAINT `fk_equipment_structure_child_equipment_id` FOREIGN KEY (`child_equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_function` ADD CONSTRAINT `fk_equipment_function_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_specification` ADD CONSTRAINT `fk_equipment_specification_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_portion` ADD CONSTRAINT `fk_equipment_portion_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_document` ADD CONSTRAINT `fk_equipment_document_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_issue` ADD CONSTRAINT `fk_equipment_issue_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_issue` ADD CONSTRAINT `fk_equipment_issue_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `equipment_countermeasure` ADD CONSTRAINT `fk_equipment_countermeasure_equipment_issue_id` FOREIGN KEY (`equipment_issue_id`) REFERENCES `equipment_issue` (`id`);

ALTER TABLE `equipment_process` ADD CONSTRAINT `fk_equipment_process_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `equipment_operation` ADD CONSTRAINT `fk_equipment_operation_equipment_process_id` FOREIGN KEY (`equipment_process_id`) REFERENCES `equipment_process` (`id`);

ALTER TABLE `equipment_operation` ADD CONSTRAINT `fk_equipment_operation_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `equipment_operation` ADD CONSTRAINT `fk_equipment_operation_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `equipment_content` ADD CONSTRAINT `fk_equipment_content_equipment_operation_id` FOREIGN KEY (`equipment_operation_id`) REFERENCES `equipment_operation` (`id`);

ALTER TABLE `equipment_assignment` ADD CONSTRAINT `fk_equipment_assignment_equipment_operation_id` FOREIGN KEY (`equipment_operation_id`) REFERENCES `equipment_operation` (`id`);

ALTER TABLE `equipment_assignment` ADD CONSTRAINT `fk_equipment_assignment_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_assignment` ADD CONSTRAINT `fk_equipment_assignment_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `equipment_capacity` ADD CONSTRAINT `fk_equipment_capacity_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `equipment_capacity` ADD CONSTRAINT `fk_equipment_capacity_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `equipment_order` ADD CONSTRAINT `fk_equipment_order_equipment_process_id` FOREIGN KEY (`equipment_process_id`) REFERENCES `equipment_process` (`id`);

ALTER TABLE `equipment_schedule` ADD CONSTRAINT `fk_equipment_schedule_equipment_operation_id` FOREIGN KEY (`equipment_operation_id`) REFERENCES `equipment_operation` (`id`);

ALTER TABLE `equipment_schedule` ADD CONSTRAINT `fk_equipment_schedule_equipment_order_id` FOREIGN KEY (`equipment_order_id`) REFERENCES `equipment_order` (`id`);

ALTER TABLE `equipment_schedule` ADD CONSTRAINT `fk_equipment_schedule_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `equipment_schedule` ADD CONSTRAINT `fk_equipment_schedule_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `equipment_performance` ADD CONSTRAINT `fk_equipment_performance_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `equipment_performance` ADD CONSTRAINT `fk_equipment_performance_equipment_process_id` FOREIGN KEY (`equipment_process_id`) REFERENCES `equipment_process` (`id`);

ALTER TABLE `equipment_result` ADD CONSTRAINT `fk_equipment_result_equipment_content_id` FOREIGN KEY (`equipment_content_id`) REFERENCES `equipment_content` (`id`);

ALTER TABLE `equipment_result` ADD CONSTRAINT `fk_equipment_result_equipment_schedule_id` FOREIGN KEY (`equipment_schedule_id`) REFERENCES `equipment_schedule` (`id`);

ALTER TABLE `personnel` ADD CONSTRAINT `fk_personnel_production_line_id` FOREIGN KEY (`production_line_id`) REFERENCES `production_line` (`id`);

ALTER TABLE `personnel` ADD CONSTRAINT `fk_personnel_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`);

ALTER TABLE `personnel` ADD CONSTRAINT `fk_personnel_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `personnel_group` ADD CONSTRAINT `fk_personnel_group_asset_group_id` FOREIGN KEY (`asset_group_id`) REFERENCES `asset_group` (`id`);

ALTER TABLE `personnel_structure` ADD CONSTRAINT `fk_personnel_structure_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `personnel_structure` ADD CONSTRAINT `fk_personnel_structure_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `personnel_skill` ADD CONSTRAINT `fk_personnel_skill_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `personnel_specification` ADD CONSTRAINT `fk_personnel_specification_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `personnel_portion` ADD CONSTRAINT `fk_personnel_portion_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `personnel_document` ADD CONSTRAINT `fk_personnel_document_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `personnel_issue` ADD CONSTRAINT `fk_personnel_issue_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `personnel_issue` ADD CONSTRAINT `fk_personnel_issue_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `personnel_countermeasure` ADD CONSTRAINT `fk_personnel_countermeasure_personnel_issue_id` FOREIGN KEY (`personnel_issue_id`) REFERENCES `personnel_issue` (`id`);

ALTER TABLE `work_process` ADD CONSTRAINT `fk_work_process_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `work_operation` ADD CONSTRAINT `fk_work_operation_work_process_id` FOREIGN KEY (`work_process_id`) REFERENCES `work_process` (`id`);

ALTER TABLE `work_operation` ADD CONSTRAINT `fk_work_operation_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `work_operation` ADD CONSTRAINT `fk_work_operation_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `work_content` ADD CONSTRAINT `fk_work_content_work_operation_id` FOREIGN KEY (`work_operation_id`) REFERENCES `work_operation` (`id`);

ALTER TABLE `work_assignment` ADD CONSTRAINT `fk_work_assignment_work_operation_id` FOREIGN KEY (`work_operation_id`) REFERENCES `work_operation` (`id`);

ALTER TABLE `work_assignment` ADD CONSTRAINT `fk_work_assignment_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `work_assignment` ADD CONSTRAINT `fk_work_assignment_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `work_capacity` ADD CONSTRAINT `fk_work_capacity_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `work_capacity` ADD CONSTRAINT `fk_work_capacity_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `work_capacity` ADD CONSTRAINT `fk_work_capacity_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `work_order` ADD CONSTRAINT `fk_work_order_work_process_id` FOREIGN KEY (`work_process_id`) REFERENCES `work_process` (`id`);

ALTER TABLE `work_schedule` ADD CONSTRAINT `fk_work_schedule_work_order_id` FOREIGN KEY (`work_order_id`) REFERENCES `work_order` (`id`);

ALTER TABLE `work_schedule` ADD CONSTRAINT `fk_work_schedule_work_operation_id` FOREIGN KEY (`work_operation_id`) REFERENCES `work_operation` (`id`);

ALTER TABLE `work_schedule` ADD CONSTRAINT `fk_work_schedule_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `work_schedule` ADD CONSTRAINT `fk_work_schedule_personnel_id` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`id`);

ALTER TABLE `work_performance` ADD CONSTRAINT `fk_work_performance_work_process_id` FOREIGN KEY (`work_process_id`) REFERENCES `work_process` (`id`);

ALTER TABLE `work_performance` ADD CONSTRAINT `fk_work_performance_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `work_result` ADD CONSTRAINT `fk_work_result_work_schedule_id` FOREIGN KEY (`work_schedule_id`) REFERENCES `work_schedule` (`id`);

ALTER TABLE `work_result` ADD CONSTRAINT `fk_work_result_work_content_id` FOREIGN KEY (`work_content_id`) REFERENCES `work_content` (`id`);

ALTER TABLE `inventory_item` ADD CONSTRAINT `fk_inventory_item_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `inventory_item` ADD CONSTRAINT `fk_inventory_item_production_line_id` FOREIGN KEY (`production_line_id`) REFERENCES `production_line` (`id`);

ALTER TABLE `inventory_capacity` ADD CONSTRAINT `fk_inventory_capacity_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `inventory_capacity` ADD CONSTRAINT `fk_inventory_capacity_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `inventory_capacity` ADD CONSTRAINT `fk_inventory_capacity_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `inventory_order` ADD CONSTRAINT `fk_inventory_order_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `inventory_order` ADD CONSTRAINT `fk_inventory_order_production_order_id` FOREIGN KEY (`production_order_id`) REFERENCES `production_order` (`id`);

ALTER TABLE `inventory_schedule` ADD CONSTRAINT `fk_inventory_schedule_inventory_transfer_id` FOREIGN KEY (`inventory_transfer_id`) REFERENCES `inventory_transfer` (`id`);

ALTER TABLE `inventory_schedule` ADD CONSTRAINT `fk_inventory_schedule_inventory_order_id` FOREIGN KEY (`inventory_order_id`) REFERENCES `inventory_order` (`id`);

ALTER TABLE `inventory_schedule` ADD CONSTRAINT `fk_inventory_schedule_from_inventory_item_id` FOREIGN KEY (`from_inventory_item_id`) REFERENCES `inventory_item` (`id`);

ALTER TABLE `inventory_schedule` ADD CONSTRAINT `fk_inventory_schedule_to_inventory_item_id` FOREIGN KEY (`to_inventory_item_id`) REFERENCES `inventory_item` (`id`);

ALTER TABLE `inventory_transfer` ADD CONSTRAINT `fk_inventory_transfer_inventory_item_id` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_item` (`id`);

ALTER TABLE `inventory_transfer` ADD CONSTRAINT `fk_inventory_transfer_equipment_group_id` FOREIGN KEY (`equipment_group_id`) REFERENCES `equipment_group` (`id`);

ALTER TABLE `inventory_transfer` ADD CONSTRAINT `fk_inventory_transfer_personnel_group_id` FOREIGN KEY (`personnel_group_id`) REFERENCES `personnel_group` (`id`);

ALTER TABLE `inventory_result` ADD CONSTRAINT `fk_inventory_result_inventory_item_id` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_item` (`id`);

ALTER TABLE `inventory_result` ADD CONSTRAINT `fk_inventory_result_inventory_schedule_id` FOREIGN KEY (`inventory_schedule_id`) REFERENCES `inventory_schedule` (`id`);

ALTER TABLE `energy` ADD CONSTRAINT `fk_energy_energy_group_id` FOREIGN KEY (`energy_group_id`) REFERENCES `energy_group` (`id`);

ALTER TABLE `energy_structure` ADD CONSTRAINT `fk_energy_structure_energy_id` FOREIGN KEY (`energy_id`) REFERENCES `energy` (`id`);

ALTER TABLE `energy_function` ADD CONSTRAINT `fk_energy_function_energy_id` FOREIGN KEY (`energy_id`) REFERENCES `energy` (`id`);

ALTER TABLE `energy_specification` ADD CONSTRAINT `fk_energy_specification_energy_id` FOREIGN KEY (`energy_id`) REFERENCES `energy` (`id`);

ALTER TABLE `energy_node` ADD CONSTRAINT `fk_energy_node_energy_id` FOREIGN KEY (`energy_id`) REFERENCES `energy` (`id`);

ALTER TABLE `energy_capacity` ADD CONSTRAINT `fk_energy_capacity_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

ALTER TABLE `energy_capacity` ADD CONSTRAINT `fk_energy_capacity_term_id` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`);

ALTER TABLE `energy_capacity` ADD CONSTRAINT `fk_energy_capacity_energy_group_id` FOREIGN KEY (`energy_group_id`) REFERENCES `energy_group` (`id`);

ALTER TABLE `energy_order` ADD CONSTRAINT `fk_energy_order_energy_node_id` FOREIGN KEY (`energy_node_id`) REFERENCES `energy_node` (`id`);

ALTER TABLE `energy_schedule` ADD CONSTRAINT `fk_energy_schedule_energy_order_id` FOREIGN KEY (`energy_order_id`) REFERENCES `energy_order` (`id`);

ALTER TABLE `energy_performance` ADD CONSTRAINT `fk_energy_performance_energy_node_id` FOREIGN KEY (`energy_node_id`) REFERENCES `energy_node` (`id`);

ALTER TABLE `energy_result` ADD CONSTRAINT `fk_energy_result_energy_schedule_id` FOREIGN KEY (`energy_schedule_id`) REFERENCES `energy_schedule` (`id`);

ALTER TABLE `energy_result` ADD CONSTRAINT `fk_energy_result_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

ALTER TABLE `sales_item` ADD CONSTRAINT `fk_sales_item_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `sales_item` ADD CONSTRAINT `fk_sales_item_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `sales_document` ADD CONSTRAINT `fk_sales_document_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `fk_sales_order_sales_document_id` FOREIGN KEY (`sales_document_id`) REFERENCES `sales_document` (`id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `fk_sales_order_sales_item_id` FOREIGN KEY (`sales_item_id`) REFERENCES `sales_item` (`id`);

ALTER TABLE `sales_specification` ADD CONSTRAINT `fk_sales_specification_sales_item_id` FOREIGN KEY (`sales_item_id`) REFERENCES `sales_item` (`id`);

ALTER TABLE `sales_invoice` ADD CONSTRAINT `fk_sales_invoice_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `sales_invoice` ADD CONSTRAINT `fk_sales_invoice_shipping_result_id` FOREIGN KEY (`shipping_result_id`) REFERENCES `shipping_result` (`id`);

ALTER TABLE `sales_forecast` ADD CONSTRAINT `fk_sales_forecast_sales_item_id` FOREIGN KEY (`sales_item_id`) REFERENCES `sales_item` (`id`);

ALTER TABLE `sales_quotation` ADD CONSTRAINT `fk_sales_quotation_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `sales_quotation` ADD CONSTRAINT `fk_sales_quotation_sales_item_id` FOREIGN KEY (`sales_item_id`) REFERENCES `sales_item` (`id`);

ALTER TABLE `shipping_result` ADD CONSTRAINT `fk_shipping_result_sales_order_id` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_order` (`id`);

ALTER TABLE `purchase_item` ADD CONSTRAINT `fk_purchase_item_production_item_id` FOREIGN KEY (`production_item_id`) REFERENCES `production_item` (`id`);

ALTER TABLE `purchase_item` ADD CONSTRAINT `fk_purchase_item_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

ALTER TABLE `purchase_document` ADD CONSTRAINT `fk_purchase_document_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

ALTER TABLE `purchase_order` ADD CONSTRAINT `fk_purchase_order_purchase_document_id` FOREIGN KEY (`purchase_document_id`) REFERENCES `purchase_document` (`id`);

ALTER TABLE `purchase_order` ADD CONSTRAINT `fk_purchase_order_purchase_item_id` FOREIGN KEY (`purchase_item_id`) REFERENCES `purchase_item` (`id`);

ALTER TABLE `purchase_specification` ADD CONSTRAINT `fk_purchase_specification_purchase_item_id` FOREIGN KEY (`purchase_item_id`) REFERENCES `purchase_item` (`id`);

ALTER TABLE `purchase_invoice` ADD CONSTRAINT `fk_purchase_invoice_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

ALTER TABLE `purchase_invoice` ADD CONSTRAINT `fk_purchase_invoice_receiving_result_id` FOREIGN KEY (`receiving_result_id`) REFERENCES `receiving_result` (`id`);

ALTER TABLE `purchase_forecast` ADD CONSTRAINT `fk_purchase_forecast_purchase_item_id` FOREIGN KEY (`purchase_item_id`) REFERENCES `purchase_item` (`id`);

ALTER TABLE `purchase_quotation` ADD CONSTRAINT `fk_purchase_quotation_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

ALTER TABLE `purchase_quotation` ADD CONSTRAINT `fk_purchase_quotation_purchase_item_id` FOREIGN KEY (`purchase_item_id`) REFERENCES `purchase_item` (`id`);

ALTER TABLE `receiving_result` ADD CONSTRAINT `fk_receiving_result_purchase_order_id` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`);
