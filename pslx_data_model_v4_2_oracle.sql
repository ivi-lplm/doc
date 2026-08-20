-- PSLX Data Model 4.2.01 -- Oracle Database DDL
-- Generated from pslx_data_models_v4_2.dbml
--
-- Notes:
--   - VARCHAR2 lengths use the CHAR modifier so multi-byte
--     (Japanese) data is not truncated regardless of the
--     database's NLS_LENGTH_SEMANTICS setting.
--   - FK constraint names use a short sequential form (fk_NNN)
--     rather than fk_<table>_<column>, because several tables
--     in this model have long names (e.g. production_item_structure)
--     whose descriptive FK names would exceed the 30-byte
--     identifier limit on Oracle releases prior to 12.2.
--   - An index (ix_NNN) is created on every FK column, since
--     Oracle does not do this automatically and un-indexed FK
--     columns can cause locking and join-performance issues.

-- 事業者: 自社および取引先となる企業を表す。
CREATE TABLE enterprise (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_enterprise PRIMARY KEY (id)
);
COMMENT ON COLUMN enterprise.id IS 'ID';
COMMENT ON COLUMN enterprise.name IS '名称';
COMMENT ON COLUMN enterprise.category IS '分類';
COMMENT ON COLUMN enterprise.status IS '状態';
COMMENT ON COLUMN enterprise.description IS '説明';
COMMENT ON COLUMN enterprise.specification IS '仕様';
COMMENT ON COLUMN enterprise.value IS '数量';
COMMENT ON COLUMN enterprise.unit IS '単位';
COMMENT ON COLUMN enterprise.location IS '場所';
COMMENT ON COLUMN enterprise.created_at IS '登録日時';
COMMENT ON COLUMN enterprise.updated_at IS '更新日時';
COMMENT ON COLUMN enterprise.created_by IS '作成者';
COMMENT ON COLUMN enterprise.approved_by IS '承認者';
COMMENT ON COLUMN enterprise.remark IS '備考';
COMMENT ON TABLE enterprise IS '事業者: 自社および取引先となる企業を表す。';

-- エリア: サイト内の区画、フロア、または管理単位を表す。
CREATE TABLE area (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_area PRIMARY KEY (id)
);
COMMENT ON COLUMN area.id IS 'ID';
COMMENT ON COLUMN area.name IS '名称';
COMMENT ON COLUMN area.category IS '分類';
COMMENT ON COLUMN area.status IS '状態';
COMMENT ON COLUMN area.description IS '説明';
COMMENT ON COLUMN area.site_id IS 'サイトID';
COMMENT ON COLUMN area.specification IS '仕様';
COMMENT ON COLUMN area.value IS '数量';
COMMENT ON COLUMN area.unit IS '単位';
COMMENT ON COLUMN area.location IS '場所';
COMMENT ON COLUMN area.created_at IS '登録日時';
COMMENT ON COLUMN area.updated_at IS '更新日時';
COMMENT ON COLUMN area.created_by IS '作成者';
COMMENT ON COLUMN area.approved_by IS '承認者';
COMMENT ON COLUMN area.remark IS '備考';
COMMENT ON TABLE area IS 'エリア: サイト内の区画、フロア、または管理単位を表す。';

-- サイト: 生産活動を行う工場や拠点を表す。
CREATE TABLE site (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    enterprise_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_site PRIMARY KEY (id)
);
COMMENT ON COLUMN site.id IS 'ID';
COMMENT ON COLUMN site.name IS '名称';
COMMENT ON COLUMN site.category IS '分類';
COMMENT ON COLUMN site.status IS '状態';
COMMENT ON COLUMN site.description IS '説明';
COMMENT ON COLUMN site.enterprise_id IS '事業者ID';
COMMENT ON COLUMN site.specification IS '仕様';
COMMENT ON COLUMN site.value IS '数量';
COMMENT ON COLUMN site.unit IS '単位';
COMMENT ON COLUMN site.location IS '場所';
COMMENT ON COLUMN site.created_at IS '登録日時';
COMMENT ON COLUMN site.updated_at IS '更新日時';
COMMENT ON COLUMN site.created_by IS '作成者';
COMMENT ON COLUMN site.approved_by IS '承認者';
COMMENT ON COLUMN site.remark IS '備考';
COMMENT ON TABLE site IS 'サイト: 生産活動を行う工場や拠点を表す。';

-- 生産ライン: 生産工程を実行するラインまたは設備群を表す。
CREATE TABLE production_line (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    area_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_line PRIMARY KEY (id)
);
COMMENT ON COLUMN production_line.id IS 'ID';
COMMENT ON COLUMN production_line.name IS '名称';
COMMENT ON COLUMN production_line.category IS '分類';
COMMENT ON COLUMN production_line.status IS '状態';
COMMENT ON COLUMN production_line.description IS '説明';
COMMENT ON COLUMN production_line.area_id IS 'エリアID';
COMMENT ON COLUMN production_line.specification IS '仕様';
COMMENT ON COLUMN production_line.value IS '数量';
COMMENT ON COLUMN production_line.unit IS '単位';
COMMENT ON COLUMN production_line.location IS '場所';
COMMENT ON COLUMN production_line.created_at IS '登録日時';
COMMENT ON COLUMN production_line.updated_at IS '更新日時';
COMMENT ON COLUMN production_line.created_by IS '作成者';
COMMENT ON COLUMN production_line.approved_by IS '承認者';
COMMENT ON COLUMN production_line.remark IS '備考';
COMMENT ON TABLE production_line IS '生産ライン: 生産工程を実行するラインまたは設備群を表す。';

-- カレンダ: 稼働日、休日、シフトなどの操業条件を表す。
CREATE TABLE calendar (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_calendar PRIMARY KEY (id)
);
COMMENT ON COLUMN calendar.id IS 'ID';
COMMENT ON COLUMN calendar.name IS '名称';
COMMENT ON COLUMN calendar.category IS '分類';
COMMENT ON COLUMN calendar.status IS '状態';
COMMENT ON COLUMN calendar.description IS '説明';
COMMENT ON COLUMN calendar.site_id IS 'サイトID';
COMMENT ON COLUMN calendar.specification IS '仕様';
COMMENT ON COLUMN calendar.created_at IS '登録日時';
COMMENT ON COLUMN calendar.updated_at IS '更新日時';
COMMENT ON COLUMN calendar.created_by IS '作成者';
COMMENT ON COLUMN calendar.approved_by IS '承認者';
COMMENT ON COLUMN calendar.remark IS '備考';
COMMENT ON TABLE calendar IS 'カレンダ: 稼働日、休日、シフトなどの操業条件を表す。';

-- ターム: カレンダを構成する時間区間を表す。
CREATE TABLE term (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    calendar_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_term PRIMARY KEY (id)
);
COMMENT ON COLUMN term.id IS 'ID';
COMMENT ON COLUMN term.name IS '名称';
COMMENT ON COLUMN term.category IS '分類';
COMMENT ON COLUMN term.status IS '状態';
COMMENT ON COLUMN term.description IS '説明';
COMMENT ON COLUMN term.calendar_id IS 'カレンダID';
COMMENT ON COLUMN term.index_no IS '追番';
COMMENT ON COLUMN term.specification IS '仕様';
COMMENT ON COLUMN term.value IS '数量';
COMMENT ON COLUMN term.unit IS '単位';
COMMENT ON COLUMN term.start_at IS '開始日時';
COMMENT ON COLUMN term.end_at IS '終了日時';
COMMENT ON COLUMN term.created_at IS '登録日時';
COMMENT ON COLUMN term.updated_at IS '更新日時';
COMMENT ON COLUMN term.created_by IS '作成者';
COMMENT ON COLUMN term.approved_by IS '承認者';
COMMENT ON COLUMN term.remark IS '備考';
COMMENT ON TABLE term IS 'ターム: カレンダを構成する時間区間を表す。';

-- 生産計画: 生産数量や期間に関する計画を表す。
CREATE TABLE production_plan (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    production_item_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_plan PRIMARY KEY (id)
);
COMMENT ON COLUMN production_plan.id IS 'ID';
COMMENT ON COLUMN production_plan.name IS '名称';
COMMENT ON COLUMN production_plan.category IS '分類';
COMMENT ON COLUMN production_plan.status IS '状態';
COMMENT ON COLUMN production_plan.description IS '説明';
COMMENT ON COLUMN production_plan.site_id IS 'サイトID';
COMMENT ON COLUMN production_plan.term_id IS 'タームID';
COMMENT ON COLUMN production_plan.production_item_group_id IS '品目グループID';
COMMENT ON COLUMN production_plan.specification IS '仕様';
COMMENT ON COLUMN production_plan.planned_value IS '計画数量';
COMMENT ON COLUMN production_plan.actual_value IS '実績数量';
COMMENT ON COLUMN production_plan.unit IS '単位';
COMMENT ON COLUMN production_plan.created_at IS '登録日時';
COMMENT ON COLUMN production_plan.updated_at IS '更新日時';
COMMENT ON COLUMN production_plan.created_by IS '作成者';
COMMENT ON COLUMN production_plan.approved_by IS '承認者';
COMMENT ON COLUMN production_plan.remark IS '備考';
COMMENT ON TABLE production_plan IS '生産計画: 生産数量や期間に関する計画を表す。';

-- 能力計画: 生産能力の確保や配分計画を表す。
CREATE TABLE capacity_plan (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_capacity_plan PRIMARY KEY (id)
);
COMMENT ON COLUMN capacity_plan.id IS 'ID';
COMMENT ON COLUMN capacity_plan.name IS '名称';
COMMENT ON COLUMN capacity_plan.category IS '分類';
COMMENT ON COLUMN capacity_plan.status IS '状態';
COMMENT ON COLUMN capacity_plan.description IS '説明';
COMMENT ON COLUMN capacity_plan.site_id IS 'サイトID';
COMMENT ON COLUMN capacity_plan.term_id IS 'タームID';
COMMENT ON COLUMN capacity_plan.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN capacity_plan.specification IS '仕様';
COMMENT ON COLUMN capacity_plan.planned_value IS '計画数量';
COMMENT ON COLUMN capacity_plan.actual_value IS '実績数量';
COMMENT ON COLUMN capacity_plan.unit IS '単位';
COMMENT ON COLUMN capacity_plan.created_at IS '登録日時';
COMMENT ON COLUMN capacity_plan.updated_at IS '更新日時';
COMMENT ON COLUMN capacity_plan.created_by IS '作成者';
COMMENT ON COLUMN capacity_plan.approved_by IS '承認者';
COMMENT ON COLUMN capacity_plan.remark IS '備考';
COMMENT ON TABLE capacity_plan IS '能力計画: 生産能力の確保や配分計画を表す。';

-- 販売計画: 期間ごとの販売目標計画を表す。
CREATE TABLE sales_plan (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_plan PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_plan.id IS 'ID';
COMMENT ON COLUMN sales_plan.name IS '名称';
COMMENT ON COLUMN sales_plan.category IS '分類';
COMMENT ON COLUMN sales_plan.status IS '状態';
COMMENT ON COLUMN sales_plan.description IS '説明';
COMMENT ON COLUMN sales_plan.site_id IS 'サイトID';
COMMENT ON COLUMN sales_plan.term_id IS 'タームID';
COMMENT ON COLUMN sales_plan.specification IS '仕様';
COMMENT ON COLUMN sales_plan.planned_value IS '計画数量';
COMMENT ON COLUMN sales_plan.actual_value IS '実績数量';
COMMENT ON COLUMN sales_plan.unit IS '単位';
COMMENT ON COLUMN sales_plan.created_at IS '登録日時';
COMMENT ON COLUMN sales_plan.updated_at IS '更新日時';
COMMENT ON COLUMN sales_plan.created_by IS '作成者';
COMMENT ON COLUMN sales_plan.approved_by IS '承認者';
COMMENT ON COLUMN sales_plan.remark IS '備考';
COMMENT ON TABLE sales_plan IS '販売計画: 期間ごとの販売目標計画を表す。';

-- 購買計画: 期間ごとの調達目標計画を表す。
CREATE TABLE purchase_plan (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_plan PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_plan.id IS 'ID';
COMMENT ON COLUMN purchase_plan.name IS '名称';
COMMENT ON COLUMN purchase_plan.category IS '分類';
COMMENT ON COLUMN purchase_plan.status IS '状態';
COMMENT ON COLUMN purchase_plan.description IS '説明';
COMMENT ON COLUMN purchase_plan.site_id IS 'サイトID';
COMMENT ON COLUMN purchase_plan.term_id IS 'タームID';
COMMENT ON COLUMN purchase_plan.specification IS '仕様';
COMMENT ON COLUMN purchase_plan.planned_value IS '計画数量';
COMMENT ON COLUMN purchase_plan.actual_value IS '実績数量';
COMMENT ON COLUMN purchase_plan.unit IS '単位';
COMMENT ON COLUMN purchase_plan.created_at IS '登録日時';
COMMENT ON COLUMN purchase_plan.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_plan.created_by IS '作成者';
COMMENT ON COLUMN purchase_plan.approved_by IS '承認者';
COMMENT ON COLUMN purchase_plan.remark IS '備考';
COMMENT ON TABLE purchase_plan IS '購買計画: 期間ごとの調達目標計画を表す。';

-- アセット: 生産活動に関わる資産の共通情報を表す。
CREATE TABLE asset (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    asset_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_asset PRIMARY KEY (id)
);
COMMENT ON COLUMN asset.id IS 'ID';
COMMENT ON COLUMN asset.name IS '名称';
COMMENT ON COLUMN asset.category IS '分類';
COMMENT ON COLUMN asset.status IS '状態';
COMMENT ON COLUMN asset.description IS '説明';
COMMENT ON COLUMN asset.asset_group_id IS 'アセットグループID';
COMMENT ON COLUMN asset.specification IS '仕様';
COMMENT ON COLUMN asset.location IS '場所';
COMMENT ON COLUMN asset.created_at IS '登録日時';
COMMENT ON COLUMN asset.updated_at IS '更新日時';
COMMENT ON COLUMN asset.created_by IS '作成者';
COMMENT ON COLUMN asset.approved_by IS '承認者';
COMMENT ON COLUMN asset.remark IS '備考';
COMMENT ON TABLE asset IS 'アセット: 生産活動に関わる資産の共通情報を表す。';

-- アセットグループ: 共通属性をもつアセットの分類単位を表す。
CREATE TABLE asset_group (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_asset_group PRIMARY KEY (id)
);
COMMENT ON COLUMN asset_group.id IS 'ID';
COMMENT ON COLUMN asset_group.name IS '名称';
COMMENT ON COLUMN asset_group.category IS '分類';
COMMENT ON COLUMN asset_group.status IS '状態';
COMMENT ON COLUMN asset_group.description IS '説明';
COMMENT ON COLUMN asset_group.specification IS '仕様';
COMMENT ON COLUMN asset_group.value IS '数量';
COMMENT ON COLUMN asset_group.unit IS '単位';
COMMENT ON COLUMN asset_group.created_at IS '登録日時';
COMMENT ON COLUMN asset_group.updated_at IS '更新日時';
COMMENT ON COLUMN asset_group.created_by IS '作成者';
COMMENT ON COLUMN asset_group.approved_by IS '承認者';
COMMENT ON COLUMN asset_group.remark IS '備考';
COMMENT ON TABLE asset_group IS 'アセットグループ: 共通属性をもつアセットの分類単位を表す。';

-- アセット構成: アセット間の構成関係や階層構造を表す。
CREATE TABLE asset_structure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    parent_asset_group_id VARCHAR2(50 CHAR) NULL,
    child_asset_group_id VARCHAR2(50 CHAR) NULL,
    parent_asset_id VARCHAR2(50 CHAR) NULL,
    child_asset_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_asset_structure PRIMARY KEY (id)
);
COMMENT ON COLUMN asset_structure.id IS 'ID';
COMMENT ON COLUMN asset_structure.name IS '名称';
COMMENT ON COLUMN asset_structure.category IS '分類';
COMMENT ON COLUMN asset_structure.status IS '状態';
COMMENT ON COLUMN asset_structure.description IS '説明';
COMMENT ON COLUMN asset_structure.parent_asset_group_id IS '親アセットグループID';
COMMENT ON COLUMN asset_structure.child_asset_group_id IS '子アセットグループID';
COMMENT ON COLUMN asset_structure.parent_asset_id IS '親アセットID';
COMMENT ON COLUMN asset_structure.child_asset_id IS '子アセットID';
COMMENT ON COLUMN asset_structure.specification IS '仕様';
COMMENT ON COLUMN asset_structure.value IS '数量';
COMMENT ON COLUMN asset_structure.unit IS '単位';
COMMENT ON COLUMN asset_structure.created_at IS '登録日時';
COMMENT ON COLUMN asset_structure.updated_at IS '更新日時';
COMMENT ON COLUMN asset_structure.created_by IS '作成者';
COMMENT ON COLUMN asset_structure.approved_by IS '承認者';
COMMENT ON COLUMN asset_structure.remark IS '備考';
COMMENT ON TABLE asset_structure IS 'アセット構成: アセット間の構成関係や階層構造を表す。';

-- アセット仕様: アセットに求められる仕様や性能条件を表す。
CREATE TABLE asset_specification (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    asset_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_asset_specification PRIMARY KEY (id)
);
COMMENT ON COLUMN asset_specification.id IS 'ID';
COMMENT ON COLUMN asset_specification.name IS '名称';
COMMENT ON COLUMN asset_specification.category IS '分類';
COMMENT ON COLUMN asset_specification.status IS '状態';
COMMENT ON COLUMN asset_specification.description IS '説明';
COMMENT ON COLUMN asset_specification.asset_id IS 'アセットID';
COMMENT ON COLUMN asset_specification.specification IS '仕様';
COMMENT ON COLUMN asset_specification.value IS '数量';
COMMENT ON COLUMN asset_specification.unit IS '単位';
COMMENT ON COLUMN asset_specification.created_at IS '登録日時';
COMMENT ON COLUMN asset_specification.updated_at IS '更新日時';
COMMENT ON COLUMN asset_specification.created_by IS '作成者';
COMMENT ON COLUMN asset_specification.approved_by IS '承認者';
COMMENT ON COLUMN asset_specification.remark IS '備考';
COMMENT ON TABLE asset_specification IS 'アセット仕様: アセットに求められる仕様や性能条件を表す。';

-- 監視内容: 設備や工程で監視する対象項目を表す。
CREATE TABLE monitoring_content (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    asset_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_monitoring_content PRIMARY KEY (id)
);
COMMENT ON COLUMN monitoring_content.id IS 'ID';
COMMENT ON COLUMN monitoring_content.name IS '名称';
COMMENT ON COLUMN monitoring_content.category IS '分類';
COMMENT ON COLUMN monitoring_content.status IS '状態';
COMMENT ON COLUMN monitoring_content.description IS '説明';
COMMENT ON COLUMN monitoring_content.asset_id IS 'アセットID';
COMMENT ON COLUMN monitoring_content.specification IS '仕様';
COMMENT ON COLUMN monitoring_content.value IS '数量';
COMMENT ON COLUMN monitoring_content.unit IS '単位';
COMMENT ON COLUMN monitoring_content.created_at IS '登録日時';
COMMENT ON COLUMN monitoring_content.updated_at IS '更新日時';
COMMENT ON COLUMN monitoring_content.created_by IS '作成者';
COMMENT ON COLUMN monitoring_content.approved_by IS '承認者';
COMMENT ON COLUMN monitoring_content.remark IS '備考';
COMMENT ON TABLE monitoring_content IS '監視内容: 設備や工程で監視する対象項目を表す。';

-- 監視結果: 監視項目に対する実測値や状態結果を表す。
CREATE TABLE monitoring_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    monitoring_content_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_monitoring_result PRIMARY KEY (id)
);
COMMENT ON COLUMN monitoring_result.id IS 'ID';
COMMENT ON COLUMN monitoring_result.name IS '名称';
COMMENT ON COLUMN monitoring_result.category IS '分類';
COMMENT ON COLUMN monitoring_result.status IS '状態';
COMMENT ON COLUMN monitoring_result.description IS '説明';
COMMENT ON COLUMN monitoring_result.monitoring_content_id IS '監視内容ID';
COMMENT ON COLUMN monitoring_result.term_id IS 'タームID';
COMMENT ON COLUMN monitoring_result.specification IS '仕様';
COMMENT ON COLUMN monitoring_result.value IS '数量';
COMMENT ON COLUMN monitoring_result.unit IS '単位';
COMMENT ON COLUMN monitoring_result.location IS '場所';
COMMENT ON COLUMN monitoring_result.result_at IS '結果日時';
COMMENT ON COLUMN monitoring_result.created_at IS '登録日時';
COMMENT ON COLUMN monitoring_result.updated_at IS '更新日時';
COMMENT ON COLUMN monitoring_result.created_by IS '作成者';
COMMENT ON COLUMN monitoring_result.approved_by IS '承認者';
COMMENT ON COLUMN monitoring_result.remark IS '備考';
COMMENT ON TABLE monitoring_result IS '監視結果: 監視項目に対する実測値や状態結果を表す。';

-- 生産品目: 生産対象となる製品、部品、材料を表す。
CREATE TABLE production_item (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    asset_id VARCHAR2(50 CHAR) NULL,
    production_item_group_id VARCHAR2(50 CHAR) NULL,
    production_process_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item.id IS 'ID';
COMMENT ON COLUMN production_item.name IS '名称';
COMMENT ON COLUMN production_item.category IS '分類';
COMMENT ON COLUMN production_item.status IS '状態';
COMMENT ON COLUMN production_item.description IS '説明';
COMMENT ON COLUMN production_item.asset_id IS 'アセットID';
COMMENT ON COLUMN production_item.production_item_group_id IS '品目グループID';
COMMENT ON COLUMN production_item.production_process_id IS '生産工程ID';
COMMENT ON COLUMN production_item.specification IS '仕様';
COMMENT ON COLUMN production_item.location IS '場所';
COMMENT ON COLUMN production_item.created_at IS '登録日時';
COMMENT ON COLUMN production_item.updated_at IS '更新日時';
COMMENT ON COLUMN production_item.created_by IS '作成者';
COMMENT ON COLUMN production_item.approved_by IS '承認者';
COMMENT ON COLUMN production_item.remark IS '備考';
COMMENT ON TABLE production_item IS '生産品目: 生産対象となる製品、部品、材料を表す。';

-- 品目グループ: 共通特性をもつ生産品目の分類単位を表す。
CREATE TABLE production_item_group (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    asset_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_group PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_group.id IS 'ID';
COMMENT ON COLUMN production_item_group.name IS '名称';
COMMENT ON COLUMN production_item_group.category IS '分類';
COMMENT ON COLUMN production_item_group.status IS '状態';
COMMENT ON COLUMN production_item_group.description IS '説明';
COMMENT ON COLUMN production_item_group.asset_group_id IS 'アセットグループID';
COMMENT ON COLUMN production_item_group.specification IS '仕様';
COMMENT ON COLUMN production_item_group.value IS '数量';
COMMENT ON COLUMN production_item_group.unit IS '単位';
COMMENT ON COLUMN production_item_group.created_at IS '登録日時';
COMMENT ON COLUMN production_item_group.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_group.created_by IS '作成者';
COMMENT ON COLUMN production_item_group.approved_by IS '承認者';
COMMENT ON COLUMN production_item_group.remark IS '備考';
COMMENT ON TABLE production_item_group IS '品目グループ: 共通特性をもつ生産品目の分類単位を表す。';

-- 品目構成: 生産品目の部品表や構成関係を表す。
CREATE TABLE production_item_structure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    parent_production_item_group_id VARCHAR2(50 CHAR) NULL,
    child_production_item_group_id VARCHAR2(50 CHAR) NULL,
    parent_production_item_id VARCHAR2(50 CHAR) NULL,
    child_production_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_structure PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_structure.id IS 'ID';
COMMENT ON COLUMN production_item_structure.name IS '名称';
COMMENT ON COLUMN production_item_structure.category IS '分類';
COMMENT ON COLUMN production_item_structure.status IS '状態';
COMMENT ON COLUMN production_item_structure.description IS '説明';
COMMENT ON COLUMN production_item_structure.parent_production_item_group_id IS '親品目グループID';
COMMENT ON COLUMN production_item_structure.child_production_item_group_id IS '子品目グループID';
COMMENT ON COLUMN production_item_structure.parent_production_item_id IS '親生産品目ID';
COMMENT ON COLUMN production_item_structure.child_production_item_id IS '子生産品目ID';
COMMENT ON COLUMN production_item_structure.specification IS '仕様';
COMMENT ON COLUMN production_item_structure.value IS '数量';
COMMENT ON COLUMN production_item_structure.unit IS '単位';
COMMENT ON COLUMN production_item_structure.created_at IS '登録日時';
COMMENT ON COLUMN production_item_structure.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_structure.created_by IS '作成者';
COMMENT ON COLUMN production_item_structure.approved_by IS '承認者';
COMMENT ON COLUMN production_item_structure.remark IS '備考';
COMMENT ON TABLE production_item_structure IS '品目構成: 生産品目の部品表や構成関係を表す。';

-- 品目機能: 生産品目が提供する機能や役割を表す。
CREATE TABLE production_item_function (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_function PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_function.id IS 'ID';
COMMENT ON COLUMN production_item_function.name IS '名称';
COMMENT ON COLUMN production_item_function.category IS '分類';
COMMENT ON COLUMN production_item_function.status IS '状態';
COMMENT ON COLUMN production_item_function.description IS '説明';
COMMENT ON COLUMN production_item_function.production_item_id IS '生産品目ID';
COMMENT ON COLUMN production_item_function.specification IS '仕様';
COMMENT ON COLUMN production_item_function.value IS '数量';
COMMENT ON COLUMN production_item_function.unit IS '単位';
COMMENT ON COLUMN production_item_function.created_at IS '登録日時';
COMMENT ON COLUMN production_item_function.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_function.created_by IS '作成者';
COMMENT ON COLUMN production_item_function.approved_by IS '承認者';
COMMENT ON COLUMN production_item_function.remark IS '備考';
COMMENT ON TABLE production_item_function IS '品目機能: 生産品目が提供する機能や役割を表す。';

-- 品目仕様: 生産品目の仕様、品質条件、性能条件を表す。
CREATE TABLE production_item_specification (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_specification PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_specification.id IS 'ID';
COMMENT ON COLUMN production_item_specification.name IS '名称';
COMMENT ON COLUMN production_item_specification.category IS '分類';
COMMENT ON COLUMN production_item_specification.status IS '状態';
COMMENT ON COLUMN production_item_specification.description IS '説明';
COMMENT ON COLUMN production_item_specification.production_item_id IS '生産品目ID';
COMMENT ON COLUMN production_item_specification.specification IS '仕様';
COMMENT ON COLUMN production_item_specification.value IS '数量';
COMMENT ON COLUMN production_item_specification.unit IS '単位';
COMMENT ON COLUMN production_item_specification.created_at IS '登録日時';
COMMENT ON COLUMN production_item_specification.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_specification.created_by IS '作成者';
COMMENT ON COLUMN production_item_specification.approved_by IS '承認者';
COMMENT ON COLUMN production_item_specification.remark IS '備考';
COMMENT ON TABLE production_item_specification IS '品目仕様: 生産品目の仕様、品質条件、性能条件を表す。';

-- 品目部位: 生産品目を構成する識別可能な部位を表す。
CREATE TABLE production_item_portion (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_portion PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_portion.id IS 'ID';
COMMENT ON COLUMN production_item_portion.name IS '名称';
COMMENT ON COLUMN production_item_portion.category IS '分類';
COMMENT ON COLUMN production_item_portion.status IS '状態';
COMMENT ON COLUMN production_item_portion.description IS '説明';
COMMENT ON COLUMN production_item_portion.production_item_id IS '生産品目ID';
COMMENT ON COLUMN production_item_portion.specification IS '仕様';
COMMENT ON COLUMN production_item_portion.value IS '数量';
COMMENT ON COLUMN production_item_portion.unit IS '単位';
COMMENT ON COLUMN production_item_portion.location IS '場所';
COMMENT ON COLUMN production_item_portion.created_at IS '登録日時';
COMMENT ON COLUMN production_item_portion.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_portion.created_by IS '作成者';
COMMENT ON COLUMN production_item_portion.approved_by IS '承認者';
COMMENT ON COLUMN production_item_portion.remark IS '備考';
COMMENT ON TABLE production_item_portion IS '品目部位: 生産品目を構成する識別可能な部位を表す。';

-- 品目図書: 生産品目に関連する図面や仕様書を表す。
CREATE TABLE production_item_document (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    file_link VARCHAR2(255 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_document PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_document.id IS 'ID';
COMMENT ON COLUMN production_item_document.name IS '名称';
COMMENT ON COLUMN production_item_document.category IS '分類';
COMMENT ON COLUMN production_item_document.status IS '状態';
COMMENT ON COLUMN production_item_document.description IS '説明';
COMMENT ON COLUMN production_item_document.production_item_id IS '生産品目ID';
COMMENT ON COLUMN production_item_document.specification IS '仕様';
COMMENT ON COLUMN production_item_document.value IS '数量';
COMMENT ON COLUMN production_item_document.unit IS '単位';
COMMENT ON COLUMN production_item_document.file_link IS 'ファイル';
COMMENT ON COLUMN production_item_document.created_at IS '登録日時';
COMMENT ON COLUMN production_item_document.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_document.created_by IS '作成者';
COMMENT ON COLUMN production_item_document.approved_by IS '承認者';
COMMENT ON COLUMN production_item_document.remark IS '備考';
COMMENT ON TABLE production_item_document IS '品目図書: 生産品目に関連する図面や仕様書を表す。';

-- 品目事象: 生産品目に関連する不具合や課題を表す。
CREATE TABLE production_item_issue (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    production_item_group_id VARCHAR2(50 CHAR) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    issue_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_issue PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_issue.id IS 'ID';
COMMENT ON COLUMN production_item_issue.name IS '名称';
COMMENT ON COLUMN production_item_issue.category IS '分類';
COMMENT ON COLUMN production_item_issue.status IS '状態';
COMMENT ON COLUMN production_item_issue.description IS '説明';
COMMENT ON COLUMN production_item_issue.production_item_id IS '生産品目ID';
COMMENT ON COLUMN production_item_issue.production_item_group_id IS '品目グループID';
COMMENT ON COLUMN production_item_issue.note IS '摘要';
COMMENT ON COLUMN production_item_issue.value IS '数量';
COMMENT ON COLUMN production_item_issue.unit IS '単位';
COMMENT ON COLUMN production_item_issue.location IS '場所';
COMMENT ON COLUMN production_item_issue.issue_at IS '事象日時';
COMMENT ON COLUMN production_item_issue.created_at IS '登録日時';
COMMENT ON COLUMN production_item_issue.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_issue.created_by IS '作成者';
COMMENT ON COLUMN production_item_issue.approved_by IS '承認者';
COMMENT ON COLUMN production_item_issue.remark IS '備考';
COMMENT ON TABLE production_item_issue IS '品目事象: 生産品目に関連する不具合や課題を表す。';

-- 品目対策: 品目事象に対する対策内容を表す。
CREATE TABLE production_item_countermeasure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_issue_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_countermeasure PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_countermeasure.id IS 'ID';
COMMENT ON COLUMN production_item_countermeasure.name IS '名称';
COMMENT ON COLUMN production_item_countermeasure.category IS '分類';
COMMENT ON COLUMN production_item_countermeasure.status IS '状態';
COMMENT ON COLUMN production_item_countermeasure.description IS '説明';
COMMENT ON COLUMN production_item_countermeasure.production_item_issue_id IS '品目事象ID';
COMMENT ON COLUMN production_item_countermeasure.index_no IS '追番';
COMMENT ON COLUMN production_item_countermeasure.note IS '摘要';
COMMENT ON COLUMN production_item_countermeasure.value IS '数量';
COMMENT ON COLUMN production_item_countermeasure.unit IS '単位';
COMMENT ON COLUMN production_item_countermeasure.start_at IS '着手日時';
COMMENT ON COLUMN production_item_countermeasure.end_at IS '完了日時';
COMMENT ON COLUMN production_item_countermeasure.created_at IS '登録日時';
COMMENT ON COLUMN production_item_countermeasure.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_countermeasure.created_by IS '作成者';
COMMENT ON COLUMN production_item_countermeasure.approved_by IS '承認者';
COMMENT ON COLUMN production_item_countermeasure.remark IS '備考';
COMMENT ON TABLE production_item_countermeasure IS '品目対策: 品目事象に対する対策内容を表す。';

-- 品目結果: 生産品目を生産して得られた実体を示す。
CREATE TABLE production_item_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    production_schedule_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_item_result PRIMARY KEY (id)
);
COMMENT ON COLUMN production_item_result.id IS 'ID';
COMMENT ON COLUMN production_item_result.name IS '名称';
COMMENT ON COLUMN production_item_result.category IS '分類';
COMMENT ON COLUMN production_item_result.status IS '状態';
COMMENT ON COLUMN production_item_result.description IS '説明';
COMMENT ON COLUMN production_item_result.production_item_id IS '生産品目ID';
COMMENT ON COLUMN production_item_result.production_schedule_id IS '生産指示ID';
COMMENT ON COLUMN production_item_result.specification IS '仕様';
COMMENT ON COLUMN production_item_result.value IS '数量';
COMMENT ON COLUMN production_item_result.unit IS '単位';
COMMENT ON COLUMN production_item_result.location IS '場所';
COMMENT ON COLUMN production_item_result.result_at IS '結果日時';
COMMENT ON COLUMN production_item_result.created_at IS '登録日時';
COMMENT ON COLUMN production_item_result.updated_at IS '更新日時';
COMMENT ON COLUMN production_item_result.created_by IS '作成者';
COMMENT ON COLUMN production_item_result.approved_by IS '承認者';
COMMENT ON COLUMN production_item_result.remark IS '備考';
COMMENT ON TABLE production_item_result IS '品目結果: 生産品目を生産して得られた実体を示す。';

-- 生産工程: 技術的に定義された生産工程を表す。
CREATE TABLE production_process (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_process PRIMARY KEY (id)
);
COMMENT ON COLUMN production_process.id IS 'ID';
COMMENT ON COLUMN production_process.name IS '名称';
COMMENT ON COLUMN production_process.category IS '分類';
COMMENT ON COLUMN production_process.status IS '状態';
COMMENT ON COLUMN production_process.description IS '説明';
COMMENT ON COLUMN production_process.production_item_group_id IS '品目グループID';
COMMENT ON COLUMN production_process.specification IS '仕様';
COMMENT ON COLUMN production_process.value IS '数量';
COMMENT ON COLUMN production_process.unit IS '単位';
COMMENT ON COLUMN production_process.created_at IS '登録日時';
COMMENT ON COLUMN production_process.updated_at IS '更新日時';
COMMENT ON COLUMN production_process.created_by IS '作成者';
COMMENT ON COLUMN production_process.approved_by IS '承認者';
COMMENT ON COLUMN production_process.remark IS '備考';
COMMENT ON TABLE production_process IS '生産工程: 技術的に定義された生産工程を表す。';

-- 生産手順: 生産工程を具体化した作業手順を表す。
CREATE TABLE production_operation (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_process_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    personnel_group_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    work_hours NUMBER(18,4) NULL,
    work_days NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_operation PRIMARY KEY (id)
);
COMMENT ON COLUMN production_operation.id IS 'ID';
COMMENT ON COLUMN production_operation.name IS '名称';
COMMENT ON COLUMN production_operation.category IS '分類';
COMMENT ON COLUMN production_operation.status IS '状態';
COMMENT ON COLUMN production_operation.description IS '説明';
COMMENT ON COLUMN production_operation.production_process_id IS '生産工程ID';
COMMENT ON COLUMN production_operation.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN production_operation.personnel_group_id IS '作業者グループID';
COMMENT ON COLUMN production_operation.index_no IS '追番';
COMMENT ON COLUMN production_operation.specification IS '仕様';
COMMENT ON COLUMN production_operation.value IS '数量';
COMMENT ON COLUMN production_operation.unit IS '単位';
COMMENT ON COLUMN production_operation.work_hours IS '生産工数';
COMMENT ON COLUMN production_operation.work_days IS '生産日数';
COMMENT ON COLUMN production_operation.created_at IS '登録日時';
COMMENT ON COLUMN production_operation.updated_at IS '更新日時';
COMMENT ON COLUMN production_operation.created_by IS '作成者';
COMMENT ON COLUMN production_operation.approved_by IS '承認者';
COMMENT ON COLUMN production_operation.remark IS '備考';
COMMENT ON TABLE production_operation IS '生産手順: 生産工程を具体化した作業手順を表す。';

-- 生産内容: 生産手順を構成する詳細な作業項目を表す。
CREATE TABLE production_content (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_operation_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_content PRIMARY KEY (id)
);
COMMENT ON COLUMN production_content.id IS 'ID';
COMMENT ON COLUMN production_content.name IS '名称';
COMMENT ON COLUMN production_content.category IS '分類';
COMMENT ON COLUMN production_content.status IS '状態';
COMMENT ON COLUMN production_content.description IS '説明';
COMMENT ON COLUMN production_content.production_operation_id IS '生産手順ID';
COMMENT ON COLUMN production_content.specification IS '仕様';
COMMENT ON COLUMN production_content.value IS '数量';
COMMENT ON COLUMN production_content.unit IS '単位';
COMMENT ON COLUMN production_content.created_at IS '登録日時';
COMMENT ON COLUMN production_content.updated_at IS '更新日時';
COMMENT ON COLUMN production_content.created_by IS '作成者';
COMMENT ON COLUMN production_content.approved_by IS '承認者';
COMMENT ON COLUMN production_content.remark IS '備考';
COMMENT ON TABLE production_content IS '生産内容: 生産手順を構成する詳細な作業項目を表す。';

-- 生産割当: 生産指示に対するリソース割当を表す。
CREATE TABLE production_assignment (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_operation_id VARCHAR2(50 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_assignment PRIMARY KEY (id)
);
COMMENT ON COLUMN production_assignment.id IS 'ID';
COMMENT ON COLUMN production_assignment.name IS '名称';
COMMENT ON COLUMN production_assignment.category IS '分類';
COMMENT ON COLUMN production_assignment.status IS '状態';
COMMENT ON COLUMN production_assignment.description IS '説明';
COMMENT ON COLUMN production_assignment.production_operation_id IS '生産手順ID';
COMMENT ON COLUMN production_assignment.equipment_id IS '設備ID';
COMMENT ON COLUMN production_assignment.personnel_id IS '作業者ID';
COMMENT ON COLUMN production_assignment.index_no IS '追番';
COMMENT ON COLUMN production_assignment.specification IS '仕様';
COMMENT ON COLUMN production_assignment.value IS '数量';
COMMENT ON COLUMN production_assignment.unit IS '単位';
COMMENT ON COLUMN production_assignment.created_at IS '登録日時';
COMMENT ON COLUMN production_assignment.updated_at IS '更新日時';
COMMENT ON COLUMN production_assignment.created_by IS '作成者';
COMMENT ON COLUMN production_assignment.approved_by IS '承認者';
COMMENT ON COLUMN production_assignment.remark IS '備考';
COMMENT ON TABLE production_assignment IS '生産割当: 生産指示に対するリソース割当を表す。';

-- 生産能力: 生産ラインや工程の能力情報を表す。
CREATE TABLE production_capacity (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    production_item_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    maximum_value NUMBER(18,4) NULL,
    minimum_value NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_capacity PRIMARY KEY (id)
);
COMMENT ON COLUMN production_capacity.id IS 'ID';
COMMENT ON COLUMN production_capacity.name IS '名称';
COMMENT ON COLUMN production_capacity.category IS '分類';
COMMENT ON COLUMN production_capacity.status IS '状態';
COMMENT ON COLUMN production_capacity.description IS '説明';
COMMENT ON COLUMN production_capacity.term_id IS 'タームID';
COMMENT ON COLUMN production_capacity.production_item_group_id IS '品目グループID';
COMMENT ON COLUMN production_capacity.specification IS '仕様';
COMMENT ON COLUMN production_capacity.value IS '数量';
COMMENT ON COLUMN production_capacity.unit IS '単位';
COMMENT ON COLUMN production_capacity.maximum_value IS '最大値';
COMMENT ON COLUMN production_capacity.minimum_value IS '最小値';
COMMENT ON COLUMN production_capacity.created_at IS '登録日時';
COMMENT ON COLUMN production_capacity.updated_at IS '更新日時';
COMMENT ON COLUMN production_capacity.created_by IS '作成者';
COMMENT ON COLUMN production_capacity.approved_by IS '承認者';
COMMENT ON COLUMN production_capacity.remark IS '備考';
COMMENT ON TABLE production_capacity IS '生産能力: 生産ラインや工程の能力情報を表す。';

-- 生産オーダ: 生産を要求する指示単位を表す。
CREATE TABLE production_order (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_process_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    due_at TIMESTAMP NULL,
    release_at TIMESTAMP NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_order PRIMARY KEY (id)
);
COMMENT ON COLUMN production_order.id IS 'ID';
COMMENT ON COLUMN production_order.name IS '名称';
COMMENT ON COLUMN production_order.category IS '分類';
COMMENT ON COLUMN production_order.status IS '状態';
COMMENT ON COLUMN production_order.description IS '説明';
COMMENT ON COLUMN production_order.production_process_id IS '生産工程ID';
COMMENT ON COLUMN production_order.specification IS '仕様';
COMMENT ON COLUMN production_order.value IS '数量';
COMMENT ON COLUMN production_order.unit IS '単位';
COMMENT ON COLUMN production_order.location IS '場所';
COMMENT ON COLUMN production_order.due_at IS '納期';
COMMENT ON COLUMN production_order.release_at IS '発行日時';
COMMENT ON COLUMN production_order.start_at IS '着手日時';
COMMENT ON COLUMN production_order.end_at IS '完了日時';
COMMENT ON COLUMN production_order.created_at IS '登録日時';
COMMENT ON COLUMN production_order.updated_at IS '更新日時';
COMMENT ON COLUMN production_order.created_by IS '作成者';
COMMENT ON COLUMN production_order.approved_by IS '承認者';
COMMENT ON COLUMN production_order.remark IS '備考';
COMMENT ON TABLE production_order IS '生産オーダ: 生産を要求する指示単位を表す。';

-- 生産指示: 生産オーダに基づく実行指示を表す。
CREATE TABLE production_schedule (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_order_id VARCHAR2(50 CHAR) NULL,
    production_operation_id VARCHAR2(50 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    production_line_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_schedule PRIMARY KEY (id)
);
COMMENT ON COLUMN production_schedule.id IS 'ID';
COMMENT ON COLUMN production_schedule.name IS '名称';
COMMENT ON COLUMN production_schedule.category IS '分類';
COMMENT ON COLUMN production_schedule.status IS '状態';
COMMENT ON COLUMN production_schedule.description IS '説明';
COMMENT ON COLUMN production_schedule.production_order_id IS '生産オーダID';
COMMENT ON COLUMN production_schedule.production_operation_id IS '生産手順ID';
COMMENT ON COLUMN production_schedule.equipment_id IS '設備ID';
COMMENT ON COLUMN production_schedule.personnel_id IS '作業者ID';
COMMENT ON COLUMN production_schedule.production_line_id IS '生産ラインID';
COMMENT ON COLUMN production_schedule.index_no IS '追番';
COMMENT ON COLUMN production_schedule.specification IS '仕様';
COMMENT ON COLUMN production_schedule.planned_value IS '予定数量';
COMMENT ON COLUMN production_schedule.actual_value IS '実績数量';
COMMENT ON COLUMN production_schedule.unit IS '単位';
COMMENT ON COLUMN production_schedule.location IS '場所';
COMMENT ON COLUMN production_schedule.start_at IS '開始日時';
COMMENT ON COLUMN production_schedule.end_at IS '終了日時';
COMMENT ON COLUMN production_schedule.created_at IS '登録日時';
COMMENT ON COLUMN production_schedule.updated_at IS '更新日時';
COMMENT ON COLUMN production_schedule.created_by IS '作成者';
COMMENT ON COLUMN production_schedule.approved_by IS '承認者';
COMMENT ON COLUMN production_schedule.remark IS '備考';
COMMENT ON TABLE production_schedule IS '生産指示: 生産オーダに基づく実行指示を表す。';

-- 生産実績: 実際の生産量や稼働実績を表す。
CREATE TABLE production_performance (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    production_process_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    time NUMBER(18,4) NULL,
    time_unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_performance PRIMARY KEY (id)
);
COMMENT ON COLUMN production_performance.id IS 'ID';
COMMENT ON COLUMN production_performance.name IS '名称';
COMMENT ON COLUMN production_performance.category IS '分類';
COMMENT ON COLUMN production_performance.status IS '状態';
COMMENT ON COLUMN production_performance.description IS '説明';
COMMENT ON COLUMN production_performance.term_id IS 'タームID';
COMMENT ON COLUMN production_performance.production_process_id IS '生産工程ID';
COMMENT ON COLUMN production_performance.specification IS '仕様';
COMMENT ON COLUMN production_performance.value IS '数量';
COMMENT ON COLUMN production_performance.unit IS '単位';
COMMENT ON COLUMN production_performance.time IS '時間';
COMMENT ON COLUMN production_performance.time_unit IS '時間単位';
COMMENT ON COLUMN production_performance.start_at IS '開始日時';
COMMENT ON COLUMN production_performance.end_at IS '終了日時';
COMMENT ON COLUMN production_performance.created_at IS '登録日時';
COMMENT ON COLUMN production_performance.updated_at IS '更新日時';
COMMENT ON COLUMN production_performance.created_by IS '作成者';
COMMENT ON COLUMN production_performance.approved_by IS '承認者';
COMMENT ON COLUMN production_performance.remark IS '備考';
COMMENT ON TABLE production_performance IS '生産実績: 実際の生産量や稼働実績を表す。';

-- 生産結果: 生産指示の結果として得られた実行結果を表す。
CREATE TABLE production_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_schedule_id VARCHAR2(50 CHAR) NULL,
    production_content_id VARCHAR2(50 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_result PRIMARY KEY (id)
);
COMMENT ON COLUMN production_result.id IS 'ID';
COMMENT ON COLUMN production_result.name IS '名称';
COMMENT ON COLUMN production_result.category IS '分類';
COMMENT ON COLUMN production_result.status IS '状態';
COMMENT ON COLUMN production_result.description IS '説明';
COMMENT ON COLUMN production_result.production_schedule_id IS '生産指示ID';
COMMENT ON COLUMN production_result.production_content_id IS '生産項目ID';
COMMENT ON COLUMN production_result.personnel_id IS '作業者ID';
COMMENT ON COLUMN production_result.specification IS '仕様';
COMMENT ON COLUMN production_result.value IS '数量';
COMMENT ON COLUMN production_result.unit IS '単位';
COMMENT ON COLUMN production_result.location IS '場所';
COMMENT ON COLUMN production_result.result_at IS '結果日時';
COMMENT ON COLUMN production_result.created_at IS '登録日時';
COMMENT ON COLUMN production_result.updated_at IS '更新日時';
COMMENT ON COLUMN production_result.created_by IS '作成者';
COMMENT ON COLUMN production_result.approved_by IS '承認者';
COMMENT ON COLUMN production_result.remark IS '備考';
COMMENT ON TABLE production_result IS '生産結果: 生産指示の結果として得られた実行結果を表す。';

-- 生産図書: 生産工程に関連する技術文書を表す。
CREATE TABLE production_document (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    file_link VARCHAR2(255 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_document PRIMARY KEY (id)
);
COMMENT ON COLUMN production_document.id IS 'ID';
COMMENT ON COLUMN production_document.name IS '名称';
COMMENT ON COLUMN production_document.category IS '分類';
COMMENT ON COLUMN production_document.status IS '状態';
COMMENT ON COLUMN production_document.description IS '説明';
COMMENT ON COLUMN production_document.equipment_id IS '設備ID';
COMMENT ON COLUMN production_document.specification IS '仕様';
COMMENT ON COLUMN production_document.value IS '数量';
COMMENT ON COLUMN production_document.unit IS '単位';
COMMENT ON COLUMN production_document.file_link IS 'ファイル';
COMMENT ON COLUMN production_document.created_at IS '登録日時';
COMMENT ON COLUMN production_document.updated_at IS '更新日時';
COMMENT ON COLUMN production_document.created_by IS '作成者';
COMMENT ON COLUMN production_document.approved_by IS '承認者';
COMMENT ON COLUMN production_document.remark IS '備考';
COMMENT ON TABLE production_document IS '生産図書: 生産工程に関連する技術文書を表す。';

-- 生産事象: 生産活動で発生した問題や異常を表す。
CREATE TABLE production_issue (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    issue_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_issue PRIMARY KEY (id)
);
COMMENT ON COLUMN production_issue.id IS 'ID';
COMMENT ON COLUMN production_issue.name IS '名称';
COMMENT ON COLUMN production_issue.category IS '分類';
COMMENT ON COLUMN production_issue.status IS '状態';
COMMENT ON COLUMN production_issue.description IS '説明';
COMMENT ON COLUMN production_issue.equipment_id IS '設備ID';
COMMENT ON COLUMN production_issue.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN production_issue.note IS '摘要';
COMMENT ON COLUMN production_issue.value IS '数量';
COMMENT ON COLUMN production_issue.unit IS '単位';
COMMENT ON COLUMN production_issue.location IS '場所';
COMMENT ON COLUMN production_issue.issue_at IS '事象日時';
COMMENT ON COLUMN production_issue.created_at IS '登録日時';
COMMENT ON COLUMN production_issue.updated_at IS '更新日時';
COMMENT ON COLUMN production_issue.created_by IS '作成者';
COMMENT ON COLUMN production_issue.approved_by IS '承認者';
COMMENT ON COLUMN production_issue.remark IS '備考';
COMMENT ON TABLE production_issue IS '生産事象: 生産活動で発生した問題や異常を表す。';

-- 生産対策: 生産事象に対する改善や対策を表す。
CREATE TABLE production_countermeasure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_issue_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_production_countermeasure PRIMARY KEY (id)
);
COMMENT ON COLUMN production_countermeasure.id IS 'ID';
COMMENT ON COLUMN production_countermeasure.name IS '名称';
COMMENT ON COLUMN production_countermeasure.category IS '分類';
COMMENT ON COLUMN production_countermeasure.status IS '状態';
COMMENT ON COLUMN production_countermeasure.description IS '説明';
COMMENT ON COLUMN production_countermeasure.production_issue_id IS '生産事象ID';
COMMENT ON COLUMN production_countermeasure.index_no IS '追番';
COMMENT ON COLUMN production_countermeasure.note IS '摘要';
COMMENT ON COLUMN production_countermeasure.value IS '数量';
COMMENT ON COLUMN production_countermeasure.unit IS '単位';
COMMENT ON COLUMN production_countermeasure.start_at IS '着手日時';
COMMENT ON COLUMN production_countermeasure.end_at IS '完了日時';
COMMENT ON COLUMN production_countermeasure.created_at IS '登録日時';
COMMENT ON COLUMN production_countermeasure.updated_at IS '更新日時';
COMMENT ON COLUMN production_countermeasure.created_by IS '作成者';
COMMENT ON COLUMN production_countermeasure.approved_by IS '承認者';
COMMENT ON COLUMN production_countermeasure.remark IS '備考';
COMMENT ON TABLE production_countermeasure IS '生産対策: 生産事象に対する改善や対策を表す。';

-- 設備: 生産作業を実行する機械や装置を表す。
CREATE TABLE equipment (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_line_id VARCHAR2(50 CHAR) NULL,
    asset_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    energy_node_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment.id IS 'ID';
COMMENT ON COLUMN equipment.name IS '名称';
COMMENT ON COLUMN equipment.category IS '分類';
COMMENT ON COLUMN equipment.status IS '状態';
COMMENT ON COLUMN equipment.description IS '説明';
COMMENT ON COLUMN equipment.production_line_id IS '生産ラインID';
COMMENT ON COLUMN equipment.asset_id IS 'アセットID';
COMMENT ON COLUMN equipment.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN equipment.energy_node_id IS 'エネルギ接点ID';
COMMENT ON COLUMN equipment.specification IS '仕様';
COMMENT ON COLUMN equipment.location IS '場所';
COMMENT ON COLUMN equipment.created_at IS '登録日時';
COMMENT ON COLUMN equipment.updated_at IS '更新日時';
COMMENT ON COLUMN equipment.created_by IS '作成者';
COMMENT ON COLUMN equipment.approved_by IS '承認者';
COMMENT ON COLUMN equipment.remark IS '備考';
COMMENT ON TABLE equipment IS '設備: 生産作業を実行する機械や装置を表す。';

-- 設備グループ: 共通機能をもつ設備の分類単位を表す。
CREATE TABLE equipment_group (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    asset_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_group PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_group.id IS 'ID';
COMMENT ON COLUMN equipment_group.name IS '名称';
COMMENT ON COLUMN equipment_group.category IS '分類';
COMMENT ON COLUMN equipment_group.status IS '状態';
COMMENT ON COLUMN equipment_group.description IS '説明';
COMMENT ON COLUMN equipment_group.asset_group_id IS 'アセットグループID';
COMMENT ON COLUMN equipment_group.specification IS '仕様';
COMMENT ON COLUMN equipment_group.value IS '数量';
COMMENT ON COLUMN equipment_group.unit IS '単位';
COMMENT ON COLUMN equipment_group.created_at IS '登録日時';
COMMENT ON COLUMN equipment_group.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_group.created_by IS '作成者';
COMMENT ON COLUMN equipment_group.approved_by IS '承認者';
COMMENT ON COLUMN equipment_group.remark IS '備考';
COMMENT ON TABLE equipment_group IS '設備グループ: 共通機能をもつ設備の分類単位を表す。';

-- 設備構成: 設備の親子関係や構成情報を表す。
CREATE TABLE equipment_structure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    parent_equipment_group_id VARCHAR2(50 CHAR) NULL,
    child_equipment_group_id VARCHAR2(50 CHAR) NULL,
    parent_equipment_id VARCHAR2(50 CHAR) NULL,
    child_equipment_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_structure PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_structure.id IS 'ID';
COMMENT ON COLUMN equipment_structure.name IS '名称';
COMMENT ON COLUMN equipment_structure.category IS '分類';
COMMENT ON COLUMN equipment_structure.status IS '状態';
COMMENT ON COLUMN equipment_structure.description IS '説明';
COMMENT ON COLUMN equipment_structure.parent_equipment_group_id IS '親設備グループID';
COMMENT ON COLUMN equipment_structure.child_equipment_group_id IS '子設備グループID';
COMMENT ON COLUMN equipment_structure.parent_equipment_id IS '親設備ID';
COMMENT ON COLUMN equipment_structure.child_equipment_id IS '子設備ID';
COMMENT ON COLUMN equipment_structure.specification IS '仕様';
COMMENT ON COLUMN equipment_structure.value IS '数量';
COMMENT ON COLUMN equipment_structure.unit IS '単位';
COMMENT ON COLUMN equipment_structure.created_at IS '登録日時';
COMMENT ON COLUMN equipment_structure.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_structure.created_by IS '作成者';
COMMENT ON COLUMN equipment_structure.approved_by IS '承認者';
COMMENT ON COLUMN equipment_structure.remark IS '備考';
COMMENT ON TABLE equipment_structure IS '設備構成: 設備の親子関係や構成情報を表す。';

-- 設備機能: 設備がもつ機能や役割を表す。
CREATE TABLE equipment_function (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_function PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_function.id IS 'ID';
COMMENT ON COLUMN equipment_function.name IS '名称';
COMMENT ON COLUMN equipment_function.category IS '分類';
COMMENT ON COLUMN equipment_function.status IS '状態';
COMMENT ON COLUMN equipment_function.description IS '説明';
COMMENT ON COLUMN equipment_function.equipment_id IS '設備ID';
COMMENT ON COLUMN equipment_function.specification IS '仕様';
COMMENT ON COLUMN equipment_function.value IS '数量';
COMMENT ON COLUMN equipment_function.unit IS '単位';
COMMENT ON COLUMN equipment_function.created_at IS '登録日時';
COMMENT ON COLUMN equipment_function.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_function.created_by IS '作成者';
COMMENT ON COLUMN equipment_function.approved_by IS '承認者';
COMMENT ON COLUMN equipment_function.remark IS '備考';
COMMENT ON TABLE equipment_function IS '設備機能: 設備がもつ機能や役割を表す。';

-- 設備仕様: 設備に求められる性能や仕様条件を表す。
CREATE TABLE equipment_specification (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_specification PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_specification.id IS 'ID';
COMMENT ON COLUMN equipment_specification.name IS '名称';
COMMENT ON COLUMN equipment_specification.category IS '分類';
COMMENT ON COLUMN equipment_specification.status IS '状態';
COMMENT ON COLUMN equipment_specification.description IS '説明';
COMMENT ON COLUMN equipment_specification.equipment_id IS '設備ID';
COMMENT ON COLUMN equipment_specification.specification IS '仕様';
COMMENT ON COLUMN equipment_specification.value IS '数量';
COMMENT ON COLUMN equipment_specification.unit IS '単位';
COMMENT ON COLUMN equipment_specification.created_at IS '登録日時';
COMMENT ON COLUMN equipment_specification.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_specification.created_by IS '作成者';
COMMENT ON COLUMN equipment_specification.approved_by IS '承認者';
COMMENT ON COLUMN equipment_specification.remark IS '備考';
COMMENT ON TABLE equipment_specification IS '設備仕様: 設備に求められる性能や仕様条件を表す。';

-- 設備部位: 設備を構成する識別可能な部位を表す。
CREATE TABLE equipment_portion (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_portion PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_portion.id IS 'ID';
COMMENT ON COLUMN equipment_portion.name IS '名称';
COMMENT ON COLUMN equipment_portion.category IS '分類';
COMMENT ON COLUMN equipment_portion.status IS '状態';
COMMENT ON COLUMN equipment_portion.description IS '説明';
COMMENT ON COLUMN equipment_portion.equipment_id IS '設備ID';
COMMENT ON COLUMN equipment_portion.specification IS '仕様';
COMMENT ON COLUMN equipment_portion.value IS '数量';
COMMENT ON COLUMN equipment_portion.unit IS '単位';
COMMENT ON COLUMN equipment_portion.location IS '場所';
COMMENT ON COLUMN equipment_portion.created_at IS '登録日時';
COMMENT ON COLUMN equipment_portion.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_portion.created_by IS '作成者';
COMMENT ON COLUMN equipment_portion.approved_by IS '承認者';
COMMENT ON COLUMN equipment_portion.remark IS '備考';
COMMENT ON TABLE equipment_portion IS '設備部位: 設備を構成する識別可能な部位を表す。';

-- 設備図書: 設備に関連する図面やマニュアルを表す。
CREATE TABLE equipment_document (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    file_link VARCHAR2(255 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_document PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_document.id IS 'ID';
COMMENT ON COLUMN equipment_document.name IS '名称';
COMMENT ON COLUMN equipment_document.category IS '分類';
COMMENT ON COLUMN equipment_document.status IS '状態';
COMMENT ON COLUMN equipment_document.description IS '説明';
COMMENT ON COLUMN equipment_document.equipment_id IS '設備ID';
COMMENT ON COLUMN equipment_document.specification IS '仕様';
COMMENT ON COLUMN equipment_document.value IS '数量';
COMMENT ON COLUMN equipment_document.unit IS '単位';
COMMENT ON COLUMN equipment_document.file_link IS 'ファイル';
COMMENT ON COLUMN equipment_document.created_at IS '登録日時';
COMMENT ON COLUMN equipment_document.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_document.created_by IS '作成者';
COMMENT ON COLUMN equipment_document.approved_by IS '承認者';
COMMENT ON COLUMN equipment_document.remark IS '備考';
COMMENT ON TABLE equipment_document IS '設備図書: 設備に関連する図面やマニュアルを表す。';

-- 設備事象: 設備に発生した故障や異常を表す。
CREATE TABLE equipment_issue (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    issue_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_issue PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_issue.id IS 'ID';
COMMENT ON COLUMN equipment_issue.name IS '名称';
COMMENT ON COLUMN equipment_issue.category IS '分類';
COMMENT ON COLUMN equipment_issue.status IS '状態';
COMMENT ON COLUMN equipment_issue.description IS '説明';
COMMENT ON COLUMN equipment_issue.equipment_id IS '設備ID';
COMMENT ON COLUMN equipment_issue.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN equipment_issue.note IS '摘要';
COMMENT ON COLUMN equipment_issue.value IS '数量';
COMMENT ON COLUMN equipment_issue.unit IS '単位';
COMMENT ON COLUMN equipment_issue.location IS '場所';
COMMENT ON COLUMN equipment_issue.issue_at IS '事象日時';
COMMENT ON COLUMN equipment_issue.created_at IS '登録日時';
COMMENT ON COLUMN equipment_issue.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_issue.created_by IS '作成者';
COMMENT ON COLUMN equipment_issue.approved_by IS '承認者';
COMMENT ON COLUMN equipment_issue.remark IS '備考';
COMMENT ON TABLE equipment_issue IS '設備事象: 設備に発生した故障や異常を表す。';

-- 設備対策: 設備事象に対する対策内容を表す。
CREATE TABLE equipment_countermeasure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_issue_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_countermeasure PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_countermeasure.id IS 'ID';
COMMENT ON COLUMN equipment_countermeasure.name IS '名称';
COMMENT ON COLUMN equipment_countermeasure.category IS '分類';
COMMENT ON COLUMN equipment_countermeasure.status IS '状態';
COMMENT ON COLUMN equipment_countermeasure.description IS '説明';
COMMENT ON COLUMN equipment_countermeasure.equipment_issue_id IS '設備事象ID';
COMMENT ON COLUMN equipment_countermeasure.index_no IS '追番';
COMMENT ON COLUMN equipment_countermeasure.note IS '摘要';
COMMENT ON COLUMN equipment_countermeasure.value IS '数量';
COMMENT ON COLUMN equipment_countermeasure.unit IS '単位';
COMMENT ON COLUMN equipment_countermeasure.start_at IS '着手日時';
COMMENT ON COLUMN equipment_countermeasure.end_at IS '完了日時';
COMMENT ON COLUMN equipment_countermeasure.created_at IS '登録日時';
COMMENT ON COLUMN equipment_countermeasure.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_countermeasure.created_by IS '作成者';
COMMENT ON COLUMN equipment_countermeasure.approved_by IS '承認者';
COMMENT ON COLUMN equipment_countermeasure.remark IS '備考';
COMMENT ON TABLE equipment_countermeasure IS '設備対策: 設備事象に対する対策内容を表す。';

-- 設備工程: 設備に関する保全や稼働の工程を表す。
CREATE TABLE equipment_process (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_process PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_process.id IS 'ID';
COMMENT ON COLUMN equipment_process.name IS '名称';
COMMENT ON COLUMN equipment_process.category IS '分類';
COMMENT ON COLUMN equipment_process.status IS '状態';
COMMENT ON COLUMN equipment_process.description IS '説明';
COMMENT ON COLUMN equipment_process.specification IS '仕様';
COMMENT ON COLUMN equipment_process.value IS '数量';
COMMENT ON COLUMN equipment_process.unit IS '単位';
COMMENT ON COLUMN equipment_process.created_at IS '登録日時';
COMMENT ON COLUMN equipment_process.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_process.created_by IS '作成者';
COMMENT ON COLUMN equipment_process.approved_by IS '承認者';
COMMENT ON COLUMN equipment_process.remark IS '備考';
COMMENT ON TABLE equipment_process IS '設備工程: 設備に関する保全や稼働の工程を表す。';

-- 設備手順: 設備工程を実行する具体的な手順を表す。
CREATE TABLE equipment_operation (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_process_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    personnel_group_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    work_hours NUMBER(18,4) NULL,
    work_days NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_operation PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_operation.id IS 'ID';
COMMENT ON COLUMN equipment_operation.name IS '名称';
COMMENT ON COLUMN equipment_operation.category IS '分類';
COMMENT ON COLUMN equipment_operation.status IS '状態';
COMMENT ON COLUMN equipment_operation.description IS '説明';
COMMENT ON COLUMN equipment_operation.equipment_process_id IS '設備工程ID';
COMMENT ON COLUMN equipment_operation.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN equipment_operation.personnel_group_id IS '作業者グループID';
COMMENT ON COLUMN equipment_operation.index_no IS '追番';
COMMENT ON COLUMN equipment_operation.specification IS '仕様';
COMMENT ON COLUMN equipment_operation.value IS '数量';
COMMENT ON COLUMN equipment_operation.unit IS '単位';
COMMENT ON COLUMN equipment_operation.work_hours IS '生産工数';
COMMENT ON COLUMN equipment_operation.work_days IS '生産日数';
COMMENT ON COLUMN equipment_operation.created_at IS '登録日時';
COMMENT ON COLUMN equipment_operation.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_operation.created_by IS '作成者';
COMMENT ON COLUMN equipment_operation.approved_by IS '承認者';
COMMENT ON COLUMN equipment_operation.remark IS '備考';
COMMENT ON TABLE equipment_operation IS '設備手順: 設備工程を実行する具体的な手順を表す。';

-- 設備内容: 設備手順を構成する詳細な作業項目を表す。
CREATE TABLE equipment_content (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_operation_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_content PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_content.id IS 'ID';
COMMENT ON COLUMN equipment_content.name IS '名称';
COMMENT ON COLUMN equipment_content.category IS '分類';
COMMENT ON COLUMN equipment_content.status IS '状態';
COMMENT ON COLUMN equipment_content.description IS '説明';
COMMENT ON COLUMN equipment_content.equipment_operation_id IS '設備手順ID';
COMMENT ON COLUMN equipment_content.specification IS '仕様';
COMMENT ON COLUMN equipment_content.value IS '数量';
COMMENT ON COLUMN equipment_content.unit IS '単位';
COMMENT ON COLUMN equipment_content.created_at IS '登録日時';
COMMENT ON COLUMN equipment_content.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_content.created_by IS '作成者';
COMMENT ON COLUMN equipment_content.approved_by IS '承認者';
COMMENT ON COLUMN equipment_content.remark IS '備考';
COMMENT ON TABLE equipment_content IS '設備内容: 設備手順を構成する詳細な作業項目を表す。';

-- 設備割当: 生産手順に対する設備割当を表す。
CREATE TABLE equipment_assignment (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_operation_id VARCHAR2(50 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_assignment PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_assignment.id IS 'ID';
COMMENT ON COLUMN equipment_assignment.name IS '名称';
COMMENT ON COLUMN equipment_assignment.category IS '分類';
COMMENT ON COLUMN equipment_assignment.status IS '状態';
COMMENT ON COLUMN equipment_assignment.description IS '説明';
COMMENT ON COLUMN equipment_assignment.equipment_operation_id IS '設備手順ID';
COMMENT ON COLUMN equipment_assignment.equipment_id IS '設備ID';
COMMENT ON COLUMN equipment_assignment.personnel_id IS '作業者ID';
COMMENT ON COLUMN equipment_assignment.index_no IS '追番';
COMMENT ON COLUMN equipment_assignment.specification IS '仕様';
COMMENT ON COLUMN equipment_assignment.value IS '数量';
COMMENT ON COLUMN equipment_assignment.unit IS '単位';
COMMENT ON COLUMN equipment_assignment.created_at IS '登録日時';
COMMENT ON COLUMN equipment_assignment.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_assignment.created_by IS '作成者';
COMMENT ON COLUMN equipment_assignment.approved_by IS '承認者';
COMMENT ON COLUMN equipment_assignment.remark IS '備考';
COMMENT ON TABLE equipment_assignment IS '設備割当: 生産手順に対する設備割当を表す。';

-- 設備能力: 設備がもつ処理能力や性能を表す。
CREATE TABLE equipment_capacity (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    maximum_value NUMBER(18,4) NULL,
    minimum_value NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_capacity PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_capacity.id IS 'ID';
COMMENT ON COLUMN equipment_capacity.name IS '名称';
COMMENT ON COLUMN equipment_capacity.category IS '分類';
COMMENT ON COLUMN equipment_capacity.status IS '状態';
COMMENT ON COLUMN equipment_capacity.description IS '説明';
COMMENT ON COLUMN equipment_capacity.term_id IS 'タームID';
COMMENT ON COLUMN equipment_capacity.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN equipment_capacity.specification IS '仕様';
COMMENT ON COLUMN equipment_capacity.value IS '数量';
COMMENT ON COLUMN equipment_capacity.unit IS '単位';
COMMENT ON COLUMN equipment_capacity.maximum_value IS '最大値';
COMMENT ON COLUMN equipment_capacity.minimum_value IS '最小値';
COMMENT ON COLUMN equipment_capacity.created_at IS '登録日時';
COMMENT ON COLUMN equipment_capacity.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_capacity.created_by IS '作成者';
COMMENT ON COLUMN equipment_capacity.approved_by IS '承認者';
COMMENT ON COLUMN equipment_capacity.remark IS '備考';
COMMENT ON TABLE equipment_capacity IS '設備能力: 設備がもつ処理能力や性能を表す。';

-- 設備オーダ: 設備に対する作業要求を表す。
CREATE TABLE equipment_order (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_process_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    due_at TIMESTAMP NULL,
    release_at TIMESTAMP NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_order PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_order.id IS 'ID';
COMMENT ON COLUMN equipment_order.name IS '名称';
COMMENT ON COLUMN equipment_order.category IS '分類';
COMMENT ON COLUMN equipment_order.status IS '状態';
COMMENT ON COLUMN equipment_order.description IS '説明';
COMMENT ON COLUMN equipment_order.equipment_process_id IS '設備工程ID';
COMMENT ON COLUMN equipment_order.specification IS '仕様';
COMMENT ON COLUMN equipment_order.value IS '数量';
COMMENT ON COLUMN equipment_order.unit IS '単位';
COMMENT ON COLUMN equipment_order.location IS '場所';
COMMENT ON COLUMN equipment_order.due_at IS '納期';
COMMENT ON COLUMN equipment_order.release_at IS '発行日時';
COMMENT ON COLUMN equipment_order.start_at IS '着手日時';
COMMENT ON COLUMN equipment_order.end_at IS '完了日時';
COMMENT ON COLUMN equipment_order.created_at IS '登録日時';
COMMENT ON COLUMN equipment_order.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_order.created_by IS '作成者';
COMMENT ON COLUMN equipment_order.approved_by IS '承認者';
COMMENT ON COLUMN equipment_order.remark IS '備考';
COMMENT ON TABLE equipment_order IS '設備オーダ: 設備に対する作業要求を表す。';

-- 設備指示: 設備オーダに基づく実行指示を表す。
CREATE TABLE equipment_schedule (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_operation_id VARCHAR2(50 CHAR) NULL,
    equipment_order_id VARCHAR2(50 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_schedule PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_schedule.id IS 'ID';
COMMENT ON COLUMN equipment_schedule.name IS '名称';
COMMENT ON COLUMN equipment_schedule.category IS '分類';
COMMENT ON COLUMN equipment_schedule.status IS '状態';
COMMENT ON COLUMN equipment_schedule.description IS '説明';
COMMENT ON COLUMN equipment_schedule.equipment_operation_id IS '設備手順ID';
COMMENT ON COLUMN equipment_schedule.equipment_order_id IS '設備オーダID';
COMMENT ON COLUMN equipment_schedule.equipment_id IS '設備ID';
COMMENT ON COLUMN equipment_schedule.personnel_id IS '作業者ID';
COMMENT ON COLUMN equipment_schedule.index_no IS '追番';
COMMENT ON COLUMN equipment_schedule.specification IS '仕様';
COMMENT ON COLUMN equipment_schedule.planned_value IS '予定数量';
COMMENT ON COLUMN equipment_schedule.actual_value IS '実績数量';
COMMENT ON COLUMN equipment_schedule.unit IS '単位';
COMMENT ON COLUMN equipment_schedule.location IS '場所';
COMMENT ON COLUMN equipment_schedule.start_at IS '開始日時';
COMMENT ON COLUMN equipment_schedule.end_at IS '終了日時';
COMMENT ON COLUMN equipment_schedule.created_at IS '登録日時';
COMMENT ON COLUMN equipment_schedule.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_schedule.created_by IS '作成者';
COMMENT ON COLUMN equipment_schedule.approved_by IS '承認者';
COMMENT ON COLUMN equipment_schedule.remark IS '備考';
COMMENT ON TABLE equipment_schedule IS '設備指示: 設備オーダに基づく実行指示を表す。';

-- 設備実績: 設備の稼働実績や運転結果を表す。
CREATE TABLE equipment_performance (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    equipment_process_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    time NUMBER(18,4) NULL,
    time_unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_performance PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_performance.id IS 'ID';
COMMENT ON COLUMN equipment_performance.name IS '名称';
COMMENT ON COLUMN equipment_performance.category IS '分類';
COMMENT ON COLUMN equipment_performance.status IS '状態';
COMMENT ON COLUMN equipment_performance.description IS '説明';
COMMENT ON COLUMN equipment_performance.term_id IS 'タームID';
COMMENT ON COLUMN equipment_performance.equipment_process_id IS '設備工程ID';
COMMENT ON COLUMN equipment_performance.specification IS '仕様';
COMMENT ON COLUMN equipment_performance.value IS '数量';
COMMENT ON COLUMN equipment_performance.unit IS '単位';
COMMENT ON COLUMN equipment_performance.time IS '時間';
COMMENT ON COLUMN equipment_performance.time_unit IS '時間単位';
COMMENT ON COLUMN equipment_performance.start_at IS '開始日時';
COMMENT ON COLUMN equipment_performance.end_at IS '終了日時';
COMMENT ON COLUMN equipment_performance.created_at IS '登録日時';
COMMENT ON COLUMN equipment_performance.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_performance.created_by IS '作成者';
COMMENT ON COLUMN equipment_performance.approved_by IS '承認者';
COMMENT ON COLUMN equipment_performance.remark IS '備考';
COMMENT ON TABLE equipment_performance IS '設備実績: 設備の稼働実績や運転結果を表す。';

-- 設備結果: 設備作業の結果を表す。
CREATE TABLE equipment_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    equipment_content_id VARCHAR2(50 CHAR) NULL,
    equipment_schedule_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_equipment_result PRIMARY KEY (id)
);
COMMENT ON COLUMN equipment_result.id IS 'ID';
COMMENT ON COLUMN equipment_result.name IS '名称';
COMMENT ON COLUMN equipment_result.category IS '分類';
COMMENT ON COLUMN equipment_result.status IS '状態';
COMMENT ON COLUMN equipment_result.description IS '説明';
COMMENT ON COLUMN equipment_result.equipment_content_id IS '設備項目ID';
COMMENT ON COLUMN equipment_result.equipment_schedule_id IS '設備指示ID';
COMMENT ON COLUMN equipment_result.specification IS '仕様';
COMMENT ON COLUMN equipment_result.value IS '数量';
COMMENT ON COLUMN equipment_result.unit IS '単位';
COMMENT ON COLUMN equipment_result.location IS '場所';
COMMENT ON COLUMN equipment_result.result_at IS '結果日時';
COMMENT ON COLUMN equipment_result.created_at IS '登録日時';
COMMENT ON COLUMN equipment_result.updated_at IS '更新日時';
COMMENT ON COLUMN equipment_result.created_by IS '作成者';
COMMENT ON COLUMN equipment_result.approved_by IS '承認者';
COMMENT ON COLUMN equipment_result.remark IS '備考';
COMMENT ON TABLE equipment_result IS '設備結果: 設備作業の結果を表す。';

-- 作業者: 生産活動に従事する作業者を表す。
CREATE TABLE personnel (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_line_id VARCHAR2(50 CHAR) NULL,
    asset_id VARCHAR2(50 CHAR) NULL,
    personnel_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel.id IS 'ID';
COMMENT ON COLUMN personnel.name IS '名称';
COMMENT ON COLUMN personnel.category IS '分類';
COMMENT ON COLUMN personnel.status IS '状態';
COMMENT ON COLUMN personnel.description IS '説明';
COMMENT ON COLUMN personnel.production_line_id IS '生産ラインID';
COMMENT ON COLUMN personnel.asset_id IS 'アセットID';
COMMENT ON COLUMN personnel.personnel_group_id IS '作業者グループID';
COMMENT ON COLUMN personnel.specification IS '仕様';
COMMENT ON COLUMN personnel.location IS '場所';
COMMENT ON COLUMN personnel.created_at IS '登録日時';
COMMENT ON COLUMN personnel.updated_at IS '更新日時';
COMMENT ON COLUMN personnel.created_by IS '作成者';
COMMENT ON COLUMN personnel.approved_by IS '承認者';
COMMENT ON COLUMN personnel.remark IS '備考';
COMMENT ON TABLE personnel IS '作業者: 生産活動に従事する作業者を表す。';

-- 作業者グループ: 共通役割をもつ作業者のグループを表す。
CREATE TABLE personnel_group (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    asset_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_group PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_group.id IS 'ID';
COMMENT ON COLUMN personnel_group.name IS '名称';
COMMENT ON COLUMN personnel_group.category IS '分類';
COMMENT ON COLUMN personnel_group.status IS '状態';
COMMENT ON COLUMN personnel_group.description IS '説明';
COMMENT ON COLUMN personnel_group.asset_group_id IS 'アセットグループID';
COMMENT ON COLUMN personnel_group.specification IS '仕様';
COMMENT ON COLUMN personnel_group.value IS '数量';
COMMENT ON COLUMN personnel_group.unit IS '単位';
COMMENT ON COLUMN personnel_group.created_at IS '登録日時';
COMMENT ON COLUMN personnel_group.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_group.created_by IS '作成者';
COMMENT ON COLUMN personnel_group.approved_by IS '承認者';
COMMENT ON COLUMN personnel_group.remark IS '備考';
COMMENT ON TABLE personnel_group IS '作業者グループ: 共通役割をもつ作業者のグループを表す。';

-- 作業者構成: 作業者間の階層や代替関係を表す。
CREATE TABLE personnel_structure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    personnel_group_id VARCHAR2(50 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_structure PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_structure.id IS 'ID';
COMMENT ON COLUMN personnel_structure.name IS '名称';
COMMENT ON COLUMN personnel_structure.category IS '分類';
COMMENT ON COLUMN personnel_structure.status IS '状態';
COMMENT ON COLUMN personnel_structure.description IS '説明';
COMMENT ON COLUMN personnel_structure.personnel_group_id IS '作業者グループID';
COMMENT ON COLUMN personnel_structure.personnel_id IS '作業者ID';
COMMENT ON COLUMN personnel_structure.specification IS '仕様';
COMMENT ON COLUMN personnel_structure.value IS '数量';
COMMENT ON COLUMN personnel_structure.unit IS '単位';
COMMENT ON COLUMN personnel_structure.created_at IS '登録日時';
COMMENT ON COLUMN personnel_structure.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_structure.created_by IS '作成者';
COMMENT ON COLUMN personnel_structure.approved_by IS '承認者';
COMMENT ON COLUMN personnel_structure.remark IS '備考';
COMMENT ON TABLE personnel_structure IS '作業者構成: 作業者間の階層や代替関係を表す。';

-- 作業者スキル: 作業者が保有する技能や資格を表す。
CREATE TABLE personnel_skill (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_skill PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_skill.id IS 'ID';
COMMENT ON COLUMN personnel_skill.name IS '名称';
COMMENT ON COLUMN personnel_skill.category IS '分類';
COMMENT ON COLUMN personnel_skill.status IS '状態';
COMMENT ON COLUMN personnel_skill.description IS '説明';
COMMENT ON COLUMN personnel_skill.personnel_id IS '作業者ID';
COMMENT ON COLUMN personnel_skill.specification IS '仕様';
COMMENT ON COLUMN personnel_skill.value IS '数量';
COMMENT ON COLUMN personnel_skill.unit IS '単位';
COMMENT ON COLUMN personnel_skill.created_at IS '登録日時';
COMMENT ON COLUMN personnel_skill.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_skill.created_by IS '作成者';
COMMENT ON COLUMN personnel_skill.approved_by IS '承認者';
COMMENT ON COLUMN personnel_skill.remark IS '備考';
COMMENT ON TABLE personnel_skill IS '作業者スキル: 作業者が保有する技能や資格を表す。';

-- 作業者仕様: 作業者に求められる資格や条件を表す。
CREATE TABLE personnel_specification (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_specification PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_specification.id IS 'ID';
COMMENT ON COLUMN personnel_specification.name IS '名称';
COMMENT ON COLUMN personnel_specification.category IS '分類';
COMMENT ON COLUMN personnel_specification.status IS '状態';
COMMENT ON COLUMN personnel_specification.description IS '説明';
COMMENT ON COLUMN personnel_specification.personnel_id IS '作業者ID';
COMMENT ON COLUMN personnel_specification.specification IS '仕様';
COMMENT ON COLUMN personnel_specification.value IS '数量';
COMMENT ON COLUMN personnel_specification.unit IS '単位';
COMMENT ON COLUMN personnel_specification.created_at IS '登録日時';
COMMENT ON COLUMN personnel_specification.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_specification.created_by IS '作成者';
COMMENT ON COLUMN personnel_specification.approved_by IS '承認者';
COMMENT ON COLUMN personnel_specification.remark IS '備考';
COMMENT ON TABLE personnel_specification IS '作業者仕様: 作業者に求められる資格や条件を表す。';

-- 作業者部位: 作業者の身体的または機能的な部位を表す。
CREATE TABLE personnel_portion (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_portion PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_portion.id IS 'ID';
COMMENT ON COLUMN personnel_portion.name IS '名称';
COMMENT ON COLUMN personnel_portion.category IS '分類';
COMMENT ON COLUMN personnel_portion.status IS '状態';
COMMENT ON COLUMN personnel_portion.description IS '説明';
COMMENT ON COLUMN personnel_portion.personnel_id IS '作業者ID';
COMMENT ON COLUMN personnel_portion.specification IS '仕様';
COMMENT ON COLUMN personnel_portion.value IS '数量';
COMMENT ON COLUMN personnel_portion.unit IS '単位';
COMMENT ON COLUMN personnel_portion.location IS '場所';
COMMENT ON COLUMN personnel_portion.created_at IS '登録日時';
COMMENT ON COLUMN personnel_portion.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_portion.created_by IS '作成者';
COMMENT ON COLUMN personnel_portion.approved_by IS '承認者';
COMMENT ON COLUMN personnel_portion.remark IS '備考';
COMMENT ON TABLE personnel_portion IS '作業者部位: 作業者の身体的または機能的な部位を表す。';

-- 作業者図書: 作業者に関連する教育資料や記録を表す。
CREATE TABLE personnel_document (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    file_link VARCHAR2(255 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_document PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_document.id IS 'ID';
COMMENT ON COLUMN personnel_document.name IS '名称';
COMMENT ON COLUMN personnel_document.category IS '分類';
COMMENT ON COLUMN personnel_document.status IS '状態';
COMMENT ON COLUMN personnel_document.description IS '説明';
COMMENT ON COLUMN personnel_document.personnel_id IS '作業者ID';
COMMENT ON COLUMN personnel_document.specification IS '仕様';
COMMENT ON COLUMN personnel_document.value IS '数量';
COMMENT ON COLUMN personnel_document.unit IS '単位';
COMMENT ON COLUMN personnel_document.file_link IS 'ファイル';
COMMENT ON COLUMN personnel_document.created_at IS '登録日時';
COMMENT ON COLUMN personnel_document.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_document.created_by IS '作成者';
COMMENT ON COLUMN personnel_document.approved_by IS '承認者';
COMMENT ON COLUMN personnel_document.remark IS '備考';
COMMENT ON TABLE personnel_document IS '作業者図書: 作業者に関連する教育資料や記録を表す。';

-- 作業者事象: 作業者に関連する問題や事故を表す。
CREATE TABLE personnel_issue (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    personnel_group_id VARCHAR2(50 CHAR) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    issue_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_issue PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_issue.id IS 'ID';
COMMENT ON COLUMN personnel_issue.name IS '名称';
COMMENT ON COLUMN personnel_issue.category IS '分類';
COMMENT ON COLUMN personnel_issue.status IS '状態';
COMMENT ON COLUMN personnel_issue.description IS '説明';
COMMENT ON COLUMN personnel_issue.personnel_id IS '作業者ID';
COMMENT ON COLUMN personnel_issue.personnel_group_id IS '作業者グループID';
COMMENT ON COLUMN personnel_issue.note IS '摘要';
COMMENT ON COLUMN personnel_issue.value IS '数量';
COMMENT ON COLUMN personnel_issue.unit IS '単位';
COMMENT ON COLUMN personnel_issue.location IS '場所';
COMMENT ON COLUMN personnel_issue.issue_at IS '事象日時';
COMMENT ON COLUMN personnel_issue.created_at IS '登録日時';
COMMENT ON COLUMN personnel_issue.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_issue.created_by IS '作成者';
COMMENT ON COLUMN personnel_issue.approved_by IS '承認者';
COMMENT ON COLUMN personnel_issue.remark IS '備考';
COMMENT ON TABLE personnel_issue IS '作業者事象: 作業者に関連する問題や事故を表す。';

-- 作業者対策: 作業者事象に対する改善や対策を表す。
CREATE TABLE personnel_countermeasure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    personnel_issue_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    note VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_personnel_countermeasure PRIMARY KEY (id)
);
COMMENT ON COLUMN personnel_countermeasure.id IS 'ID';
COMMENT ON COLUMN personnel_countermeasure.name IS '名称';
COMMENT ON COLUMN personnel_countermeasure.category IS '分類';
COMMENT ON COLUMN personnel_countermeasure.status IS '状態';
COMMENT ON COLUMN personnel_countermeasure.description IS '説明';
COMMENT ON COLUMN personnel_countermeasure.personnel_issue_id IS '作業者事象ID';
COMMENT ON COLUMN personnel_countermeasure.index_no IS '追番';
COMMENT ON COLUMN personnel_countermeasure.note IS '摘要';
COMMENT ON COLUMN personnel_countermeasure.value IS '数量';
COMMENT ON COLUMN personnel_countermeasure.unit IS '単位';
COMMENT ON COLUMN personnel_countermeasure.start_at IS '着手日時';
COMMENT ON COLUMN personnel_countermeasure.end_at IS '完了日時';
COMMENT ON COLUMN personnel_countermeasure.created_at IS '登録日時';
COMMENT ON COLUMN personnel_countermeasure.updated_at IS '更新日時';
COMMENT ON COLUMN personnel_countermeasure.created_by IS '作成者';
COMMENT ON COLUMN personnel_countermeasure.approved_by IS '承認者';
COMMENT ON COLUMN personnel_countermeasure.remark IS '備考';
COMMENT ON TABLE personnel_countermeasure IS '作業者対策: 作業者事象に対する改善や対策を表す。';

-- 作業工程: 人作業として定義された工程を表す。
CREATE TABLE work_process (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_process PRIMARY KEY (id)
);
COMMENT ON COLUMN work_process.id IS 'ID';
COMMENT ON COLUMN work_process.name IS '名称';
COMMENT ON COLUMN work_process.category IS '分類';
COMMENT ON COLUMN work_process.status IS '状態';
COMMENT ON COLUMN work_process.description IS '説明';
COMMENT ON COLUMN work_process.specification IS '仕様';
COMMENT ON COLUMN work_process.value IS '数量';
COMMENT ON COLUMN work_process.unit IS '単位';
COMMENT ON COLUMN work_process.created_at IS '登録日時';
COMMENT ON COLUMN work_process.updated_at IS '更新日時';
COMMENT ON COLUMN work_process.created_by IS '作成者';
COMMENT ON COLUMN work_process.approved_by IS '承認者';
COMMENT ON COLUMN work_process.remark IS '備考';
COMMENT ON TABLE work_process IS '作業工程: 人作業として定義された工程を表す。';

-- 作業手順: 作業工程を実行する具体的な手順を表す。
CREATE TABLE work_operation (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    work_process_id VARCHAR2(50 CHAR) NULL,
    equipment_group_id VARCHAR2(50 CHAR) NULL,
    personnel_group_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    work_hours NUMBER(18,4) NULL,
    work_days NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_operation PRIMARY KEY (id)
);
COMMENT ON COLUMN work_operation.id IS 'ID';
COMMENT ON COLUMN work_operation.name IS '名称';
COMMENT ON COLUMN work_operation.category IS '分類';
COMMENT ON COLUMN work_operation.status IS '状態';
COMMENT ON COLUMN work_operation.description IS '説明';
COMMENT ON COLUMN work_operation.work_process_id IS '作業工程ID';
COMMENT ON COLUMN work_operation.equipment_group_id IS '設備グループID';
COMMENT ON COLUMN work_operation.personnel_group_id IS '作業者グループID';
COMMENT ON COLUMN work_operation.index_no IS '追番';
COMMENT ON COLUMN work_operation.specification IS '仕様';
COMMENT ON COLUMN work_operation.value IS '数量';
COMMENT ON COLUMN work_operation.unit IS '単位';
COMMENT ON COLUMN work_operation.work_hours IS '生産工数';
COMMENT ON COLUMN work_operation.work_days IS '生産日数';
COMMENT ON COLUMN work_operation.created_at IS '登録日時';
COMMENT ON COLUMN work_operation.updated_at IS '更新日時';
COMMENT ON COLUMN work_operation.created_by IS '作成者';
COMMENT ON COLUMN work_operation.approved_by IS '承認者';
COMMENT ON COLUMN work_operation.remark IS '備考';
COMMENT ON TABLE work_operation IS '作業手順: 作業工程を実行する具体的な手順を表す。';

-- 作業内容: 作業手順を構成する詳細な作業項目を表す。
CREATE TABLE work_content (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    work_operation_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_content PRIMARY KEY (id)
);
COMMENT ON COLUMN work_content.id IS 'ID';
COMMENT ON COLUMN work_content.name IS '名称';
COMMENT ON COLUMN work_content.category IS '分類';
COMMENT ON COLUMN work_content.status IS '状態';
COMMENT ON COLUMN work_content.description IS '説明';
COMMENT ON COLUMN work_content.work_operation_id IS '作業手順ID';
COMMENT ON COLUMN work_content.specification IS '仕様';
COMMENT ON COLUMN work_content.value IS '数量';
COMMENT ON COLUMN work_content.unit IS '単位';
COMMENT ON COLUMN work_content.created_at IS '登録日時';
COMMENT ON COLUMN work_content.updated_at IS '更新日時';
COMMENT ON COLUMN work_content.created_by IS '作成者';
COMMENT ON COLUMN work_content.approved_by IS '承認者';
COMMENT ON COLUMN work_content.remark IS '備考';
COMMENT ON TABLE work_content IS '作業内容: 作業手順を構成する詳細な作業項目を表す。';

-- 作業割当: 作業指示に対するリソース割当を表す。
CREATE TABLE work_assignment (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    work_operation_id VARCHAR2(50 CHAR) NULL,
    personnel_id VARCHAR2(50 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_assignment PRIMARY KEY (id)
);
COMMENT ON COLUMN work_assignment.id IS 'ID';
COMMENT ON COLUMN work_assignment.name IS '名称';
COMMENT ON COLUMN work_assignment.category IS '分類';
COMMENT ON COLUMN work_assignment.status IS '状態';
COMMENT ON COLUMN work_assignment.description IS '説明';
COMMENT ON COLUMN work_assignment.work_operation_id IS '作業手順ID';
COMMENT ON COLUMN work_assignment.personnel_id IS '作業者ID';
COMMENT ON COLUMN work_assignment.equipment_id IS '設備ID';
COMMENT ON COLUMN work_assignment.index_no IS '追番';
COMMENT ON COLUMN work_assignment.specification IS '仕様';
COMMENT ON COLUMN work_assignment.value IS '数量';
COMMENT ON COLUMN work_assignment.unit IS '単位';
COMMENT ON COLUMN work_assignment.created_at IS '登録日時';
COMMENT ON COLUMN work_assignment.updated_at IS '更新日時';
COMMENT ON COLUMN work_assignment.created_by IS '作成者';
COMMENT ON COLUMN work_assignment.approved_by IS '承認者';
COMMENT ON COLUMN work_assignment.remark IS '備考';
COMMENT ON TABLE work_assignment IS '作業割当: 作業指示に対するリソース割当を表す。';

-- 作業能力: 作業者または作業班の能力を表す。
CREATE TABLE work_capacity (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    maximum_value NUMBER(18,4) NULL,
    minimum_value NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_capacity PRIMARY KEY (id)
);
COMMENT ON COLUMN work_capacity.id IS 'ID';
COMMENT ON COLUMN work_capacity.name IS '名称';
COMMENT ON COLUMN work_capacity.category IS '分類';
COMMENT ON COLUMN work_capacity.status IS '状態';
COMMENT ON COLUMN work_capacity.description IS '説明';
COMMENT ON COLUMN work_capacity.site_id IS 'サイトID';
COMMENT ON COLUMN work_capacity.term_id IS 'タームID';
COMMENT ON COLUMN work_capacity.specification IS '仕様';
COMMENT ON COLUMN work_capacity.value IS '数量';
COMMENT ON COLUMN work_capacity.unit IS '単位';
COMMENT ON COLUMN work_capacity.maximum_value IS '最大値';
COMMENT ON COLUMN work_capacity.minimum_value IS '最小値';
COMMENT ON COLUMN work_capacity.created_at IS '登録日時';
COMMENT ON COLUMN work_capacity.updated_at IS '更新日時';
COMMENT ON COLUMN work_capacity.created_by IS '作成者';
COMMENT ON COLUMN work_capacity.approved_by IS '承認者';
COMMENT ON COLUMN work_capacity.remark IS '備考';
COMMENT ON TABLE work_capacity IS '作業能力: 作業者または作業班の能力を表す。';

-- 作業オーダ: 作業者に対する作業要求を表す。
CREATE TABLE work_order (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    work_process_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    due_at TIMESTAMP NULL,
    release_at TIMESTAMP NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_order PRIMARY KEY (id)
);
COMMENT ON COLUMN work_order.id IS 'ID';
COMMENT ON COLUMN work_order.name IS '名称';
COMMENT ON COLUMN work_order.category IS '分類';
COMMENT ON COLUMN work_order.status IS '状態';
COMMENT ON COLUMN work_order.description IS '説明';
COMMENT ON COLUMN work_order.work_process_id IS '作業工程ID';
COMMENT ON COLUMN work_order.specification IS '仕様';
COMMENT ON COLUMN work_order.value IS '数量';
COMMENT ON COLUMN work_order.unit IS '単位';
COMMENT ON COLUMN work_order.location IS '場所';
COMMENT ON COLUMN work_order.due_at IS '納期';
COMMENT ON COLUMN work_order.release_at IS '発行日時';
COMMENT ON COLUMN work_order.start_at IS '着手日時';
COMMENT ON COLUMN work_order.end_at IS '完了日時';
COMMENT ON COLUMN work_order.created_at IS '登録日時';
COMMENT ON COLUMN work_order.updated_at IS '更新日時';
COMMENT ON COLUMN work_order.created_by IS '作成者';
COMMENT ON COLUMN work_order.approved_by IS '承認者';
COMMENT ON COLUMN work_order.remark IS '備考';
COMMENT ON TABLE work_order IS '作業オーダ: 作業者に対する作業要求を表す。';

-- 作業指示: 作業オーダに基づく実行指示を表す。
CREATE TABLE work_schedule (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    work_order_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_schedule PRIMARY KEY (id)
);
COMMENT ON COLUMN work_schedule.id IS 'ID';
COMMENT ON COLUMN work_schedule.name IS '名称';
COMMENT ON COLUMN work_schedule.category IS '分類';
COMMENT ON COLUMN work_schedule.status IS '状態';
COMMENT ON COLUMN work_schedule.description IS '説明';
COMMENT ON COLUMN work_schedule.work_order_id IS '作業オーダID';
COMMENT ON COLUMN work_schedule.index_no IS '追番';
COMMENT ON COLUMN work_schedule.specification IS '仕様';
COMMENT ON COLUMN work_schedule.planned_value IS '予定数量';
COMMENT ON COLUMN work_schedule.actual_value IS '実績数量';
COMMENT ON COLUMN work_schedule.unit IS '単位';
COMMENT ON COLUMN work_schedule.location IS '場所';
COMMENT ON COLUMN work_schedule.start_at IS '開始日時';
COMMENT ON COLUMN work_schedule.end_at IS '終了日時';
COMMENT ON COLUMN work_schedule.created_at IS '登録日時';
COMMENT ON COLUMN work_schedule.updated_at IS '更新日時';
COMMENT ON COLUMN work_schedule.created_by IS '作成者';
COMMENT ON COLUMN work_schedule.approved_by IS '承認者';
COMMENT ON COLUMN work_schedule.remark IS '備考';
COMMENT ON TABLE work_schedule IS '作業指示: 作業オーダに基づく実行指示を表す。';

-- 作業実績: 作業者または作業班の実績を表す。
CREATE TABLE work_performance (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    work_order_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    time NUMBER(18,4) NULL,
    time_unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_performance PRIMARY KEY (id)
);
COMMENT ON COLUMN work_performance.id IS 'ID';
COMMENT ON COLUMN work_performance.name IS '名称';
COMMENT ON COLUMN work_performance.category IS '分類';
COMMENT ON COLUMN work_performance.status IS '状態';
COMMENT ON COLUMN work_performance.description IS '説明';
COMMENT ON COLUMN work_performance.work_order_id IS '作業オーダID';
COMMENT ON COLUMN work_performance.term_id IS 'タームID';
COMMENT ON COLUMN work_performance.specification IS '仕様';
COMMENT ON COLUMN work_performance.value IS '数量';
COMMENT ON COLUMN work_performance.unit IS '単位';
COMMENT ON COLUMN work_performance.time IS '時間';
COMMENT ON COLUMN work_performance.time_unit IS '時間単位';
COMMENT ON COLUMN work_performance.start_at IS '開始日時';
COMMENT ON COLUMN work_performance.end_at IS '終了日時';
COMMENT ON COLUMN work_performance.created_at IS '登録日時';
COMMENT ON COLUMN work_performance.updated_at IS '更新日時';
COMMENT ON COLUMN work_performance.created_by IS '作成者';
COMMENT ON COLUMN work_performance.approved_by IS '承認者';
COMMENT ON COLUMN work_performance.remark IS '備考';
COMMENT ON TABLE work_performance IS '作業実績: 作業者または作業班の実績を表す。';

-- 作業結果: 作業の実行結果を表す。
CREATE TABLE work_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    work_schedule_id VARCHAR2(50 CHAR) NULL,
    work_content_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_work_result PRIMARY KEY (id)
);
COMMENT ON COLUMN work_result.id IS 'ID';
COMMENT ON COLUMN work_result.name IS '名称';
COMMENT ON COLUMN work_result.category IS '分類';
COMMENT ON COLUMN work_result.status IS '状態';
COMMENT ON COLUMN work_result.description IS '説明';
COMMENT ON COLUMN work_result.work_schedule_id IS '作業指示ID';
COMMENT ON COLUMN work_result.work_content_id IS '作業項目ID';
COMMENT ON COLUMN work_result.specification IS '仕様';
COMMENT ON COLUMN work_result.value IS '数量';
COMMENT ON COLUMN work_result.unit IS '単位';
COMMENT ON COLUMN work_result.location IS '場所';
COMMENT ON COLUMN work_result.result_at IS '結果日時';
COMMENT ON COLUMN work_result.created_at IS '登録日時';
COMMENT ON COLUMN work_result.updated_at IS '更新日時';
COMMENT ON COLUMN work_result.created_by IS '作成者';
COMMENT ON COLUMN work_result.approved_by IS '承認者';
COMMENT ON COLUMN work_result.remark IS '備考';
COMMENT ON TABLE work_result IS '作業結果: 作業の実行結果を表す。';

-- 在庫品目: 在庫場所ごとの管理品目を表す。
CREATE TABLE inventory_item (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    lead_time NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_inventory_item PRIMARY KEY (id)
);
COMMENT ON COLUMN inventory_item.id IS 'ID';
COMMENT ON COLUMN inventory_item.name IS '名称';
COMMENT ON COLUMN inventory_item.category IS '分類';
COMMENT ON COLUMN inventory_item.status IS '状態';
COMMENT ON COLUMN inventory_item.description IS '説明';
COMMENT ON COLUMN inventory_item.production_item_id IS '生産品目ID';
COMMENT ON COLUMN inventory_item.specification IS '仕様';
COMMENT ON COLUMN inventory_item.value IS '数量';
COMMENT ON COLUMN inventory_item.unit IS '単位';
COMMENT ON COLUMN inventory_item.location IS '場所';
COMMENT ON COLUMN inventory_item.unit_price IS '単価';
COMMENT ON COLUMN inventory_item.lead_time IS '日数';
COMMENT ON COLUMN inventory_item.created_at IS '登録日時';
COMMENT ON COLUMN inventory_item.updated_at IS '更新日時';
COMMENT ON COLUMN inventory_item.created_by IS '作成者';
COMMENT ON COLUMN inventory_item.approved_by IS '承認者';
COMMENT ON COLUMN inventory_item.remark IS '備考';
COMMENT ON TABLE inventory_item IS '在庫品目: 在庫場所ごとの管理品目を表す。';

-- 在庫能力: 在庫場所の保管能力を表す。
CREATE TABLE inventory_capacity (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    maximum_value NUMBER(18,4) NULL,
    minimum_value NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_inventory_capacity PRIMARY KEY (id)
);
COMMENT ON COLUMN inventory_capacity.id IS 'ID';
COMMENT ON COLUMN inventory_capacity.name IS '名称';
COMMENT ON COLUMN inventory_capacity.category IS '分類';
COMMENT ON COLUMN inventory_capacity.status IS '状態';
COMMENT ON COLUMN inventory_capacity.description IS '説明';
COMMENT ON COLUMN inventory_capacity.site_id IS 'サイトID';
COMMENT ON COLUMN inventory_capacity.term_id IS 'タームID';
COMMENT ON COLUMN inventory_capacity.production_item_id IS '生産品目ID';
COMMENT ON COLUMN inventory_capacity.specification IS '仕様';
COMMENT ON COLUMN inventory_capacity.value IS '数量';
COMMENT ON COLUMN inventory_capacity.unit IS '単位';
COMMENT ON COLUMN inventory_capacity.maximum_value IS '最大値';
COMMENT ON COLUMN inventory_capacity.minimum_value IS '最小値';
COMMENT ON COLUMN inventory_capacity.created_at IS '登録日時';
COMMENT ON COLUMN inventory_capacity.updated_at IS '更新日時';
COMMENT ON COLUMN inventory_capacity.created_by IS '作成者';
COMMENT ON COLUMN inventory_capacity.approved_by IS '承認者';
COMMENT ON COLUMN inventory_capacity.remark IS '備考';
COMMENT ON TABLE inventory_capacity IS '在庫能力: 在庫場所の保管能力を表す。';

-- 在庫オーダ: 在庫品目の移動・補充オーダを表す。
CREATE TABLE inventory_order (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    production_order_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    due_at TIMESTAMP NULL,
    release_at TIMESTAMP NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_inventory_order PRIMARY KEY (id)
);
COMMENT ON COLUMN inventory_order.id IS 'ID';
COMMENT ON COLUMN inventory_order.name IS '名称';
COMMENT ON COLUMN inventory_order.category IS '分類';
COMMENT ON COLUMN inventory_order.status IS '状態';
COMMENT ON COLUMN inventory_order.description IS '説明';
COMMENT ON COLUMN inventory_order.production_item_id IS '生産品目ID';
COMMENT ON COLUMN inventory_order.production_order_id IS '生産オーダID';
COMMENT ON COLUMN inventory_order.specification IS '仕様';
COMMENT ON COLUMN inventory_order.value IS '数量';
COMMENT ON COLUMN inventory_order.unit IS '単位';
COMMENT ON COLUMN inventory_order.location IS '場所';
COMMENT ON COLUMN inventory_order.due_at IS '納期';
COMMENT ON COLUMN inventory_order.release_at IS '発行日時';
COMMENT ON COLUMN inventory_order.start_at IS '着手日時';
COMMENT ON COLUMN inventory_order.end_at IS '完了日時';
COMMENT ON COLUMN inventory_order.created_at IS '登録日時';
COMMENT ON COLUMN inventory_order.updated_at IS '更新日時';
COMMENT ON COLUMN inventory_order.created_by IS '作成者';
COMMENT ON COLUMN inventory_order.approved_by IS '承認者';
COMMENT ON COLUMN inventory_order.remark IS '備考';
COMMENT ON TABLE inventory_order IS '在庫オーダ: 在庫品目の移動・補充オーダを表す。';

-- 在庫指示: 在庫品目の移動・補充指示を表す。
CREATE TABLE inventory_schedule (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    inventory_order_id VARCHAR2(50 CHAR) NULL,
    from_inventory_item_id VARCHAR2(50 CHAR) NULL,
    to_inventory_item_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_inventory_schedule PRIMARY KEY (id)
);
COMMENT ON COLUMN inventory_schedule.id IS 'ID';
COMMENT ON COLUMN inventory_schedule.name IS '名称';
COMMENT ON COLUMN inventory_schedule.category IS '分類';
COMMENT ON COLUMN inventory_schedule.status IS '状態';
COMMENT ON COLUMN inventory_schedule.description IS '説明';
COMMENT ON COLUMN inventory_schedule.inventory_order_id IS '在庫オーダID';
COMMENT ON COLUMN inventory_schedule.from_inventory_item_id IS '移動元在庫品目ID';
COMMENT ON COLUMN inventory_schedule.to_inventory_item_id IS '移動先在庫品目ID';
COMMENT ON COLUMN inventory_schedule.index_no IS '追番';
COMMENT ON COLUMN inventory_schedule.specification IS '仕様';
COMMENT ON COLUMN inventory_schedule.planned_value IS '予定数量';
COMMENT ON COLUMN inventory_schedule.actual_value IS '実績数量';
COMMENT ON COLUMN inventory_schedule.unit IS '単位';
COMMENT ON COLUMN inventory_schedule.location IS '場所';
COMMENT ON COLUMN inventory_schedule.start_at IS '開始日時';
COMMENT ON COLUMN inventory_schedule.end_at IS '終了日時';
COMMENT ON COLUMN inventory_schedule.created_at IS '登録日時';
COMMENT ON COLUMN inventory_schedule.updated_at IS '更新日時';
COMMENT ON COLUMN inventory_schedule.created_by IS '作成者';
COMMENT ON COLUMN inventory_schedule.approved_by IS '承認者';
COMMENT ON COLUMN inventory_schedule.remark IS '備考';
COMMENT ON TABLE inventory_schedule IS '在庫指示: 在庫品目の移動・補充指示を表す。';

-- 在庫移動: 在庫品目の数量増減結果を表す。
CREATE TABLE inventory_transfer (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    inventory_item_id VARCHAR2(50 CHAR) NULL,
    inventory_schedule_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    time NUMBER(18,4) NULL,
    time_unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_inventory_transfer PRIMARY KEY (id)
);
COMMENT ON COLUMN inventory_transfer.id IS 'ID';
COMMENT ON COLUMN inventory_transfer.name IS '名称';
COMMENT ON COLUMN inventory_transfer.category IS '分類';
COMMENT ON COLUMN inventory_transfer.status IS '状態';
COMMENT ON COLUMN inventory_transfer.description IS '説明';
COMMENT ON COLUMN inventory_transfer.inventory_item_id IS '在庫品目ID';
COMMENT ON COLUMN inventory_transfer.inventory_schedule_id IS '在庫指示ID';
COMMENT ON COLUMN inventory_transfer.specification IS '仕様';
COMMENT ON COLUMN inventory_transfer.value IS '数量';
COMMENT ON COLUMN inventory_transfer.unit IS '単位';
COMMENT ON COLUMN inventory_transfer.time IS '時間';
COMMENT ON COLUMN inventory_transfer.time_unit IS '時間単位';
COMMENT ON COLUMN inventory_transfer.start_at IS '開始日時';
COMMENT ON COLUMN inventory_transfer.end_at IS '終了日時';
COMMENT ON COLUMN inventory_transfer.created_at IS '登録日時';
COMMENT ON COLUMN inventory_transfer.updated_at IS '更新日時';
COMMENT ON COLUMN inventory_transfer.created_by IS '作成者';
COMMENT ON COLUMN inventory_transfer.approved_by IS '承認者';
COMMENT ON COLUMN inventory_transfer.remark IS '備考';
COMMENT ON TABLE inventory_transfer IS '在庫移動: 在庫品目の数量増減結果を表す。';

-- 在庫数量: ある時点における在庫数量を表す。
CREATE TABLE inventory_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    inventory_item_id VARCHAR2(50 CHAR) NULL,
    inventory_schedule_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_inventory_result PRIMARY KEY (id)
);
COMMENT ON COLUMN inventory_result.id IS 'ID';
COMMENT ON COLUMN inventory_result.name IS '名称';
COMMENT ON COLUMN inventory_result.category IS '分類';
COMMENT ON COLUMN inventory_result.status IS '状態';
COMMENT ON COLUMN inventory_result.description IS '説明';
COMMENT ON COLUMN inventory_result.inventory_item_id IS '在庫品目ID';
COMMENT ON COLUMN inventory_result.inventory_schedule_id IS '在庫指示ID';
COMMENT ON COLUMN inventory_result.specification IS '仕様';
COMMENT ON COLUMN inventory_result.value IS '数量';
COMMENT ON COLUMN inventory_result.unit IS '単位';
COMMENT ON COLUMN inventory_result.location IS '場所';
COMMENT ON COLUMN inventory_result.result_at IS '結果日時';
COMMENT ON COLUMN inventory_result.created_at IS '登録日時';
COMMENT ON COLUMN inventory_result.updated_at IS '更新日時';
COMMENT ON COLUMN inventory_result.created_by IS '作成者';
COMMENT ON COLUMN inventory_result.approved_by IS '承認者';
COMMENT ON COLUMN inventory_result.remark IS '備考';
COMMENT ON TABLE inventory_result IS '在庫数量: ある時点における在庫数量を表す。';

-- エネルギ: 生産活動に必要なエネルギを表す。
CREATE TABLE energy (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy PRIMARY KEY (id)
);
COMMENT ON COLUMN energy.id IS 'ID';
COMMENT ON COLUMN energy.name IS '名称';
COMMENT ON COLUMN energy.category IS '分類';
COMMENT ON COLUMN energy.status IS '状態';
COMMENT ON COLUMN energy.description IS '説明';
COMMENT ON COLUMN energy.energy_group_id IS 'エネルギグループID';
COMMENT ON COLUMN energy.specification IS '仕様';
COMMENT ON COLUMN energy.location IS '場所';
COMMENT ON COLUMN energy.created_at IS '登録日時';
COMMENT ON COLUMN energy.updated_at IS '更新日時';
COMMENT ON COLUMN energy.created_by IS '作成者';
COMMENT ON COLUMN energy.approved_by IS '承認者';
COMMENT ON COLUMN energy.remark IS '備考';
COMMENT ON TABLE energy IS 'エネルギ: 生産活動に必要なエネルギを表す。';

-- エネルギグループ: エネルギ源の分類単位を表す。
CREATE TABLE energy_group (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_group PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_group.id IS 'ID';
COMMENT ON COLUMN energy_group.name IS '名称';
COMMENT ON COLUMN energy_group.category IS '分類';
COMMENT ON COLUMN energy_group.status IS '状態';
COMMENT ON COLUMN energy_group.description IS '説明';
COMMENT ON COLUMN energy_group.specification IS '仕様';
COMMENT ON COLUMN energy_group.value IS '数量';
COMMENT ON COLUMN energy_group.unit IS '単位';
COMMENT ON COLUMN energy_group.created_at IS '登録日時';
COMMENT ON COLUMN energy_group.updated_at IS '更新日時';
COMMENT ON COLUMN energy_group.created_by IS '作成者';
COMMENT ON COLUMN energy_group.approved_by IS '承認者';
COMMENT ON COLUMN energy_group.remark IS '備考';
COMMENT ON TABLE energy_group IS 'エネルギグループ: エネルギ源の分類単位を表す。';

-- エネルギ構成: エネルギ供給の構成関係を表す。
CREATE TABLE energy_structure (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_structure PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_structure.id IS 'ID';
COMMENT ON COLUMN energy_structure.name IS '名称';
COMMENT ON COLUMN energy_structure.category IS '分類';
COMMENT ON COLUMN energy_structure.status IS '状態';
COMMENT ON COLUMN energy_structure.description IS '説明';
COMMENT ON COLUMN energy_structure.energy_id IS 'エネルギID';
COMMENT ON COLUMN energy_structure.specification IS '仕様';
COMMENT ON COLUMN energy_structure.value IS '数量';
COMMENT ON COLUMN energy_structure.unit IS '単位';
COMMENT ON COLUMN energy_structure.created_at IS '登録日時';
COMMENT ON COLUMN energy_structure.updated_at IS '更新日時';
COMMENT ON COLUMN energy_structure.created_by IS '作成者';
COMMENT ON COLUMN energy_structure.approved_by IS '承認者';
COMMENT ON COLUMN energy_structure.remark IS '備考';
COMMENT ON TABLE energy_structure IS 'エネルギ構成: エネルギ供給の構成関係を表す。';

-- エネルギ機能: エネルギがもつ機能を表す。
CREATE TABLE energy_function (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_function PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_function.id IS 'ID';
COMMENT ON COLUMN energy_function.name IS '名称';
COMMENT ON COLUMN energy_function.category IS '分類';
COMMENT ON COLUMN energy_function.status IS '状態';
COMMENT ON COLUMN energy_function.description IS '説明';
COMMENT ON COLUMN energy_function.energy_id IS 'エネルギID';
COMMENT ON COLUMN energy_function.specification IS '仕様';
COMMENT ON COLUMN energy_function.value IS '数量';
COMMENT ON COLUMN energy_function.unit IS '単位';
COMMENT ON COLUMN energy_function.created_at IS '登録日時';
COMMENT ON COLUMN energy_function.updated_at IS '更新日時';
COMMENT ON COLUMN energy_function.created_by IS '作成者';
COMMENT ON COLUMN energy_function.approved_by IS '承認者';
COMMENT ON COLUMN energy_function.remark IS '備考';
COMMENT ON TABLE energy_function IS 'エネルギ機能: エネルギがもつ機能を表す。';

-- エネルギ仕様: エネルギに求められる仕様条件を表す。
CREATE TABLE energy_specification (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_specification PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_specification.id IS 'ID';
COMMENT ON COLUMN energy_specification.name IS '名称';
COMMENT ON COLUMN energy_specification.category IS '分類';
COMMENT ON COLUMN energy_specification.status IS '状態';
COMMENT ON COLUMN energy_specification.description IS '説明';
COMMENT ON COLUMN energy_specification.energy_id IS 'エネルギID';
COMMENT ON COLUMN energy_specification.specification IS '仕様';
COMMENT ON COLUMN energy_specification.value IS '数量';
COMMENT ON COLUMN energy_specification.unit IS '単位';
COMMENT ON COLUMN energy_specification.created_at IS '登録日時';
COMMENT ON COLUMN energy_specification.updated_at IS '更新日時';
COMMENT ON COLUMN energy_specification.created_by IS '作成者';
COMMENT ON COLUMN energy_specification.approved_by IS '承認者';
COMMENT ON COLUMN energy_specification.remark IS '備考';
COMMENT ON TABLE energy_specification IS 'エネルギ仕様: エネルギに求められる仕様条件を表す。';

-- エネルギ接点: エネルギの供給・消費の接続点を表す。
CREATE TABLE energy_node (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_node PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_node.id IS 'ID';
COMMENT ON COLUMN energy_node.name IS '名称';
COMMENT ON COLUMN energy_node.category IS '分類';
COMMENT ON COLUMN energy_node.status IS '状態';
COMMENT ON COLUMN energy_node.description IS '説明';
COMMENT ON COLUMN energy_node.energy_id IS 'エネルギID';
COMMENT ON COLUMN energy_node.specification IS '仕様';
COMMENT ON COLUMN energy_node.value IS '数量';
COMMENT ON COLUMN energy_node.unit IS '単位';
COMMENT ON COLUMN energy_node.location IS '場所';
COMMENT ON COLUMN energy_node.created_at IS '登録日時';
COMMENT ON COLUMN energy_node.updated_at IS '更新日時';
COMMENT ON COLUMN energy_node.created_by IS '作成者';
COMMENT ON COLUMN energy_node.approved_by IS '承認者';
COMMENT ON COLUMN energy_node.remark IS '備考';
COMMENT ON TABLE energy_node IS 'エネルギ接点: エネルギの供給・消費の接続点を表す。';

-- エネルギ能力: 共有可能なエネルギ供給能力を表す。
CREATE TABLE energy_capacity (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    site_id VARCHAR2(50 CHAR) NULL,
    term_id VARCHAR2(50 CHAR) NULL,
    energy_group_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    maximum_value NUMBER(18,4) NULL,
    minimum_value NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_capacity PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_capacity.id IS 'ID';
COMMENT ON COLUMN energy_capacity.name IS '名称';
COMMENT ON COLUMN energy_capacity.category IS '分類';
COMMENT ON COLUMN energy_capacity.status IS '状態';
COMMENT ON COLUMN energy_capacity.description IS '説明';
COMMENT ON COLUMN energy_capacity.site_id IS 'サイトID';
COMMENT ON COLUMN energy_capacity.term_id IS 'タームID';
COMMENT ON COLUMN energy_capacity.energy_group_id IS 'エネルギグループID';
COMMENT ON COLUMN energy_capacity.specification IS '仕様';
COMMENT ON COLUMN energy_capacity.value IS '数量';
COMMENT ON COLUMN energy_capacity.unit IS '単位';
COMMENT ON COLUMN energy_capacity.maximum_value IS '最大値';
COMMENT ON COLUMN energy_capacity.minimum_value IS '最小値';
COMMENT ON COLUMN energy_capacity.created_at IS '登録日時';
COMMENT ON COLUMN energy_capacity.updated_at IS '更新日時';
COMMENT ON COLUMN energy_capacity.created_by IS '作成者';
COMMENT ON COLUMN energy_capacity.approved_by IS '承認者';
COMMENT ON COLUMN energy_capacity.remark IS '備考';
COMMENT ON TABLE energy_capacity IS 'エネルギ能力: 共有可能なエネルギ供給能力を表す。';

-- エネルギオーダ: エネルギの供給・消費オーダを表す。
CREATE TABLE energy_order (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_node_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    due_at TIMESTAMP NULL,
    release_at TIMESTAMP NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_order PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_order.id IS 'ID';
COMMENT ON COLUMN energy_order.name IS '名称';
COMMENT ON COLUMN energy_order.category IS '分類';
COMMENT ON COLUMN energy_order.status IS '状態';
COMMENT ON COLUMN energy_order.description IS '説明';
COMMENT ON COLUMN energy_order.energy_node_id IS 'エネルギ接点ID';
COMMENT ON COLUMN energy_order.specification IS '仕様';
COMMENT ON COLUMN energy_order.value IS '数量';
COMMENT ON COLUMN energy_order.unit IS '単位';
COMMENT ON COLUMN energy_order.location IS '場所';
COMMENT ON COLUMN energy_order.due_at IS '納期';
COMMENT ON COLUMN energy_order.release_at IS '発行日時';
COMMENT ON COLUMN energy_order.start_at IS '着手日時';
COMMENT ON COLUMN energy_order.end_at IS '完了日時';
COMMENT ON COLUMN energy_order.created_at IS '登録日時';
COMMENT ON COLUMN energy_order.updated_at IS '更新日時';
COMMENT ON COLUMN energy_order.created_by IS '作成者';
COMMENT ON COLUMN energy_order.approved_by IS '承認者';
COMMENT ON COLUMN energy_order.remark IS '備考';
COMMENT ON TABLE energy_order IS 'エネルギオーダ: エネルギの供給・消費オーダを表す。';

-- エネルギ指示: エネルギの供給・消費指示を表す。
CREATE TABLE energy_schedule (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_order_id VARCHAR2(50 CHAR) NULL,
    index_no NUMBER(18,4) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    planned_value NUMBER(18,4) NULL,
    actual_value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_schedule PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_schedule.id IS 'ID';
COMMENT ON COLUMN energy_schedule.name IS '名称';
COMMENT ON COLUMN energy_schedule.category IS '分類';
COMMENT ON COLUMN energy_schedule.status IS '状態';
COMMENT ON COLUMN energy_schedule.description IS '説明';
COMMENT ON COLUMN energy_schedule.energy_order_id IS 'エネルギオーダID';
COMMENT ON COLUMN energy_schedule.index_no IS '追番';
COMMENT ON COLUMN energy_schedule.specification IS '仕様';
COMMENT ON COLUMN energy_schedule.planned_value IS '予定数量';
COMMENT ON COLUMN energy_schedule.actual_value IS '実績数量';
COMMENT ON COLUMN energy_schedule.unit IS '単位';
COMMENT ON COLUMN energy_schedule.location IS '場所';
COMMENT ON COLUMN energy_schedule.start_at IS '開始日時';
COMMENT ON COLUMN energy_schedule.end_at IS '終了日時';
COMMENT ON COLUMN energy_schedule.created_at IS '登録日時';
COMMENT ON COLUMN energy_schedule.updated_at IS '更新日時';
COMMENT ON COLUMN energy_schedule.created_by IS '作成者';
COMMENT ON COLUMN energy_schedule.approved_by IS '承認者';
COMMENT ON COLUMN energy_schedule.remark IS '備考';
COMMENT ON TABLE energy_schedule IS 'エネルギ指示: エネルギの供給・消費指示を表す。';

-- エネルギ実績: エネルギの供給・消費実績を表す。
CREATE TABLE energy_performance (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_node_id VARCHAR2(50 CHAR) NULL,
    energy_order_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    time NUMBER(18,4) NULL,
    time_unit VARCHAR2(100 CHAR) NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_performance PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_performance.id IS 'ID';
COMMENT ON COLUMN energy_performance.name IS '名称';
COMMENT ON COLUMN energy_performance.category IS '分類';
COMMENT ON COLUMN energy_performance.status IS '状態';
COMMENT ON COLUMN energy_performance.description IS '説明';
COMMENT ON COLUMN energy_performance.energy_node_id IS 'エネルギ接点ID';
COMMENT ON COLUMN energy_performance.energy_order_id IS 'エネルギオーダID';
COMMENT ON COLUMN energy_performance.specification IS '仕様';
COMMENT ON COLUMN energy_performance.value IS '数量';
COMMENT ON COLUMN energy_performance.unit IS '単位';
COMMENT ON COLUMN energy_performance.time IS '時間';
COMMENT ON COLUMN energy_performance.time_unit IS '時間単位';
COMMENT ON COLUMN energy_performance.start_at IS '開始日時';
COMMENT ON COLUMN energy_performance.end_at IS '終了日時';
COMMENT ON COLUMN energy_performance.created_at IS '登録日時';
COMMENT ON COLUMN energy_performance.updated_at IS '更新日時';
COMMENT ON COLUMN energy_performance.created_by IS '作成者';
COMMENT ON COLUMN energy_performance.approved_by IS '承認者';
COMMENT ON COLUMN energy_performance.remark IS '備考';
COMMENT ON TABLE energy_performance IS 'エネルギ実績: エネルギの供給・消費実績を表す。';

-- エネルギ結果: エネルギ接点ごとの記録結果を表す。
CREATE TABLE energy_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    energy_schedule_id VARCHAR2(50 CHAR) NULL,
    equipment_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_energy_result PRIMARY KEY (id)
);
COMMENT ON COLUMN energy_result.id IS 'ID';
COMMENT ON COLUMN energy_result.name IS '名称';
COMMENT ON COLUMN energy_result.category IS '分類';
COMMENT ON COLUMN energy_result.status IS '状態';
COMMENT ON COLUMN energy_result.description IS '説明';
COMMENT ON COLUMN energy_result.energy_schedule_id IS 'エネルギ指示ID';
COMMENT ON COLUMN energy_result.equipment_id IS '設備ID';
COMMENT ON COLUMN energy_result.specification IS '仕様';
COMMENT ON COLUMN energy_result.value IS '数量';
COMMENT ON COLUMN energy_result.unit IS '単位';
COMMENT ON COLUMN energy_result.location IS '場所';
COMMENT ON COLUMN energy_result.result_at IS '結果日時';
COMMENT ON COLUMN energy_result.created_at IS '登録日時';
COMMENT ON COLUMN energy_result.updated_at IS '更新日時';
COMMENT ON COLUMN energy_result.created_by IS '作成者';
COMMENT ON COLUMN energy_result.approved_by IS '承認者';
COMMENT ON COLUMN energy_result.remark IS '備考';
COMMENT ON TABLE energy_result IS 'エネルギ結果: エネルギ接点ごとの記録結果を表す。';

-- 得意先: 販売品目を提供する相手の事業者を表す。
CREATE TABLE customer (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_customer PRIMARY KEY (id)
);
COMMENT ON COLUMN customer.id IS 'ID';
COMMENT ON COLUMN customer.name IS '名称';
COMMENT ON COLUMN customer.category IS '分類';
COMMENT ON COLUMN customer.status IS '状態';
COMMENT ON COLUMN customer.description IS '説明';
COMMENT ON COLUMN customer.created_at IS '登録日時';
COMMENT ON COLUMN customer.updated_at IS '更新日時';
COMMENT ON COLUMN customer.created_by IS '作成者';
COMMENT ON COLUMN customer.approved_by IS '承認者';
COMMENT ON COLUMN customer.remark IS '備考';
COMMENT ON TABLE customer IS '得意先: 販売品目を提供する相手の事業者を表す。';

-- 販売品目: 得意先に提供される生産品目を表す。
CREATE TABLE sales_item (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    customer_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    lead_time NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_item PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_item.id IS 'ID';
COMMENT ON COLUMN sales_item.name IS '名称';
COMMENT ON COLUMN sales_item.category IS '分類';
COMMENT ON COLUMN sales_item.status IS '状態';
COMMENT ON COLUMN sales_item.description IS '説明';
COMMENT ON COLUMN sales_item.production_item_id IS '生産品目ID';
COMMENT ON COLUMN sales_item.customer_id IS '顧客ID';
COMMENT ON COLUMN sales_item.specification IS '仕様';
COMMENT ON COLUMN sales_item.value IS '数量';
COMMENT ON COLUMN sales_item.unit IS '単位';
COMMENT ON COLUMN sales_item.location IS '場所';
COMMENT ON COLUMN sales_item.unit_price IS '単価';
COMMENT ON COLUMN sales_item.lead_time IS '日数';
COMMENT ON COLUMN sales_item.created_at IS '登録日時';
COMMENT ON COLUMN sales_item.updated_at IS '更新日時';
COMMENT ON COLUMN sales_item.created_by IS '作成者';
COMMENT ON COLUMN sales_item.approved_by IS '承認者';
COMMENT ON COLUMN sales_item.remark IS '備考';
COMMENT ON TABLE sales_item IS '販売品目: 得意先に提供される生産品目を表す。';

-- 受注伝票: 得意先からの注文の管理単位を表す。
CREATE TABLE sales_document (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    customer_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    due_at TIMESTAMP NULL,
    order_at TIMESTAMP NULL,
    receiving_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_document PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_document.id IS 'ID';
COMMENT ON COLUMN sales_document.name IS '名称';
COMMENT ON COLUMN sales_document.category IS '分類';
COMMENT ON COLUMN sales_document.status IS '状態';
COMMENT ON COLUMN sales_document.description IS '説明';
COMMENT ON COLUMN sales_document.customer_id IS '顧客ID';
COMMENT ON COLUMN sales_document.specification IS '仕様';
COMMENT ON COLUMN sales_document.value IS '数量';
COMMENT ON COLUMN sales_document.unit IS '単位';
COMMENT ON COLUMN sales_document.unit_price IS '単価';
COMMENT ON COLUMN sales_document.price IS '金額';
COMMENT ON COLUMN sales_document.due_at IS '納期';
COMMENT ON COLUMN sales_document.order_at IS '発注日時';
COMMENT ON COLUMN sales_document.receiving_at IS '入荷日時';
COMMENT ON COLUMN sales_document.created_at IS '登録日時';
COMMENT ON COLUMN sales_document.updated_at IS '更新日時';
COMMENT ON COLUMN sales_document.created_by IS '作成者';
COMMENT ON COLUMN sales_document.approved_by IS '承認者';
COMMENT ON COLUMN sales_document.remark IS '備考';
COMMENT ON TABLE sales_document IS '受注伝票: 得意先からの注文の管理単位を表す。';

-- 受注明細: 販売品目ごとの受注内容を表す。
CREATE TABLE sales_order (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    sales_document_id VARCHAR2(50 CHAR) NULL,
    sales_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    due_at TIMESTAMP NULL,
    release_at TIMESTAMP NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_order PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_order.id IS 'ID';
COMMENT ON COLUMN sales_order.name IS '名称';
COMMENT ON COLUMN sales_order.category IS '分類';
COMMENT ON COLUMN sales_order.status IS '状態';
COMMENT ON COLUMN sales_order.description IS '説明';
COMMENT ON COLUMN sales_order.sales_document_id IS '販売伝票ID';
COMMENT ON COLUMN sales_order.sales_item_id IS '販売品目ID';
COMMENT ON COLUMN sales_order.specification IS '仕様';
COMMENT ON COLUMN sales_order.value IS '数量';
COMMENT ON COLUMN sales_order.unit IS '単位';
COMMENT ON COLUMN sales_order.location IS '場所';
COMMENT ON COLUMN sales_order.due_at IS '納期';
COMMENT ON COLUMN sales_order.release_at IS '発行日時';
COMMENT ON COLUMN sales_order.start_at IS '着手日時';
COMMENT ON COLUMN sales_order.end_at IS '完了日時';
COMMENT ON COLUMN sales_order.unit_price IS '単価';
COMMENT ON COLUMN sales_order.price IS '金額';
COMMENT ON COLUMN sales_order.created_at IS '登録日時';
COMMENT ON COLUMN sales_order.updated_at IS '更新日時';
COMMENT ON COLUMN sales_order.created_by IS '作成者';
COMMENT ON COLUMN sales_order.approved_by IS '承認者';
COMMENT ON COLUMN sales_order.remark IS '備考';
COMMENT ON TABLE sales_order IS '受注明細: 販売品目ごとの受注内容を表す。';

-- 販売仕様: 得意先ごとの販売条件・仕様を表す。
CREATE TABLE sales_specification (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    customer_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_specification PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_specification.id IS 'ID';
COMMENT ON COLUMN sales_specification.name IS '名称';
COMMENT ON COLUMN sales_specification.category IS '分類';
COMMENT ON COLUMN sales_specification.status IS '状態';
COMMENT ON COLUMN sales_specification.description IS '説明';
COMMENT ON COLUMN sales_specification.customer_id IS '顧客ID';
COMMENT ON COLUMN sales_specification.specification IS '仕様';
COMMENT ON COLUMN sales_specification.value IS '数量';
COMMENT ON COLUMN sales_specification.unit IS '単位';
COMMENT ON COLUMN sales_specification.created_at IS '登録日時';
COMMENT ON COLUMN sales_specification.updated_at IS '更新日時';
COMMENT ON COLUMN sales_specification.created_by IS '作成者';
COMMENT ON COLUMN sales_specification.approved_by IS '承認者';
COMMENT ON COLUMN sales_specification.remark IS '備考';
COMMENT ON TABLE sales_specification IS '販売仕様: 得意先ごとの販売条件・仕様を表す。';

-- 販売請求: 得意先に発行する請求情報を表す。
CREATE TABLE sales_invoice (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    customer_id VARCHAR2(50 CHAR) NULL,
    shipping_result_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    invoice_at TIMESTAMP NULL,
    payment_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_invoice PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_invoice.id IS 'ID';
COMMENT ON COLUMN sales_invoice.name IS '名称';
COMMENT ON COLUMN sales_invoice.category IS '分類';
COMMENT ON COLUMN sales_invoice.status IS '状態';
COMMENT ON COLUMN sales_invoice.description IS '説明';
COMMENT ON COLUMN sales_invoice.customer_id IS '顧客ID';
COMMENT ON COLUMN sales_invoice.shipping_result_id IS '出荷実績ID';
COMMENT ON COLUMN sales_invoice.specification IS '仕様';
COMMENT ON COLUMN sales_invoice.value IS '数量';
COMMENT ON COLUMN sales_invoice.unit IS '単位';
COMMENT ON COLUMN sales_invoice.unit_price IS '単価';
COMMENT ON COLUMN sales_invoice.price IS '金額';
COMMENT ON COLUMN sales_invoice.invoice_at IS '請求日時';
COMMENT ON COLUMN sales_invoice.payment_at IS '支払日時';
COMMENT ON COLUMN sales_invoice.created_at IS '登録日時';
COMMENT ON COLUMN sales_invoice.updated_at IS '更新日時';
COMMENT ON COLUMN sales_invoice.created_by IS '作成者';
COMMENT ON COLUMN sales_invoice.approved_by IS '承認者';
COMMENT ON COLUMN sales_invoice.remark IS '備考';
COMMENT ON TABLE sales_invoice IS '販売請求: 得意先に発行する請求情報を表す。';

-- 受注内示: 得意先からの需要予測情報を表す。
CREATE TABLE sales_forecast (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    sales_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    forecast_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_forecast PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_forecast.id IS 'ID';
COMMENT ON COLUMN sales_forecast.name IS '名称';
COMMENT ON COLUMN sales_forecast.category IS '分類';
COMMENT ON COLUMN sales_forecast.status IS '状態';
COMMENT ON COLUMN sales_forecast.description IS '説明';
COMMENT ON COLUMN sales_forecast.sales_item_id IS '販売品目ID';
COMMENT ON COLUMN sales_forecast.specification IS '仕様';
COMMENT ON COLUMN sales_forecast.value IS '数量';
COMMENT ON COLUMN sales_forecast.unit IS '単位';
COMMENT ON COLUMN sales_forecast.forecast_at IS '内示日時';
COMMENT ON COLUMN sales_forecast.created_at IS '登録日時';
COMMENT ON COLUMN sales_forecast.updated_at IS '更新日時';
COMMENT ON COLUMN sales_forecast.created_by IS '作成者';
COMMENT ON COLUMN sales_forecast.approved_by IS '承認者';
COMMENT ON COLUMN sales_forecast.remark IS '備考';
COMMENT ON TABLE sales_forecast IS '受注内示: 得意先からの需要予測情報を表す。';

-- 販売見積: 得意先への見積依頼と回答を表す。
CREATE TABLE sales_quotation (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    customer_id VARCHAR2(50 CHAR) NULL,
    sales_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    due_at TIMESTAMP NULL,
    quotation_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_sales_quotation PRIMARY KEY (id)
);
COMMENT ON COLUMN sales_quotation.id IS 'ID';
COMMENT ON COLUMN sales_quotation.name IS '名称';
COMMENT ON COLUMN sales_quotation.category IS '分類';
COMMENT ON COLUMN sales_quotation.status IS '状態';
COMMENT ON COLUMN sales_quotation.description IS '説明';
COMMENT ON COLUMN sales_quotation.customer_id IS '顧客ID';
COMMENT ON COLUMN sales_quotation.sales_item_id IS '販売品目ID';
COMMENT ON COLUMN sales_quotation.specification IS '仕様';
COMMENT ON COLUMN sales_quotation.value IS '数量';
COMMENT ON COLUMN sales_quotation.unit IS '単位';
COMMENT ON COLUMN sales_quotation.unit_price IS '単価';
COMMENT ON COLUMN sales_quotation.price IS '金額';
COMMENT ON COLUMN sales_quotation.due_at IS '納期';
COMMENT ON COLUMN sales_quotation.quotation_at IS '見積日時';
COMMENT ON COLUMN sales_quotation.created_at IS '登録日時';
COMMENT ON COLUMN sales_quotation.updated_at IS '更新日時';
COMMENT ON COLUMN sales_quotation.created_by IS '作成者';
COMMENT ON COLUMN sales_quotation.approved_by IS '承認者';
COMMENT ON COLUMN sales_quotation.remark IS '備考';
COMMENT ON TABLE sales_quotation IS '販売見積: 得意先への見積依頼と回答を表す。';

-- 出荷明細: 販売品目の出荷結果を表す。
CREATE TABLE shipping_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    sales_order_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_shipping_result PRIMARY KEY (id)
);
COMMENT ON COLUMN shipping_result.id IS 'ID';
COMMENT ON COLUMN shipping_result.name IS '名称';
COMMENT ON COLUMN shipping_result.category IS '分類';
COMMENT ON COLUMN shipping_result.status IS '状態';
COMMENT ON COLUMN shipping_result.description IS '説明';
COMMENT ON COLUMN shipping_result.sales_order_id IS '販売オーダID';
COMMENT ON COLUMN shipping_result.specification IS '仕様';
COMMENT ON COLUMN shipping_result.value IS '数量';
COMMENT ON COLUMN shipping_result.unit IS '単位';
COMMENT ON COLUMN shipping_result.location IS '場所';
COMMENT ON COLUMN shipping_result.result_at IS '結果日時';
COMMENT ON COLUMN shipping_result.created_at IS '登録日時';
COMMENT ON COLUMN shipping_result.updated_at IS '更新日時';
COMMENT ON COLUMN shipping_result.created_by IS '作成者';
COMMENT ON COLUMN shipping_result.approved_by IS '承認者';
COMMENT ON COLUMN shipping_result.remark IS '備考';
COMMENT ON TABLE shipping_result IS '出荷明細: 販売品目の出荷結果を表す。';

-- 仕入先: 資材・部品を調達する相手の事業者を表す。
CREATE TABLE supplier (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_supplier PRIMARY KEY (id)
);
COMMENT ON COLUMN supplier.id IS 'ID';
COMMENT ON COLUMN supplier.name IS '名称';
COMMENT ON COLUMN supplier.category IS '分類';
COMMENT ON COLUMN supplier.status IS '状態';
COMMENT ON COLUMN supplier.description IS '説明';
COMMENT ON COLUMN supplier.created_at IS '登録日時';
COMMENT ON COLUMN supplier.updated_at IS '更新日時';
COMMENT ON COLUMN supplier.created_by IS '作成者';
COMMENT ON COLUMN supplier.approved_by IS '承認者';
COMMENT ON COLUMN supplier.remark IS '備考';
COMMENT ON TABLE supplier IS '仕入先: 資材・部品を調達する相手の事業者を表す。';

-- 購買品目: 仕入先から提供される生産品目を表す。
CREATE TABLE purchase_item (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    production_item_id VARCHAR2(50 CHAR) NULL,
    supplier_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    lead_time NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_item PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_item.id IS 'ID';
COMMENT ON COLUMN purchase_item.name IS '名称';
COMMENT ON COLUMN purchase_item.category IS '分類';
COMMENT ON COLUMN purchase_item.status IS '状態';
COMMENT ON COLUMN purchase_item.description IS '説明';
COMMENT ON COLUMN purchase_item.production_item_id IS '生産品目ID';
COMMENT ON COLUMN purchase_item.supplier_id IS '仕入先ID';
COMMENT ON COLUMN purchase_item.specification IS '仕様';
COMMENT ON COLUMN purchase_item.value IS '数量';
COMMENT ON COLUMN purchase_item.unit IS '単位';
COMMENT ON COLUMN purchase_item.location IS '場所';
COMMENT ON COLUMN purchase_item.unit_price IS '単価';
COMMENT ON COLUMN purchase_item.lead_time IS '日数';
COMMENT ON COLUMN purchase_item.created_at IS '登録日時';
COMMENT ON COLUMN purchase_item.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_item.created_by IS '作成者';
COMMENT ON COLUMN purchase_item.approved_by IS '承認者';
COMMENT ON COLUMN purchase_item.remark IS '備考';
COMMENT ON TABLE purchase_item IS '購買品目: 仕入先から提供される生産品目を表す。';

-- 購買伝票: 仕入先への注文の管理単位を表す。
CREATE TABLE purchase_document (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    supplier_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    due_at TIMESTAMP NULL,
    order_at TIMESTAMP NULL,
    receiving_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_document PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_document.id IS 'ID';
COMMENT ON COLUMN purchase_document.name IS '名称';
COMMENT ON COLUMN purchase_document.category IS '分類';
COMMENT ON COLUMN purchase_document.status IS '状態';
COMMENT ON COLUMN purchase_document.description IS '説明';
COMMENT ON COLUMN purchase_document.supplier_id IS '仕入先ID';
COMMENT ON COLUMN purchase_document.specification IS '仕様';
COMMENT ON COLUMN purchase_document.value IS '数量';
COMMENT ON COLUMN purchase_document.unit IS '単位';
COMMENT ON COLUMN purchase_document.unit_price IS '単価';
COMMENT ON COLUMN purchase_document.price IS '金額';
COMMENT ON COLUMN purchase_document.due_at IS '納期';
COMMENT ON COLUMN purchase_document.order_at IS '発注日時';
COMMENT ON COLUMN purchase_document.receiving_at IS '入荷日時';
COMMENT ON COLUMN purchase_document.created_at IS '登録日時';
COMMENT ON COLUMN purchase_document.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_document.created_by IS '作成者';
COMMENT ON COLUMN purchase_document.approved_by IS '承認者';
COMMENT ON COLUMN purchase_document.remark IS '備考';
COMMENT ON TABLE purchase_document IS '購買伝票: 仕入先への注文の管理単位を表す。';

-- 購買明細: 仕入先への個々の注文内容を表す。
CREATE TABLE purchase_order (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    purchase_document_id VARCHAR2(50 CHAR) NULL,
    purchase_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    due_at TIMESTAMP NULL,
    release_at TIMESTAMP NULL,
    start_at TIMESTAMP NULL,
    end_at TIMESTAMP NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_order PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_order.id IS 'ID';
COMMENT ON COLUMN purchase_order.name IS '名称';
COMMENT ON COLUMN purchase_order.category IS '分類';
COMMENT ON COLUMN purchase_order.status IS '状態';
COMMENT ON COLUMN purchase_order.description IS '説明';
COMMENT ON COLUMN purchase_order.purchase_document_id IS '購買伝票ID';
COMMENT ON COLUMN purchase_order.purchase_item_id IS '購買品目ID';
COMMENT ON COLUMN purchase_order.specification IS '仕様';
COMMENT ON COLUMN purchase_order.value IS '数量';
COMMENT ON COLUMN purchase_order.unit IS '単位';
COMMENT ON COLUMN purchase_order.location IS '場所';
COMMENT ON COLUMN purchase_order.due_at IS '納期';
COMMENT ON COLUMN purchase_order.release_at IS '発行日時';
COMMENT ON COLUMN purchase_order.start_at IS '着手日時';
COMMENT ON COLUMN purchase_order.end_at IS '完了日時';
COMMENT ON COLUMN purchase_order.unit_price IS '単価';
COMMENT ON COLUMN purchase_order.price IS '金額';
COMMENT ON COLUMN purchase_order.created_at IS '登録日時';
COMMENT ON COLUMN purchase_order.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_order.created_by IS '作成者';
COMMENT ON COLUMN purchase_order.approved_by IS '承認者';
COMMENT ON COLUMN purchase_order.remark IS '備考';
COMMENT ON TABLE purchase_order IS '購買明細: 仕入先への個々の注文内容を表す。';

-- 購買仕様: 仕入先ごとの購買条件・仕様を表す。
CREATE TABLE purchase_specification (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    supplier_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_specification PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_specification.id IS 'ID';
COMMENT ON COLUMN purchase_specification.name IS '名称';
COMMENT ON COLUMN purchase_specification.category IS '分類';
COMMENT ON COLUMN purchase_specification.status IS '状態';
COMMENT ON COLUMN purchase_specification.description IS '説明';
COMMENT ON COLUMN purchase_specification.supplier_id IS '仕入先ID';
COMMENT ON COLUMN purchase_specification.specification IS '仕様';
COMMENT ON COLUMN purchase_specification.value IS '数量';
COMMENT ON COLUMN purchase_specification.unit IS '単位';
COMMENT ON COLUMN purchase_specification.created_at IS '登録日時';
COMMENT ON COLUMN purchase_specification.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_specification.created_by IS '作成者';
COMMENT ON COLUMN purchase_specification.approved_by IS '承認者';
COMMENT ON COLUMN purchase_specification.remark IS '備考';
COMMENT ON TABLE purchase_specification IS '購買仕様: 仕入先ごとの購買条件・仕様を表す。';

-- 購買請求: 仕入先から受け取る請求情報を表す。
CREATE TABLE purchase_invoice (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    supplier_id VARCHAR2(50 CHAR) NULL,
    receiving_result_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    invoice_at TIMESTAMP NULL,
    payment_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_invoice PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_invoice.id IS 'ID';
COMMENT ON COLUMN purchase_invoice.name IS '名称';
COMMENT ON COLUMN purchase_invoice.category IS '分類';
COMMENT ON COLUMN purchase_invoice.status IS '状態';
COMMENT ON COLUMN purchase_invoice.description IS '説明';
COMMENT ON COLUMN purchase_invoice.supplier_id IS '仕入先ID';
COMMENT ON COLUMN purchase_invoice.receiving_result_id IS '入荷実績ID';
COMMENT ON COLUMN purchase_invoice.specification IS '仕様';
COMMENT ON COLUMN purchase_invoice.value IS '数量';
COMMENT ON COLUMN purchase_invoice.unit IS '単位';
COMMENT ON COLUMN purchase_invoice.unit_price IS '単価';
COMMENT ON COLUMN purchase_invoice.price IS '金額';
COMMENT ON COLUMN purchase_invoice.invoice_at IS '請求日時';
COMMENT ON COLUMN purchase_invoice.payment_at IS '支払日時';
COMMENT ON COLUMN purchase_invoice.created_at IS '登録日時';
COMMENT ON COLUMN purchase_invoice.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_invoice.created_by IS '作成者';
COMMENT ON COLUMN purchase_invoice.approved_by IS '承認者';
COMMENT ON COLUMN purchase_invoice.remark IS '備考';
COMMENT ON TABLE purchase_invoice IS '購買請求: 仕入先から受け取る請求情報を表す。';

-- 仕入内示: 仕入先への仕入予測通知を表す。
CREATE TABLE purchase_forecast (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    purchase_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    forecast_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_forecast PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_forecast.id IS 'ID';
COMMENT ON COLUMN purchase_forecast.name IS '名称';
COMMENT ON COLUMN purchase_forecast.category IS '分類';
COMMENT ON COLUMN purchase_forecast.status IS '状態';
COMMENT ON COLUMN purchase_forecast.description IS '説明';
COMMENT ON COLUMN purchase_forecast.purchase_item_id IS '購買品目ID';
COMMENT ON COLUMN purchase_forecast.specification IS '仕様';
COMMENT ON COLUMN purchase_forecast.value IS '数量';
COMMENT ON COLUMN purchase_forecast.unit IS '単位';
COMMENT ON COLUMN purchase_forecast.forecast_at IS '内示日時';
COMMENT ON COLUMN purchase_forecast.created_at IS '登録日時';
COMMENT ON COLUMN purchase_forecast.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_forecast.created_by IS '作成者';
COMMENT ON COLUMN purchase_forecast.approved_by IS '承認者';
COMMENT ON COLUMN purchase_forecast.remark IS '備考';
COMMENT ON TABLE purchase_forecast IS '仕入内示: 仕入先への仕入予測通知を表す。';

-- 購買見積: 仕入先への見積依頼と回答を表す。
CREATE TABLE purchase_quotation (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    supplier_id VARCHAR2(50 CHAR) NULL,
    purchase_item_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    unit_price NUMBER(18,4) NULL,
    price NUMBER(18,4) NULL,
    due_at TIMESTAMP NULL,
    quotation_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_purchase_quotation PRIMARY KEY (id)
);
COMMENT ON COLUMN purchase_quotation.id IS 'ID';
COMMENT ON COLUMN purchase_quotation.name IS '名称';
COMMENT ON COLUMN purchase_quotation.category IS '分類';
COMMENT ON COLUMN purchase_quotation.status IS '状態';
COMMENT ON COLUMN purchase_quotation.description IS '説明';
COMMENT ON COLUMN purchase_quotation.supplier_id IS '仕入先ID';
COMMENT ON COLUMN purchase_quotation.purchase_item_id IS '購買品目ID';
COMMENT ON COLUMN purchase_quotation.specification IS '仕様';
COMMENT ON COLUMN purchase_quotation.value IS '数量';
COMMENT ON COLUMN purchase_quotation.unit IS '単位';
COMMENT ON COLUMN purchase_quotation.unit_price IS '単価';
COMMENT ON COLUMN purchase_quotation.price IS '金額';
COMMENT ON COLUMN purchase_quotation.due_at IS '納期';
COMMENT ON COLUMN purchase_quotation.quotation_at IS '見積日時';
COMMENT ON COLUMN purchase_quotation.created_at IS '登録日時';
COMMENT ON COLUMN purchase_quotation.updated_at IS '更新日時';
COMMENT ON COLUMN purchase_quotation.created_by IS '作成者';
COMMENT ON COLUMN purchase_quotation.approved_by IS '承認者';
COMMENT ON COLUMN purchase_quotation.remark IS '備考';
COMMENT ON TABLE purchase_quotation IS '購買見積: 仕入先への見積依頼と回答を表す。';

-- 入荷明細: 購買品目の入荷結果を表す。
CREATE TABLE receiving_result (
    id VARCHAR2(50 CHAR) NOT NULL,
    name VARCHAR2(255 CHAR) NULL,
    category VARCHAR2(100 CHAR) NULL,
    status VARCHAR2(100 CHAR) NULL,
    description VARCHAR2(255 CHAR) NULL,
    purchase_order_id VARCHAR2(50 CHAR) NULL,
    specification VARCHAR2(255 CHAR) NULL,
    value NUMBER(18,4) NULL,
    unit VARCHAR2(100 CHAR) NULL,
    location VARCHAR2(100 CHAR) NULL,
    result_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR2(255 CHAR) NULL,
    approved_by VARCHAR2(255 CHAR) NULL,
    remark VARCHAR2(255 CHAR) NULL,
    CONSTRAINT pk_receiving_result PRIMARY KEY (id)
);
COMMENT ON COLUMN receiving_result.id IS 'ID';
COMMENT ON COLUMN receiving_result.name IS '名称';
COMMENT ON COLUMN receiving_result.category IS '分類';
COMMENT ON COLUMN receiving_result.status IS '状態';
COMMENT ON COLUMN receiving_result.description IS '説明';
COMMENT ON COLUMN receiving_result.purchase_order_id IS '購買オーダID';
COMMENT ON COLUMN receiving_result.specification IS '仕様';
COMMENT ON COLUMN receiving_result.value IS '数量';
COMMENT ON COLUMN receiving_result.unit IS '単位';
COMMENT ON COLUMN receiving_result.location IS '場所';
COMMENT ON COLUMN receiving_result.result_at IS '結果日時';
COMMENT ON COLUMN receiving_result.created_at IS '登録日時';
COMMENT ON COLUMN receiving_result.updated_at IS '更新日時';
COMMENT ON COLUMN receiving_result.created_by IS '作成者';
COMMENT ON COLUMN receiving_result.approved_by IS '承認者';
COMMENT ON COLUMN receiving_result.remark IS '備考';
COMMENT ON TABLE receiving_result IS '入荷明細: 購買品目の入荷結果を表す。';

-- ============================================================
-- Foreign Key Constraints
-- ============================================================
ALTER TABLE area ADD CONSTRAINT fk_001 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE site ADD CONSTRAINT fk_002 FOREIGN KEY (enterprise_id) REFERENCES enterprise (id);
ALTER TABLE production_line ADD CONSTRAINT fk_003 FOREIGN KEY (area_id) REFERENCES area (id);
ALTER TABLE calendar ADD CONSTRAINT fk_004 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE term ADD CONSTRAINT fk_005 FOREIGN KEY (calendar_id) REFERENCES calendar (id);
ALTER TABLE production_plan ADD CONSTRAINT fk_006 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE production_plan ADD CONSTRAINT fk_007 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_plan ADD CONSTRAINT fk_008 FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE capacity_plan ADD CONSTRAINT fk_009 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE capacity_plan ADD CONSTRAINT fk_010 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE capacity_plan ADD CONSTRAINT fk_011 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE sales_plan ADD CONSTRAINT fk_012 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE sales_plan ADD CONSTRAINT fk_013 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE purchase_plan ADD CONSTRAINT fk_014 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE purchase_plan ADD CONSTRAINT fk_015 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE asset ADD CONSTRAINT fk_016 FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_017 FOREIGN KEY (parent_asset_group_id) REFERENCES asset_group (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_018 FOREIGN KEY (child_asset_group_id) REFERENCES asset_group (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_019 FOREIGN KEY (parent_asset_id) REFERENCES asset (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_020 FOREIGN KEY (child_asset_id) REFERENCES asset (id);
ALTER TABLE asset_specification ADD CONSTRAINT fk_021 FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE monitoring_content ADD CONSTRAINT fk_022 FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE monitoring_result ADD CONSTRAINT fk_023 FOREIGN KEY (monitoring_content_id) REFERENCES monitoring_content (id);
ALTER TABLE monitoring_result ADD CONSTRAINT fk_024 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_item ADD CONSTRAINT fk_025 FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE production_item ADD CONSTRAINT fk_026 FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item ADD CONSTRAINT fk_027 FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_item_group ADD CONSTRAINT fk_028 FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_029 FOREIGN KEY (parent_production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_030 FOREIGN KEY (child_production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_031 FOREIGN KEY (parent_production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_032 FOREIGN KEY (child_production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_function ADD CONSTRAINT fk_033 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_specification ADD CONSTRAINT fk_034 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_portion ADD CONSTRAINT fk_035 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_document ADD CONSTRAINT fk_036 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_issue ADD CONSTRAINT fk_037 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_issue ADD CONSTRAINT fk_038 FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item_countermeasure ADD CONSTRAINT fk_039 FOREIGN KEY (production_item_issue_id) REFERENCES production_item_issue (id);
ALTER TABLE production_item_result ADD CONSTRAINT fk_040 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_result ADD CONSTRAINT fk_041 FOREIGN KEY (production_schedule_id) REFERENCES production_schedule (id);
ALTER TABLE production_process ADD CONSTRAINT fk_042 FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_operation ADD CONSTRAINT fk_043 FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_operation ADD CONSTRAINT fk_044 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE production_operation ADD CONSTRAINT fk_045 FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE production_content ADD CONSTRAINT fk_046 FOREIGN KEY (production_operation_id) REFERENCES production_operation (id);
ALTER TABLE production_assignment ADD CONSTRAINT fk_047 FOREIGN KEY (production_operation_id) REFERENCES production_operation (id);
ALTER TABLE production_assignment ADD CONSTRAINT fk_048 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_assignment ADD CONSTRAINT fk_049 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE production_capacity ADD CONSTRAINT fk_050 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_capacity ADD CONSTRAINT fk_051 FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_order ADD CONSTRAINT fk_052 FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_053 FOREIGN KEY (production_order_id) REFERENCES production_order (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_054 FOREIGN KEY (production_operation_id) REFERENCES production_operation (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_055 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_056 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_057 FOREIGN KEY (production_line_id) REFERENCES production_line (id);
ALTER TABLE production_performance ADD CONSTRAINT fk_058 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_performance ADD CONSTRAINT fk_059 FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_result ADD CONSTRAINT fk_060 FOREIGN KEY (production_schedule_id) REFERENCES production_schedule (id);
ALTER TABLE production_result ADD CONSTRAINT fk_061 FOREIGN KEY (production_content_id) REFERENCES production_content (id);
ALTER TABLE production_result ADD CONSTRAINT fk_062 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE production_document ADD CONSTRAINT fk_063 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_issue ADD CONSTRAINT fk_064 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_issue ADD CONSTRAINT fk_065 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE production_countermeasure ADD CONSTRAINT fk_066 FOREIGN KEY (production_issue_id) REFERENCES production_issue (id);
ALTER TABLE equipment ADD CONSTRAINT fk_067 FOREIGN KEY (production_line_id) REFERENCES production_line (id);
ALTER TABLE equipment ADD CONSTRAINT fk_068 FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE equipment ADD CONSTRAINT fk_069 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment ADD CONSTRAINT fk_070 FOREIGN KEY (energy_node_id) REFERENCES energy_node (id);
ALTER TABLE equipment_group ADD CONSTRAINT fk_071 FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_072 FOREIGN KEY (parent_equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_073 FOREIGN KEY (child_equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_074 FOREIGN KEY (parent_equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_075 FOREIGN KEY (child_equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_function ADD CONSTRAINT fk_076 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_specification ADD CONSTRAINT fk_077 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_portion ADD CONSTRAINT fk_078 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_document ADD CONSTRAINT fk_079 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_issue ADD CONSTRAINT fk_080 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_issue ADD CONSTRAINT fk_081 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_countermeasure ADD CONSTRAINT fk_082 FOREIGN KEY (equipment_issue_id) REFERENCES equipment_issue (id);
ALTER TABLE equipment_operation ADD CONSTRAINT fk_083 FOREIGN KEY (equipment_process_id) REFERENCES equipment_process (id);
ALTER TABLE equipment_operation ADD CONSTRAINT fk_084 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_operation ADD CONSTRAINT fk_085 FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE equipment_content ADD CONSTRAINT fk_086 FOREIGN KEY (equipment_operation_id) REFERENCES equipment_operation (id);
ALTER TABLE equipment_assignment ADD CONSTRAINT fk_087 FOREIGN KEY (equipment_operation_id) REFERENCES equipment_operation (id);
ALTER TABLE equipment_assignment ADD CONSTRAINT fk_088 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_assignment ADD CONSTRAINT fk_089 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE equipment_capacity ADD CONSTRAINT fk_090 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE equipment_capacity ADD CONSTRAINT fk_091 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_order ADD CONSTRAINT fk_092 FOREIGN KEY (equipment_process_id) REFERENCES equipment_process (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_093 FOREIGN KEY (equipment_operation_id) REFERENCES equipment_operation (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_094 FOREIGN KEY (equipment_order_id) REFERENCES equipment_order (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_095 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_096 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE equipment_performance ADD CONSTRAINT fk_097 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE equipment_performance ADD CONSTRAINT fk_098 FOREIGN KEY (equipment_process_id) REFERENCES equipment_process (id);
ALTER TABLE equipment_result ADD CONSTRAINT fk_099 FOREIGN KEY (equipment_content_id) REFERENCES equipment_content (id);
ALTER TABLE equipment_result ADD CONSTRAINT fk_100 FOREIGN KEY (equipment_schedule_id) REFERENCES equipment_schedule (id);
ALTER TABLE personnel ADD CONSTRAINT fk_101 FOREIGN KEY (production_line_id) REFERENCES production_line (id);
ALTER TABLE personnel ADD CONSTRAINT fk_102 FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE personnel ADD CONSTRAINT fk_103 FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE personnel_group ADD CONSTRAINT fk_104 FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE personnel_structure ADD CONSTRAINT fk_105 FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE personnel_structure ADD CONSTRAINT fk_106 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_skill ADD CONSTRAINT fk_107 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_specification ADD CONSTRAINT fk_108 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_portion ADD CONSTRAINT fk_109 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_document ADD CONSTRAINT fk_110 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_issue ADD CONSTRAINT fk_111 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_issue ADD CONSTRAINT fk_112 FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE personnel_countermeasure ADD CONSTRAINT fk_113 FOREIGN KEY (personnel_issue_id) REFERENCES personnel_issue (id);
ALTER TABLE work_operation ADD CONSTRAINT fk_114 FOREIGN KEY (work_process_id) REFERENCES work_process (id);
ALTER TABLE work_operation ADD CONSTRAINT fk_115 FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE work_operation ADD CONSTRAINT fk_116 FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE work_content ADD CONSTRAINT fk_117 FOREIGN KEY (work_operation_id) REFERENCES work_operation (id);
ALTER TABLE work_assignment ADD CONSTRAINT fk_118 FOREIGN KEY (work_operation_id) REFERENCES work_operation (id);
ALTER TABLE work_assignment ADD CONSTRAINT fk_119 FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE work_assignment ADD CONSTRAINT fk_120 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE work_capacity ADD CONSTRAINT fk_121 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE work_capacity ADD CONSTRAINT fk_122 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE work_order ADD CONSTRAINT fk_123 FOREIGN KEY (work_process_id) REFERENCES work_process (id);
ALTER TABLE work_schedule ADD CONSTRAINT fk_124 FOREIGN KEY (work_order_id) REFERENCES work_order (id);
ALTER TABLE work_performance ADD CONSTRAINT fk_125 FOREIGN KEY (work_order_id) REFERENCES work_order (id);
ALTER TABLE work_performance ADD CONSTRAINT fk_126 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE work_result ADD CONSTRAINT fk_127 FOREIGN KEY (work_schedule_id) REFERENCES work_schedule (id);
ALTER TABLE work_result ADD CONSTRAINT fk_128 FOREIGN KEY (work_content_id) REFERENCES work_content (id);
ALTER TABLE inventory_item ADD CONSTRAINT fk_129 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE inventory_capacity ADD CONSTRAINT fk_130 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE inventory_capacity ADD CONSTRAINT fk_131 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE inventory_capacity ADD CONSTRAINT fk_132 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE inventory_order ADD CONSTRAINT fk_133 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE inventory_order ADD CONSTRAINT fk_134 FOREIGN KEY (production_order_id) REFERENCES production_order (id);
ALTER TABLE inventory_schedule ADD CONSTRAINT fk_135 FOREIGN KEY (inventory_order_id) REFERENCES inventory_order (id);
ALTER TABLE inventory_schedule ADD CONSTRAINT fk_136 FOREIGN KEY (from_inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_schedule ADD CONSTRAINT fk_137 FOREIGN KEY (to_inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_transfer ADD CONSTRAINT fk_138 FOREIGN KEY (inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_transfer ADD CONSTRAINT fk_139 FOREIGN KEY (inventory_schedule_id) REFERENCES inventory_schedule (id);
ALTER TABLE inventory_result ADD CONSTRAINT fk_140 FOREIGN KEY (inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_result ADD CONSTRAINT fk_141 FOREIGN KEY (inventory_schedule_id) REFERENCES inventory_schedule (id);
ALTER TABLE energy ADD CONSTRAINT fk_142 FOREIGN KEY (energy_group_id) REFERENCES energy_group (id);
ALTER TABLE energy_structure ADD CONSTRAINT fk_143 FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_function ADD CONSTRAINT fk_144 FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_specification ADD CONSTRAINT fk_145 FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_node ADD CONSTRAINT fk_146 FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_capacity ADD CONSTRAINT fk_147 FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE energy_capacity ADD CONSTRAINT fk_148 FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE energy_capacity ADD CONSTRAINT fk_149 FOREIGN KEY (energy_group_id) REFERENCES energy_group (id);
ALTER TABLE energy_order ADD CONSTRAINT fk_150 FOREIGN KEY (energy_node_id) REFERENCES energy_node (id);
ALTER TABLE energy_schedule ADD CONSTRAINT fk_151 FOREIGN KEY (energy_order_id) REFERENCES energy_order (id);
ALTER TABLE energy_performance ADD CONSTRAINT fk_152 FOREIGN KEY (energy_node_id) REFERENCES energy_node (id);
ALTER TABLE energy_performance ADD CONSTRAINT fk_153 FOREIGN KEY (energy_order_id) REFERENCES energy_order (id);
ALTER TABLE energy_result ADD CONSTRAINT fk_154 FOREIGN KEY (energy_schedule_id) REFERENCES energy_schedule (id);
ALTER TABLE energy_result ADD CONSTRAINT fk_155 FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE sales_item ADD CONSTRAINT fk_156 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE sales_item ADD CONSTRAINT fk_157 FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_document ADD CONSTRAINT fk_158 FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_order ADD CONSTRAINT fk_159 FOREIGN KEY (sales_document_id) REFERENCES sales_document (id);
ALTER TABLE sales_order ADD CONSTRAINT fk_160 FOREIGN KEY (sales_item_id) REFERENCES sales_item (id);
ALTER TABLE sales_specification ADD CONSTRAINT fk_161 FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_invoice ADD CONSTRAINT fk_162 FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_invoice ADD CONSTRAINT fk_163 FOREIGN KEY (shipping_result_id) REFERENCES shipping_result (id);
ALTER TABLE sales_forecast ADD CONSTRAINT fk_164 FOREIGN KEY (sales_item_id) REFERENCES sales_item (id);
ALTER TABLE sales_quotation ADD CONSTRAINT fk_165 FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_quotation ADD CONSTRAINT fk_166 FOREIGN KEY (sales_item_id) REFERENCES sales_item (id);
ALTER TABLE shipping_result ADD CONSTRAINT fk_167 FOREIGN KEY (sales_order_id) REFERENCES sales_order (id);
ALTER TABLE purchase_item ADD CONSTRAINT fk_168 FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE purchase_item ADD CONSTRAINT fk_169 FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_document ADD CONSTRAINT fk_170 FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_order ADD CONSTRAINT fk_171 FOREIGN KEY (purchase_document_id) REFERENCES purchase_document (id);
ALTER TABLE purchase_order ADD CONSTRAINT fk_172 FOREIGN KEY (purchase_item_id) REFERENCES purchase_item (id);
ALTER TABLE purchase_specification ADD CONSTRAINT fk_173 FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_invoice ADD CONSTRAINT fk_174 FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_invoice ADD CONSTRAINT fk_175 FOREIGN KEY (receiving_result_id) REFERENCES receiving_result (id);
ALTER TABLE purchase_forecast ADD CONSTRAINT fk_176 FOREIGN KEY (purchase_item_id) REFERENCES purchase_item (id);
ALTER TABLE purchase_quotation ADD CONSTRAINT fk_177 FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_quotation ADD CONSTRAINT fk_178 FOREIGN KEY (purchase_item_id) REFERENCES purchase_item (id);
ALTER TABLE receiving_result ADD CONSTRAINT fk_179 FOREIGN KEY (purchase_order_id) REFERENCES purchase_order (id);

-- ============================================================
-- Indexes on Foreign Key Columns
-- (Oracle does not auto-index FK columns; added to avoid
--  locking/performance issues on parent-table DML and joins)
-- ============================================================
CREATE INDEX ix_001 ON area (site_id);
CREATE INDEX ix_002 ON site (enterprise_id);
CREATE INDEX ix_003 ON production_line (area_id);
CREATE INDEX ix_004 ON calendar (site_id);
CREATE INDEX ix_005 ON term (calendar_id);
CREATE INDEX ix_006 ON production_plan (site_id);
CREATE INDEX ix_007 ON production_plan (term_id);
CREATE INDEX ix_008 ON production_plan (production_item_group_id);
CREATE INDEX ix_009 ON capacity_plan (site_id);
CREATE INDEX ix_010 ON capacity_plan (term_id);
CREATE INDEX ix_011 ON capacity_plan (equipment_group_id);
CREATE INDEX ix_012 ON sales_plan (site_id);
CREATE INDEX ix_013 ON sales_plan (term_id);
CREATE INDEX ix_014 ON purchase_plan (site_id);
CREATE INDEX ix_015 ON purchase_plan (term_id);
CREATE INDEX ix_016 ON asset (asset_group_id);
CREATE INDEX ix_017 ON asset_structure (parent_asset_group_id);
CREATE INDEX ix_018 ON asset_structure (child_asset_group_id);
CREATE INDEX ix_019 ON asset_structure (parent_asset_id);
CREATE INDEX ix_020 ON asset_structure (child_asset_id);
CREATE INDEX ix_021 ON asset_specification (asset_id);
CREATE INDEX ix_022 ON monitoring_content (asset_id);
CREATE INDEX ix_023 ON monitoring_result (monitoring_content_id);
CREATE INDEX ix_024 ON monitoring_result (term_id);
CREATE INDEX ix_025 ON production_item (asset_id);
CREATE INDEX ix_026 ON production_item (production_item_group_id);
CREATE INDEX ix_027 ON production_item (production_process_id);
CREATE INDEX ix_028 ON production_item_group (asset_group_id);
CREATE INDEX ix_029 ON production_item_structure (parent_production_item_group_id);
CREATE INDEX ix_030 ON production_item_structure (child_production_item_group_id);
CREATE INDEX ix_031 ON production_item_structure (parent_production_item_id);
CREATE INDEX ix_032 ON production_item_structure (child_production_item_id);
CREATE INDEX ix_033 ON production_item_function (production_item_id);
CREATE INDEX ix_034 ON production_item_specification (production_item_id);
CREATE INDEX ix_035 ON production_item_portion (production_item_id);
CREATE INDEX ix_036 ON production_item_document (production_item_id);
CREATE INDEX ix_037 ON production_item_issue (production_item_id);
CREATE INDEX ix_038 ON production_item_issue (production_item_group_id);
CREATE INDEX ix_039 ON production_item_countermeasure (production_item_issue_id);
CREATE INDEX ix_040 ON production_item_result (production_item_id);
CREATE INDEX ix_041 ON production_item_result (production_schedule_id);
CREATE INDEX ix_042 ON production_process (production_item_group_id);
CREATE INDEX ix_043 ON production_operation (production_process_id);
CREATE INDEX ix_044 ON production_operation (equipment_group_id);
CREATE INDEX ix_045 ON production_operation (personnel_group_id);
CREATE INDEX ix_046 ON production_content (production_operation_id);
CREATE INDEX ix_047 ON production_assignment (production_operation_id);
CREATE INDEX ix_048 ON production_assignment (equipment_id);
CREATE INDEX ix_049 ON production_assignment (personnel_id);
CREATE INDEX ix_050 ON production_capacity (term_id);
CREATE INDEX ix_051 ON production_capacity (production_item_group_id);
CREATE INDEX ix_052 ON production_order (production_process_id);
CREATE INDEX ix_053 ON production_schedule (production_order_id);
CREATE INDEX ix_054 ON production_schedule (production_operation_id);
CREATE INDEX ix_055 ON production_schedule (equipment_id);
CREATE INDEX ix_056 ON production_schedule (personnel_id);
CREATE INDEX ix_057 ON production_schedule (production_line_id);
CREATE INDEX ix_058 ON production_performance (term_id);
CREATE INDEX ix_059 ON production_performance (production_process_id);
CREATE INDEX ix_060 ON production_result (production_schedule_id);
CREATE INDEX ix_061 ON production_result (production_content_id);
CREATE INDEX ix_062 ON production_result (personnel_id);
CREATE INDEX ix_063 ON production_document (equipment_id);
CREATE INDEX ix_064 ON production_issue (equipment_id);
CREATE INDEX ix_065 ON production_issue (equipment_group_id);
CREATE INDEX ix_066 ON production_countermeasure (production_issue_id);
CREATE INDEX ix_067 ON equipment (production_line_id);
CREATE INDEX ix_068 ON equipment (asset_id);
CREATE INDEX ix_069 ON equipment (equipment_group_id);
CREATE INDEX ix_070 ON equipment (energy_node_id);
CREATE INDEX ix_071 ON equipment_group (asset_group_id);
CREATE INDEX ix_072 ON equipment_structure (parent_equipment_group_id);
CREATE INDEX ix_073 ON equipment_structure (child_equipment_group_id);
CREATE INDEX ix_074 ON equipment_structure (parent_equipment_id);
CREATE INDEX ix_075 ON equipment_structure (child_equipment_id);
CREATE INDEX ix_076 ON equipment_function (equipment_id);
CREATE INDEX ix_077 ON equipment_specification (equipment_id);
CREATE INDEX ix_078 ON equipment_portion (equipment_id);
CREATE INDEX ix_079 ON equipment_document (equipment_id);
CREATE INDEX ix_080 ON equipment_issue (equipment_id);
CREATE INDEX ix_081 ON equipment_issue (equipment_group_id);
CREATE INDEX ix_082 ON equipment_countermeasure (equipment_issue_id);
CREATE INDEX ix_083 ON equipment_operation (equipment_process_id);
CREATE INDEX ix_084 ON equipment_operation (equipment_group_id);
CREATE INDEX ix_085 ON equipment_operation (personnel_group_id);
CREATE INDEX ix_086 ON equipment_content (equipment_operation_id);
CREATE INDEX ix_087 ON equipment_assignment (equipment_operation_id);
CREATE INDEX ix_088 ON equipment_assignment (equipment_id);
CREATE INDEX ix_089 ON equipment_assignment (personnel_id);
CREATE INDEX ix_090 ON equipment_capacity (term_id);
CREATE INDEX ix_091 ON equipment_capacity (equipment_group_id);
CREATE INDEX ix_092 ON equipment_order (equipment_process_id);
CREATE INDEX ix_093 ON equipment_schedule (equipment_operation_id);
CREATE INDEX ix_094 ON equipment_schedule (equipment_order_id);
CREATE INDEX ix_095 ON equipment_schedule (equipment_id);
CREATE INDEX ix_096 ON equipment_schedule (personnel_id);
CREATE INDEX ix_097 ON equipment_performance (term_id);
CREATE INDEX ix_098 ON equipment_performance (equipment_process_id);
CREATE INDEX ix_099 ON equipment_result (equipment_content_id);
CREATE INDEX ix_100 ON equipment_result (equipment_schedule_id);
CREATE INDEX ix_101 ON personnel (production_line_id);
CREATE INDEX ix_102 ON personnel (asset_id);
CREATE INDEX ix_103 ON personnel (personnel_group_id);
CREATE INDEX ix_104 ON personnel_group (asset_group_id);
CREATE INDEX ix_105 ON personnel_structure (personnel_group_id);
CREATE INDEX ix_106 ON personnel_structure (personnel_id);
CREATE INDEX ix_107 ON personnel_skill (personnel_id);
CREATE INDEX ix_108 ON personnel_specification (personnel_id);
CREATE INDEX ix_109 ON personnel_portion (personnel_id);
CREATE INDEX ix_110 ON personnel_document (personnel_id);
CREATE INDEX ix_111 ON personnel_issue (personnel_id);
CREATE INDEX ix_112 ON personnel_issue (personnel_group_id);
CREATE INDEX ix_113 ON personnel_countermeasure (personnel_issue_id);
CREATE INDEX ix_114 ON work_operation (work_process_id);
CREATE INDEX ix_115 ON work_operation (equipment_group_id);
CREATE INDEX ix_116 ON work_operation (personnel_group_id);
CREATE INDEX ix_117 ON work_content (work_operation_id);
CREATE INDEX ix_118 ON work_assignment (work_operation_id);
CREATE INDEX ix_119 ON work_assignment (personnel_id);
CREATE INDEX ix_120 ON work_assignment (equipment_id);
CREATE INDEX ix_121 ON work_capacity (site_id);
CREATE INDEX ix_122 ON work_capacity (term_id);
CREATE INDEX ix_123 ON work_order (work_process_id);
CREATE INDEX ix_124 ON work_schedule (work_order_id);
CREATE INDEX ix_125 ON work_performance (work_order_id);
CREATE INDEX ix_126 ON work_performance (term_id);
CREATE INDEX ix_127 ON work_result (work_schedule_id);
CREATE INDEX ix_128 ON work_result (work_content_id);
CREATE INDEX ix_129 ON inventory_item (production_item_id);
CREATE INDEX ix_130 ON inventory_capacity (site_id);
CREATE INDEX ix_131 ON inventory_capacity (term_id);
CREATE INDEX ix_132 ON inventory_capacity (production_item_id);
CREATE INDEX ix_133 ON inventory_order (production_item_id);
CREATE INDEX ix_134 ON inventory_order (production_order_id);
CREATE INDEX ix_135 ON inventory_schedule (inventory_order_id);
CREATE INDEX ix_136 ON inventory_schedule (from_inventory_item_id);
CREATE INDEX ix_137 ON inventory_schedule (to_inventory_item_id);
CREATE INDEX ix_138 ON inventory_transfer (inventory_item_id);
CREATE INDEX ix_139 ON inventory_transfer (inventory_schedule_id);
CREATE INDEX ix_140 ON inventory_result (inventory_item_id);
CREATE INDEX ix_141 ON inventory_result (inventory_schedule_id);
CREATE INDEX ix_142 ON energy (energy_group_id);
CREATE INDEX ix_143 ON energy_structure (energy_id);
CREATE INDEX ix_144 ON energy_function (energy_id);
CREATE INDEX ix_145 ON energy_specification (energy_id);
CREATE INDEX ix_146 ON energy_node (energy_id);
CREATE INDEX ix_147 ON energy_capacity (site_id);
CREATE INDEX ix_148 ON energy_capacity (term_id);
CREATE INDEX ix_149 ON energy_capacity (energy_group_id);
CREATE INDEX ix_150 ON energy_order (energy_node_id);
CREATE INDEX ix_151 ON energy_schedule (energy_order_id);
CREATE INDEX ix_152 ON energy_performance (energy_node_id);
CREATE INDEX ix_153 ON energy_performance (energy_order_id);
CREATE INDEX ix_154 ON energy_result (energy_schedule_id);
CREATE INDEX ix_155 ON energy_result (equipment_id);
CREATE INDEX ix_156 ON sales_item (production_item_id);
CREATE INDEX ix_157 ON sales_item (customer_id);
CREATE INDEX ix_158 ON sales_document (customer_id);
CREATE INDEX ix_159 ON sales_order (sales_document_id);
CREATE INDEX ix_160 ON sales_order (sales_item_id);
CREATE INDEX ix_161 ON sales_specification (customer_id);
CREATE INDEX ix_162 ON sales_invoice (customer_id);
CREATE INDEX ix_163 ON sales_invoice (shipping_result_id);
CREATE INDEX ix_164 ON sales_forecast (sales_item_id);
CREATE INDEX ix_165 ON sales_quotation (customer_id);
CREATE INDEX ix_166 ON sales_quotation (sales_item_id);
CREATE INDEX ix_167 ON shipping_result (sales_order_id);
CREATE INDEX ix_168 ON purchase_item (production_item_id);
CREATE INDEX ix_169 ON purchase_item (supplier_id);
CREATE INDEX ix_170 ON purchase_document (supplier_id);
CREATE INDEX ix_171 ON purchase_order (purchase_document_id);
CREATE INDEX ix_172 ON purchase_order (purchase_item_id);
CREATE INDEX ix_173 ON purchase_specification (supplier_id);
CREATE INDEX ix_174 ON purchase_invoice (supplier_id);
CREATE INDEX ix_175 ON purchase_invoice (receiving_result_id);
CREATE INDEX ix_176 ON purchase_forecast (purchase_item_id);
CREATE INDEX ix_177 ON purchase_quotation (supplier_id);
CREATE INDEX ix_178 ON purchase_quotation (purchase_item_id);
CREATE INDEX ix_179 ON receiving_result (purchase_order_id);

COMMIT;
