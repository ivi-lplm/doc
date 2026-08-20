-- PSLX Data Model 4.2.01 -- Microsoft SQL Server DDL
-- Generated from pslx_data_models_v4_2.dbml

-- 事業者: 自社および取引先となる企業を表す。
CREATE TABLE enterprise (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_enterprise PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事業者: 自社および取引先となる企業を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'enterprise';

-- エリア: サイト内の区画、フロア、または管理単位を表す。
CREATE TABLE area (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_area PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エリア: サイト内の区画、フロア、または管理単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'area';

-- サイト: 生産活動を行う工場や拠点を表す。
CREATE TABLE site (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    enterprise_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_site PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'enterprise_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイト: 生産活動を行う工場や拠点を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'site';

-- 生産ライン: 生産工程を実行するラインまたは設備群を表す。
CREATE TABLE production_line (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    area_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_line PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エリアID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'area_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産ライン: 生産工程を実行するラインまたは設備群を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_line';

-- カレンダ: 稼働日、休日、シフトなどの操業条件を表す。
CREATE TABLE calendar (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_calendar PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'カレンダ: 稼働日、休日、シフトなどの操業条件を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'calendar';

-- ターム: カレンダを構成する時間区間を表す。
CREATE TABLE term (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    calendar_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_term PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'カレンダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'calendar_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ターム: カレンダを構成する時間区間を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'term';

-- 生産計画: 生産数量や期間に関する計画を表す。
CREATE TABLE production_plan (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    production_item_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_plan PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'production_item_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'計画数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産計画: 生産数量や期間に関する計画を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_plan';

-- 能力計画: 生産能力の確保や配分計画を表す。
CREATE TABLE capacity_plan (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_capacity_plan PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'計画数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'能力計画: 生産能力の確保や配分計画を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'capacity_plan';

-- 販売計画: 期間ごとの販売目標計画を表す。
CREATE TABLE sales_plan (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_plan PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'計画数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売計画: 期間ごとの販売目標計画を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_plan';

-- 購買計画: 期間ごとの調達目標計画を表す。
CREATE TABLE purchase_plan (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_plan PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'計画数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買計画: 期間ごとの調達目標計画を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_plan';

-- アセット: 生産活動に関わる資産の共通情報を表す。
CREATE TABLE asset (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    asset_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_asset PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'asset_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセット: 生産活動に関わる資産の共通情報を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset';

-- アセットグループ: 共通属性をもつアセットの分類単位を表す。
CREATE TABLE asset_group (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_asset_group PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットグループ: 共通属性をもつアセットの分類単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_group';

-- アセット構成: アセット間の構成関係や階層構造を表す。
CREATE TABLE asset_structure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    parent_asset_group_id NVARCHAR(50) NULL,
    child_asset_group_id NVARCHAR(50) NULL,
    parent_asset_id NVARCHAR(50) NULL,
    child_asset_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_asset_structure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'親アセットグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'parent_asset_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子アセットグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'child_asset_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'親アセットID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'parent_asset_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子アセットID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'child_asset_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセット構成: アセット間の構成関係や階層構造を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_structure';

-- アセット仕様: アセットに求められる仕様や性能条件を表す。
CREATE TABLE asset_specification (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    asset_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_asset_specification PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'asset_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセット仕様: アセットに求められる仕様や性能条件を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'asset_specification';

-- 監視内容: 設備や工程で監視する対象項目を表す。
CREATE TABLE monitoring_content (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    asset_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_monitoring_content PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'asset_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'監視内容: 設備や工程で監視する対象項目を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_content';

-- 監視結果: 監視項目に対する実測値や状態結果を表す。
CREATE TABLE monitoring_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    monitoring_content_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_monitoring_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'監視内容ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'monitoring_content_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'監視結果: 監視項目に対する実測値や状態結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'monitoring_result';

-- 生産品目: 生産対象となる製品、部品、材料を表す。
CREATE TABLE production_item (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    asset_id NVARCHAR(50) NULL,
    production_item_group_id NVARCHAR(50) NULL,
    production_process_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'asset_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'production_item_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'production_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目: 生産対象となる製品、部品、材料を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item';

-- 品目グループ: 共通特性をもつ生産品目の分類単位を表す。
CREATE TABLE production_item_group (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    asset_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_group PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'asset_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目グループ: 共通特性をもつ生産品目の分類単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_group';

-- 品目構成: 生産品目の部品表や構成関係を表す。
CREATE TABLE production_item_structure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    parent_production_item_group_id NVARCHAR(50) NULL,
    child_production_item_group_id NVARCHAR(50) NULL,
    parent_production_item_id NVARCHAR(50) NULL,
    child_production_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_structure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'親品目グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'parent_production_item_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子品目グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'child_production_item_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'親生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'parent_production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'child_production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目構成: 生産品目の部品表や構成関係を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_structure';

-- 品目機能: 生産品目が提供する機能や役割を表す。
CREATE TABLE production_item_function (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_function PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目機能: 生産品目が提供する機能や役割を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_function';

-- 品目仕様: 生産品目の仕様、品質条件、性能条件を表す。
CREATE TABLE production_item_specification (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_specification PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目仕様: 生産品目の仕様、品質条件、性能条件を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_specification';

-- 品目部位: 生産品目を構成する識別可能な部位を表す。
CREATE TABLE production_item_portion (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_portion PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目部位: 生産品目を構成する識別可能な部位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_portion';

-- 品目図書: 生産品目に関連する図面や仕様書を表す。
CREATE TABLE production_item_document (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    file_link NVARCHAR(255) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_document PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ファイル', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'file_link';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目図書: 生産品目に関連する図面や仕様書を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_document';

-- 品目事象: 生産品目に関連する不具合や課題を表す。
CREATE TABLE production_item_issue (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    production_item_group_id NVARCHAR(50) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    issue_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_issue PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'production_item_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事象日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'issue_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目事象: 生産品目に関連する不具合や課題を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_issue';

-- 品目対策: 品目事象に対する対策内容を表す。
CREATE TABLE production_item_countermeasure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_issue_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_countermeasure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目事象ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'production_item_issue_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目対策: 品目事象に対する対策内容を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_countermeasure';

-- 品目結果: 生産品目を生産して得られた実体を示す。
CREATE TABLE production_item_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    production_schedule_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_item_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産指示ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'production_schedule_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目結果: 生産品目を生産して得られた実体を示す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_item_result';

-- 生産工程: 技術的に定義された生産工程を表す。
CREATE TABLE production_process (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_process PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'production_item_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工程: 技術的に定義された生産工程を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_process';

-- 生産手順: 生産工程を具体化した作業手順を表す。
CREATE TABLE production_operation (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_process_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    personnel_group_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    work_hours DECIMAL(18,4) NULL,
    work_days DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_operation PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'production_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'personnel_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'work_hours';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産日数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'work_days';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産手順: 生産工程を具体化した作業手順を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_operation';

-- 生産内容: 生産手順を構成する詳細な作業項目を表す。
CREATE TABLE production_content (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_operation_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_content PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'production_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産内容: 生産手順を構成する詳細な作業項目を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_content';

-- 生産割当: 生産指示に対するリソース割当を表す。
CREATE TABLE production_assignment (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_operation_id NVARCHAR(50) NULL,
    equipment_id NVARCHAR(50) NULL,
    personnel_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_assignment PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'production_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産割当: 生産指示に対するリソース割当を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_assignment';

-- 生産能力: 生産ラインや工程の能力情報を表す。
CREATE TABLE production_capacity (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    term_id NVARCHAR(50) NULL,
    production_item_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    maximum_value DECIMAL(18,4) NULL,
    minimum_value DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_capacity PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品目グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'production_item_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'maximum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'minimum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産能力: 生産ラインや工程の能力情報を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_capacity';

-- 生産オーダ: 生産を要求する指示単位を表す。
CREATE TABLE production_order (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_process_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    due_at DATETIME2 NULL,
    release_at DATETIME2 NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_order PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'production_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発行日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'release_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産オーダ: 生産を要求する指示単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_order';

-- 生産指示: 生産オーダに基づく実行指示を表す。
CREATE TABLE production_schedule (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_order_id NVARCHAR(50) NULL,
    production_operation_id NVARCHAR(50) NULL,
    equipment_id NVARCHAR(50) NULL,
    personnel_id NVARCHAR(50) NULL,
    production_line_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_schedule PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'production_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'production_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産ラインID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'production_line_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'予定数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産指示: 生産オーダに基づく実行指示を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_schedule';

-- 生産実績: 実際の生産量や稼働実績を表す。
CREATE TABLE production_performance (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    term_id NVARCHAR(50) NULL,
    production_process_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    time DECIMAL(18,4) NULL,
    time_unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_performance PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'production_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'time_unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産実績: 実際の生産量や稼働実績を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_performance';

-- 生産結果: 生産指示の結果として得られた実行結果を表す。
CREATE TABLE production_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_schedule_id NVARCHAR(50) NULL,
    production_content_id NVARCHAR(50) NULL,
    personnel_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産指示ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'production_schedule_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産項目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'production_content_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産結果: 生産指示の結果として得られた実行結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_result';

-- 生産図書: 生産工程に関連する技術文書を表す。
CREATE TABLE production_document (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    file_link NVARCHAR(255) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_document PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ファイル', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'file_link';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産図書: 生産工程に関連する技術文書を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_document';

-- 生産事象: 生産活動で発生した問題や異常を表す。
CREATE TABLE production_issue (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    issue_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_issue PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事象日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'issue_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産事象: 生産活動で発生した問題や異常を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_issue';

-- 生産対策: 生産事象に対する改善や対策を表す。
CREATE TABLE production_countermeasure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_issue_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_production_countermeasure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産事象ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'production_issue_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産対策: 生産事象に対する改善や対策を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'production_countermeasure';

-- 設備: 生産作業を実行する機械や装置を表す。
CREATE TABLE equipment (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_line_id NVARCHAR(50) NULL,
    asset_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    energy_node_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産ラインID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'production_line_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'asset_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ接点ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'energy_node_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備: 生産作業を実行する機械や装置を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment';

-- 設備グループ: 共通機能をもつ設備の分類単位を表す。
CREATE TABLE equipment_group (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    asset_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_group PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'asset_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループ: 共通機能をもつ設備の分類単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_group';

-- 設備構成: 設備の親子関係や構成情報を表す。
CREATE TABLE equipment_structure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    parent_equipment_group_id NVARCHAR(50) NULL,
    child_equipment_group_id NVARCHAR(50) NULL,
    parent_equipment_id NVARCHAR(50) NULL,
    child_equipment_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_structure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'親設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'parent_equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'child_equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'親設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'parent_equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'child_equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備構成: 設備の親子関係や構成情報を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_structure';

-- 設備機能: 設備がもつ機能や役割を表す。
CREATE TABLE equipment_function (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_function PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備機能: 設備がもつ機能や役割を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_function';

-- 設備仕様: 設備に求められる性能や仕様条件を表す。
CREATE TABLE equipment_specification (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_specification PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備仕様: 設備に求められる性能や仕様条件を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_specification';

-- 設備部位: 設備を構成する識別可能な部位を表す。
CREATE TABLE equipment_portion (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_portion PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備部位: 設備を構成する識別可能な部位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_portion';

-- 設備図書: 設備に関連する図面やマニュアルを表す。
CREATE TABLE equipment_document (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    file_link NVARCHAR(255) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_document PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ファイル', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'file_link';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備図書: 設備に関連する図面やマニュアルを表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_document';

-- 設備事象: 設備に発生した故障や異常を表す。
CREATE TABLE equipment_issue (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    issue_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_issue PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事象日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'issue_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備事象: 設備に発生した故障や異常を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_issue';

-- 設備対策: 設備事象に対する対策内容を表す。
CREATE TABLE equipment_countermeasure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_issue_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_countermeasure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備事象ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'equipment_issue_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備対策: 設備事象に対する対策内容を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_countermeasure';

-- 設備工程: 設備に関する保全や稼働の工程を表す。
CREATE TABLE equipment_process (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_process PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備工程: 設備に関する保全や稼働の工程を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_process';

-- 設備手順: 設備工程を実行する具体的な手順を表す。
CREATE TABLE equipment_operation (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_process_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    personnel_group_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    work_hours DECIMAL(18,4) NULL,
    work_days DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_operation PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'equipment_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'personnel_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'work_hours';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産日数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'work_days';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備手順: 設備工程を実行する具体的な手順を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_operation';

-- 設備内容: 設備手順を構成する詳細な作業項目を表す。
CREATE TABLE equipment_content (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_operation_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_content PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'equipment_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備内容: 設備手順を構成する詳細な作業項目を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_content';

-- 設備割当: 生産手順に対する設備割当を表す。
CREATE TABLE equipment_assignment (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_operation_id NVARCHAR(50) NULL,
    equipment_id NVARCHAR(50) NULL,
    personnel_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_assignment PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'equipment_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備割当: 生産手順に対する設備割当を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_assignment';

-- 設備能力: 設備がもつ処理能力や性能を表す。
CREATE TABLE equipment_capacity (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    term_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    maximum_value DECIMAL(18,4) NULL,
    minimum_value DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_capacity PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'maximum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'minimum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備能力: 設備がもつ処理能力や性能を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_capacity';

-- 設備オーダ: 設備に対する作業要求を表す。
CREATE TABLE equipment_order (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_process_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    due_at DATETIME2 NULL,
    release_at DATETIME2 NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_order PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'equipment_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発行日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'release_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備オーダ: 設備に対する作業要求を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_order';

-- 設備指示: 設備オーダに基づく実行指示を表す。
CREATE TABLE equipment_schedule (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_operation_id NVARCHAR(50) NULL,
    equipment_order_id NVARCHAR(50) NULL,
    equipment_id NVARCHAR(50) NULL,
    personnel_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_schedule PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'equipment_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'equipment_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'予定数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備指示: 設備オーダに基づく実行指示を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_schedule';

-- 設備実績: 設備の稼働実績や運転結果を表す。
CREATE TABLE equipment_performance (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    term_id NVARCHAR(50) NULL,
    equipment_process_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    time DECIMAL(18,4) NULL,
    time_unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_performance PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'equipment_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'time_unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備実績: 設備の稼働実績や運転結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_performance';

-- 設備結果: 設備作業の結果を表す。
CREATE TABLE equipment_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    equipment_content_id NVARCHAR(50) NULL,
    equipment_schedule_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_equipment_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備項目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'equipment_content_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備指示ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'equipment_schedule_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備結果: 設備作業の結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'equipment_result';

-- 作業者: 生産活動に従事する作業者を表す。
CREATE TABLE personnel (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_line_id NVARCHAR(50) NULL,
    asset_id NVARCHAR(50) NULL,
    personnel_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産ラインID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'production_line_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'asset_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'personnel_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者: 生産活動に従事する作業者を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel';

-- 作業者グループ: 共通役割をもつ作業者のグループを表す。
CREATE TABLE personnel_group (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    asset_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_group PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'アセットグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'asset_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者グループ: 共通役割をもつ作業者のグループを表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_group';

-- 作業者構成: 作業者間の階層や代替関係を表す。
CREATE TABLE personnel_structure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    personnel_group_id NVARCHAR(50) NULL,
    personnel_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_structure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'personnel_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者構成: 作業者間の階層や代替関係を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_structure';

-- 作業者スキル: 作業者が保有する技能や資格を表す。
CREATE TABLE personnel_skill (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    personnel_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_skill PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者スキル: 作業者が保有する技能や資格を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_skill';

-- 作業者仕様: 作業者に求められる資格や条件を表す。
CREATE TABLE personnel_specification (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    personnel_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_specification PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者仕様: 作業者に求められる資格や条件を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_specification';

-- 作業者部位: 作業者の身体的または機能的な部位を表す。
CREATE TABLE personnel_portion (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    personnel_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_portion PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者部位: 作業者の身体的または機能的な部位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_portion';

-- 作業者図書: 作業者に関連する教育資料や記録を表す。
CREATE TABLE personnel_document (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    personnel_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    file_link NVARCHAR(255) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_document PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ファイル', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'file_link';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者図書: 作業者に関連する教育資料や記録を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_document';

-- 作業者事象: 作業者に関連する問題や事故を表す。
CREATE TABLE personnel_issue (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    personnel_id NVARCHAR(50) NULL,
    personnel_group_id NVARCHAR(50) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    issue_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_issue PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'personnel_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事象日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'issue_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者事象: 作業者に関連する問題や事故を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_issue';

-- 作業者対策: 作業者事象に対する改善や対策を表す。
CREATE TABLE personnel_countermeasure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    personnel_issue_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    note NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_personnel_countermeasure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者事象ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'personnel_issue_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'note';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者対策: 作業者事象に対する改善や対策を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'personnel_countermeasure';

-- 作業工程: 人作業として定義された工程を表す。
CREATE TABLE work_process (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_process PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業工程: 人作業として定義された工程を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_process';

-- 作業手順: 作業工程を実行する具体的な手順を表す。
CREATE TABLE work_operation (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    work_process_id NVARCHAR(50) NULL,
    equipment_group_id NVARCHAR(50) NULL,
    personnel_group_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    work_hours DECIMAL(18,4) NULL,
    work_days DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_operation PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'work_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'equipment_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者グループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'personnel_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産工数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'work_hours';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産日数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'work_days';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業手順: 作業工程を実行する具体的な手順を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_operation';

-- 作業内容: 作業手順を構成する詳細な作業項目を表す。
CREATE TABLE work_content (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    work_operation_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_content PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'work_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業内容: 作業手順を構成する詳細な作業項目を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_content';

-- 作業割当: 作業指示に対するリソース割当を表す。
CREATE TABLE work_assignment (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    work_operation_id NVARCHAR(50) NULL,
    personnel_id NVARCHAR(50) NULL,
    equipment_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_assignment PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業手順ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'work_operation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業者ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'personnel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業割当: 作業指示に対するリソース割当を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_assignment';

-- 作業能力: 作業者または作業班の能力を表す。
CREATE TABLE work_capacity (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    maximum_value DECIMAL(18,4) NULL,
    minimum_value DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_capacity PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'maximum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'minimum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業能力: 作業者または作業班の能力を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_capacity';

-- 作業オーダ: 作業者に対する作業要求を表す。
CREATE TABLE work_order (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    work_process_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    due_at DATETIME2 NULL,
    release_at DATETIME2 NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_order PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業工程ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'work_process_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発行日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'release_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業オーダ: 作業者に対する作業要求を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_order';

-- 作業指示: 作業オーダに基づく実行指示を表す。
CREATE TABLE work_schedule (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    work_order_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_schedule PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'work_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'予定数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業指示: 作業オーダに基づく実行指示を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_schedule';

-- 作業実績: 作業者または作業班の実績を表す。
CREATE TABLE work_performance (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    work_order_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    time DECIMAL(18,4) NULL,
    time_unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_performance PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'work_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'time_unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業実績: 作業者または作業班の実績を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_performance';

-- 作業結果: 作業の実行結果を表す。
CREATE TABLE work_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    work_schedule_id NVARCHAR(50) NULL,
    work_content_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_work_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業指示ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'work_schedule_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業項目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'work_content_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作業結果: 作業の実行結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'work_result';

-- 在庫品目: 在庫場所ごとの管理品目を表す。
CREATE TABLE inventory_item (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    lead_time DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_inventory_item PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'lead_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫品目: 在庫場所ごとの管理品目を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_item';

-- 在庫能力: 在庫場所の保管能力を表す。
CREATE TABLE inventory_capacity (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    production_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    maximum_value DECIMAL(18,4) NULL,
    minimum_value DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_inventory_capacity PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'maximum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'minimum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫能力: 在庫場所の保管能力を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_capacity';

-- 在庫オーダ: 在庫品目の移動・補充オーダを表す。
CREATE TABLE inventory_order (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    production_order_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    due_at DATETIME2 NULL,
    release_at DATETIME2 NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_inventory_order PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'production_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発行日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'release_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫オーダ: 在庫品目の移動・補充オーダを表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_order';

-- 在庫指示: 在庫品目の移動・補充指示を表す。
CREATE TABLE inventory_schedule (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    inventory_order_id NVARCHAR(50) NULL,
    from_inventory_item_id NVARCHAR(50) NULL,
    to_inventory_item_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_inventory_schedule PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'inventory_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'移動元在庫品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'from_inventory_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'移動先在庫品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'to_inventory_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'予定数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫指示: 在庫品目の移動・補充指示を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_schedule';

-- 在庫移動: 在庫品目の数量増減結果を表す。
CREATE TABLE inventory_transfer (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    inventory_item_id NVARCHAR(50) NULL,
    inventory_schedule_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    time DECIMAL(18,4) NULL,
    time_unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_inventory_transfer PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'inventory_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫指示ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'inventory_schedule_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'time_unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫移動: 在庫品目の数量増減結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_transfer';

-- 在庫数量: ある時点における在庫数量を表す。
CREATE TABLE inventory_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    inventory_item_id NVARCHAR(50) NULL,
    inventory_schedule_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_inventory_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'inventory_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫指示ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'inventory_schedule_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在庫数量: ある時点における在庫数量を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'inventory_result';

-- エネルギ: 生産活動に必要なエネルギを表す。
CREATE TABLE energy (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'energy_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ: 生産活動に必要なエネルギを表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy';

-- エネルギグループ: エネルギ源の分類単位を表す。
CREATE TABLE energy_group (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_group PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギグループ: エネルギ源の分類単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_group';

-- エネルギ構成: エネルギ供給の構成関係を表す。
CREATE TABLE energy_structure (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_structure PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'energy_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ構成: エネルギ供給の構成関係を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_structure';

-- エネルギ機能: エネルギがもつ機能を表す。
CREATE TABLE energy_function (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_function PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'energy_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ機能: エネルギがもつ機能を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_function';

-- エネルギ仕様: エネルギに求められる仕様条件を表す。
CREATE TABLE energy_specification (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_specification PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'energy_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ仕様: エネルギに求められる仕様条件を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_specification';

-- エネルギ接点: エネルギの供給・消費の接続点を表す。
CREATE TABLE energy_node (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_node PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'energy_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ接点: エネルギの供給・消費の接続点を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_node';

-- エネルギ能力: 共有可能なエネルギ供給能力を表す。
CREATE TABLE energy_capacity (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    site_id NVARCHAR(50) NULL,
    term_id NVARCHAR(50) NULL,
    energy_group_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    maximum_value DECIMAL(18,4) NULL,
    minimum_value DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_capacity PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'サイトID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'site_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'タームID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'term_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギグループID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'energy_group_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'maximum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小値', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'minimum_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ能力: 共有可能なエネルギ供給能力を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_capacity';

-- エネルギオーダ: エネルギの供給・消費オーダを表す。
CREATE TABLE energy_order (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_node_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    due_at DATETIME2 NULL,
    release_at DATETIME2 NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_order PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ接点ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'energy_node_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発行日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'release_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギオーダ: エネルギの供給・消費オーダを表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_order';

-- エネルギ指示: エネルギの供給・消費指示を表す。
CREATE TABLE energy_schedule (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_order_id NVARCHAR(50) NULL,
    index_no DECIMAL(18,4) NULL,
    specification NVARCHAR(255) NULL,
    planned_value DECIMAL(18,4) NULL,
    actual_value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_schedule PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギオーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'energy_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追番', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'index_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'予定数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'planned_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'実績数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'actual_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ指示: エネルギの供給・消費指示を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_schedule';

-- エネルギ実績: エネルギの供給・消費実績を表す。
CREATE TABLE energy_performance (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_node_id NVARCHAR(50) NULL,
    energy_order_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    time DECIMAL(18,4) NULL,
    time_unit NVARCHAR(100) NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_performance PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ接点ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'energy_node_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギオーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'energy_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'時間単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'time_unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'終了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ実績: エネルギの供給・消費実績を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_performance';

-- エネルギ結果: エネルギ接点ごとの記録結果を表す。
CREATE TABLE energy_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    energy_schedule_id NVARCHAR(50) NULL,
    equipment_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_energy_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ指示ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'energy_schedule_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設備ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'equipment_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'エネルギ結果: エネルギ接点ごとの記録結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'energy_result';

-- 得意先: 販売品目を提供する相手の事業者を表す。
CREATE TABLE customer (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_customer PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'得意先: 販売品目を提供する相手の事業者を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'customer';

-- 販売品目: 得意先に提供される生産品目を表す。
CREATE TABLE sales_item (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    customer_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    lead_time DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_item PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顧客ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'customer_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'lead_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売品目: 得意先に提供される生産品目を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_item';

-- 受注伝票: 得意先からの注文の管理単位を表す。
CREATE TABLE sales_document (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    customer_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    due_at DATETIME2 NULL,
    order_at DATETIME2 NULL,
    receiving_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_document PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顧客ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'customer_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発注日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'order_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入荷日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'receiving_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受注伝票: 得意先からの注文の管理単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_document';

-- 受注明細: 販売品目ごとの受注内容を表す。
CREATE TABLE sales_order (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    sales_document_id NVARCHAR(50) NULL,
    sales_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    due_at DATETIME2 NULL,
    release_at DATETIME2 NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_order PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売伝票ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'sales_document_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'sales_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発行日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'release_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受注明細: 販売品目ごとの受注内容を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_order';

-- 販売仕様: 得意先ごとの販売条件・仕様を表す。
CREATE TABLE sales_specification (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    customer_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_specification PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顧客ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'customer_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売仕様: 得意先ごとの販売条件・仕様を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_specification';

-- 販売請求: 得意先に発行する請求情報を表す。
CREATE TABLE sales_invoice (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    customer_id NVARCHAR(50) NULL,
    shipping_result_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    invoice_at DATETIME2 NULL,
    payment_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_invoice PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顧客ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'customer_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出荷実績ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'shipping_result_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'請求日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'invoice_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支払日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'payment_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売請求: 得意先に発行する請求情報を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_invoice';

-- 受注内示: 得意先からの需要予測情報を表す。
CREATE TABLE sales_forecast (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    sales_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    forecast_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_forecast PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'sales_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内示日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'forecast_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受注内示: 得意先からの需要予測情報を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_forecast';

-- 販売見積: 得意先への見積依頼と回答を表す。
CREATE TABLE sales_quotation (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    customer_id NVARCHAR(50) NULL,
    sales_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    due_at DATETIME2 NULL,
    quotation_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_sales_quotation PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顧客ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'customer_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'sales_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'見積日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'quotation_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売見積: 得意先への見積依頼と回答を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'sales_quotation';

-- 出荷明細: 販売品目の出荷結果を表す。
CREATE TABLE shipping_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    sales_order_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_shipping_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'販売オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'sales_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出荷明細: 販売品目の出荷結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'shipping_result';

-- 仕入先: 資材・部品を調達する相手の事業者を表す。
CREATE TABLE supplier (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_supplier PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕入先: 資材・部品を調達する相手の事業者を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'supplier';

-- 購買品目: 仕入先から提供される生産品目を表す。
CREATE TABLE purchase_item (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    production_item_id NVARCHAR(50) NULL,
    supplier_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    lead_time DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_item PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生産品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'production_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕入先ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'supplier_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日数', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'lead_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買品目: 仕入先から提供される生産品目を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_item';

-- 購買伝票: 仕入先への注文の管理単位を表す。
CREATE TABLE purchase_document (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    supplier_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    due_at DATETIME2 NULL,
    order_at DATETIME2 NULL,
    receiving_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_document PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕入先ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'supplier_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発注日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'order_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入荷日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'receiving_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買伝票: 仕入先への注文の管理単位を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_document';

-- 購買明細: 仕入先への個々の注文内容を表す。
CREATE TABLE purchase_order (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    purchase_document_id NVARCHAR(50) NULL,
    purchase_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    due_at DATETIME2 NULL,
    release_at DATETIME2 NULL,
    start_at DATETIME2 NULL,
    end_at DATETIME2 NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_order PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買伝票ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'purchase_document_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'purchase_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'発行日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'release_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'着手日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'start_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完了日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'end_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買明細: 仕入先への個々の注文内容を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_order';

-- 購買仕様: 仕入先ごとの購買条件・仕様を表す。
CREATE TABLE purchase_specification (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    supplier_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_specification PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕入先ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'supplier_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買仕様: 仕入先ごとの購買条件・仕様を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_specification';

-- 購買請求: 仕入先から受け取る請求情報を表す。
CREATE TABLE purchase_invoice (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    supplier_id NVARCHAR(50) NULL,
    receiving_result_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    invoice_at DATETIME2 NULL,
    payment_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_invoice PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕入先ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'supplier_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入荷実績ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'receiving_result_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'請求日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'invoice_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支払日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'payment_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買請求: 仕入先から受け取る請求情報を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_invoice';

-- 仕入内示: 仕入先への仕入予測通知を表す。
CREATE TABLE purchase_forecast (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    purchase_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    forecast_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_forecast PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'purchase_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内示日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'forecast_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕入内示: 仕入先への仕入予測通知を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_forecast';

-- 購買見積: 仕入先への見積依頼と回答を表す。
CREATE TABLE purchase_quotation (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    supplier_id NVARCHAR(50) NULL,
    purchase_item_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    unit_price DECIMAL(18,4) NULL,
    price DECIMAL(18,4) NULL,
    due_at DATETIME2 NULL,
    quotation_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_purchase_quotation PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕入先ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'supplier_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買品目ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'purchase_item_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単価', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'unit_price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金額', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'price';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'納期', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'due_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'見積日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'quotation_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買見積: 仕入先への見積依頼と回答を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'purchase_quotation';

-- 入荷明細: 購買品目の入荷結果を表す。
CREATE TABLE receiving_result (
    id NVARCHAR(50) NOT NULL,
    name NVARCHAR(255) NULL,
    category NVARCHAR(100) NULL,
    status NVARCHAR(100) NULL,
    description NVARCHAR(255) NULL,
    purchase_order_id NVARCHAR(50) NULL,
    specification NVARCHAR(255) NULL,
    value DECIMAL(18,4) NULL,
    unit NVARCHAR(100) NULL,
    location NVARCHAR(100) NULL,
    result_at DATETIME2 NULL,
    created_at DATETIME2 NULL,
    updated_at DATETIME2 NULL,
    created_by NVARCHAR(255) NULL,
    approved_by NVARCHAR(255) NULL,
    remark NVARCHAR(255) NULL,
    CONSTRAINT pk_receiving_result PRIMARY KEY (id)
);
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'category';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状態', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'説明', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買オーダID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'purchase_order_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仕様', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'specification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'単位', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'unit';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'場所', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'location';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'result_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登録日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'created_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日時', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'updated_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作成者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'created_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'承認者', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'approved_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備考', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result', @level2type=N'COLUMN', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入荷明細: 購買品目の入荷結果を表す。', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'receiving_result';

-- ============================================================
-- Foreign Key Constraints
-- ============================================================
ALTER TABLE area ADD CONSTRAINT fk_area_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE site ADD CONSTRAINT fk_site_enterprise_id FOREIGN KEY (enterprise_id) REFERENCES enterprise (id);
ALTER TABLE production_line ADD CONSTRAINT fk_production_line_area_id FOREIGN KEY (area_id) REFERENCES area (id);
ALTER TABLE calendar ADD CONSTRAINT fk_calendar_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE term ADD CONSTRAINT fk_term_calendar_id FOREIGN KEY (calendar_id) REFERENCES calendar (id);
ALTER TABLE production_plan ADD CONSTRAINT fk_production_plan_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE production_plan ADD CONSTRAINT fk_production_plan_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_plan ADD CONSTRAINT fk_production_plan_production_item_group_id FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE capacity_plan ADD CONSTRAINT fk_capacity_plan_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE capacity_plan ADD CONSTRAINT fk_capacity_plan_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE capacity_plan ADD CONSTRAINT fk_capacity_plan_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE sales_plan ADD CONSTRAINT fk_sales_plan_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE sales_plan ADD CONSTRAINT fk_sales_plan_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE purchase_plan ADD CONSTRAINT fk_purchase_plan_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE purchase_plan ADD CONSTRAINT fk_purchase_plan_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE asset ADD CONSTRAINT fk_asset_asset_group_id FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_asset_structure_parent_asset_group_id FOREIGN KEY (parent_asset_group_id) REFERENCES asset_group (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_asset_structure_child_asset_group_id FOREIGN KEY (child_asset_group_id) REFERENCES asset_group (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_asset_structure_parent_asset_id FOREIGN KEY (parent_asset_id) REFERENCES asset (id);
ALTER TABLE asset_structure ADD CONSTRAINT fk_asset_structure_child_asset_id FOREIGN KEY (child_asset_id) REFERENCES asset (id);
ALTER TABLE asset_specification ADD CONSTRAINT fk_asset_specification_asset_id FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE monitoring_content ADD CONSTRAINT fk_monitoring_content_asset_id FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE monitoring_result ADD CONSTRAINT fk_monitoring_result_monitoring_content_id FOREIGN KEY (monitoring_content_id) REFERENCES monitoring_content (id);
ALTER TABLE monitoring_result ADD CONSTRAINT fk_monitoring_result_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_item ADD CONSTRAINT fk_production_item_asset_id FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE production_item ADD CONSTRAINT fk_production_item_production_item_group_id FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item ADD CONSTRAINT fk_production_item_production_process_id FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_item_group ADD CONSTRAINT fk_production_item_group_asset_group_id FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_production_item_structure_parent_production_item_group_id FOREIGN KEY (parent_production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_production_item_structure_child_production_item_group_id FOREIGN KEY (child_production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_production_item_structure_parent_production_item_id FOREIGN KEY (parent_production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_structure ADD CONSTRAINT fk_production_item_structure_child_production_item_id FOREIGN KEY (child_production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_function ADD CONSTRAINT fk_production_item_function_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_specification ADD CONSTRAINT fk_production_item_specification_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_portion ADD CONSTRAINT fk_production_item_portion_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_document ADD CONSTRAINT fk_production_item_document_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_issue ADD CONSTRAINT fk_production_item_issue_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_issue ADD CONSTRAINT fk_production_item_issue_production_item_group_id FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_item_countermeasure ADD CONSTRAINT fk_production_item_countermeasure_production_item_issue_id FOREIGN KEY (production_item_issue_id) REFERENCES production_item_issue (id);
ALTER TABLE production_item_result ADD CONSTRAINT fk_production_item_result_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE production_item_result ADD CONSTRAINT fk_production_item_result_production_schedule_id FOREIGN KEY (production_schedule_id) REFERENCES production_schedule (id);
ALTER TABLE production_process ADD CONSTRAINT fk_production_process_production_item_group_id FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_operation ADD CONSTRAINT fk_production_operation_production_process_id FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_operation ADD CONSTRAINT fk_production_operation_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE production_operation ADD CONSTRAINT fk_production_operation_personnel_group_id FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE production_content ADD CONSTRAINT fk_production_content_production_operation_id FOREIGN KEY (production_operation_id) REFERENCES production_operation (id);
ALTER TABLE production_assignment ADD CONSTRAINT fk_production_assignment_production_operation_id FOREIGN KEY (production_operation_id) REFERENCES production_operation (id);
ALTER TABLE production_assignment ADD CONSTRAINT fk_production_assignment_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_assignment ADD CONSTRAINT fk_production_assignment_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE production_capacity ADD CONSTRAINT fk_production_capacity_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_capacity ADD CONSTRAINT fk_production_capacity_production_item_group_id FOREIGN KEY (production_item_group_id) REFERENCES production_item_group (id);
ALTER TABLE production_order ADD CONSTRAINT fk_production_order_production_process_id FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_production_schedule_production_order_id FOREIGN KEY (production_order_id) REFERENCES production_order (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_production_schedule_production_operation_id FOREIGN KEY (production_operation_id) REFERENCES production_operation (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_production_schedule_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_production_schedule_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE production_schedule ADD CONSTRAINT fk_production_schedule_production_line_id FOREIGN KEY (production_line_id) REFERENCES production_line (id);
ALTER TABLE production_performance ADD CONSTRAINT fk_production_performance_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE production_performance ADD CONSTRAINT fk_production_performance_production_process_id FOREIGN KEY (production_process_id) REFERENCES production_process (id);
ALTER TABLE production_result ADD CONSTRAINT fk_production_result_production_schedule_id FOREIGN KEY (production_schedule_id) REFERENCES production_schedule (id);
ALTER TABLE production_result ADD CONSTRAINT fk_production_result_production_content_id FOREIGN KEY (production_content_id) REFERENCES production_content (id);
ALTER TABLE production_result ADD CONSTRAINT fk_production_result_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE production_document ADD CONSTRAINT fk_production_document_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_issue ADD CONSTRAINT fk_production_issue_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE production_issue ADD CONSTRAINT fk_production_issue_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE production_countermeasure ADD CONSTRAINT fk_production_countermeasure_production_issue_id FOREIGN KEY (production_issue_id) REFERENCES production_issue (id);
ALTER TABLE equipment ADD CONSTRAINT fk_equipment_production_line_id FOREIGN KEY (production_line_id) REFERENCES production_line (id);
ALTER TABLE equipment ADD CONSTRAINT fk_equipment_asset_id FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE equipment ADD CONSTRAINT fk_equipment_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment ADD CONSTRAINT fk_equipment_energy_node_id FOREIGN KEY (energy_node_id) REFERENCES energy_node (id);
ALTER TABLE equipment_group ADD CONSTRAINT fk_equipment_group_asset_group_id FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_equipment_structure_parent_equipment_group_id FOREIGN KEY (parent_equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_equipment_structure_child_equipment_group_id FOREIGN KEY (child_equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_equipment_structure_parent_equipment_id FOREIGN KEY (parent_equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_structure ADD CONSTRAINT fk_equipment_structure_child_equipment_id FOREIGN KEY (child_equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_function ADD CONSTRAINT fk_equipment_function_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_specification ADD CONSTRAINT fk_equipment_specification_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_portion ADD CONSTRAINT fk_equipment_portion_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_document ADD CONSTRAINT fk_equipment_document_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_issue ADD CONSTRAINT fk_equipment_issue_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_issue ADD CONSTRAINT fk_equipment_issue_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_countermeasure ADD CONSTRAINT fk_equipment_countermeasure_equipment_issue_id FOREIGN KEY (equipment_issue_id) REFERENCES equipment_issue (id);
ALTER TABLE equipment_operation ADD CONSTRAINT fk_equipment_operation_equipment_process_id FOREIGN KEY (equipment_process_id) REFERENCES equipment_process (id);
ALTER TABLE equipment_operation ADD CONSTRAINT fk_equipment_operation_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_operation ADD CONSTRAINT fk_equipment_operation_personnel_group_id FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE equipment_content ADD CONSTRAINT fk_equipment_content_equipment_operation_id FOREIGN KEY (equipment_operation_id) REFERENCES equipment_operation (id);
ALTER TABLE equipment_assignment ADD CONSTRAINT fk_equipment_assignment_equipment_operation_id FOREIGN KEY (equipment_operation_id) REFERENCES equipment_operation (id);
ALTER TABLE equipment_assignment ADD CONSTRAINT fk_equipment_assignment_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_assignment ADD CONSTRAINT fk_equipment_assignment_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE equipment_capacity ADD CONSTRAINT fk_equipment_capacity_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE equipment_capacity ADD CONSTRAINT fk_equipment_capacity_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE equipment_order ADD CONSTRAINT fk_equipment_order_equipment_process_id FOREIGN KEY (equipment_process_id) REFERENCES equipment_process (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_equipment_schedule_equipment_operation_id FOREIGN KEY (equipment_operation_id) REFERENCES equipment_operation (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_equipment_schedule_equipment_order_id FOREIGN KEY (equipment_order_id) REFERENCES equipment_order (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_equipment_schedule_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE equipment_schedule ADD CONSTRAINT fk_equipment_schedule_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE equipment_performance ADD CONSTRAINT fk_equipment_performance_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE equipment_performance ADD CONSTRAINT fk_equipment_performance_equipment_process_id FOREIGN KEY (equipment_process_id) REFERENCES equipment_process (id);
ALTER TABLE equipment_result ADD CONSTRAINT fk_equipment_result_equipment_content_id FOREIGN KEY (equipment_content_id) REFERENCES equipment_content (id);
ALTER TABLE equipment_result ADD CONSTRAINT fk_equipment_result_equipment_schedule_id FOREIGN KEY (equipment_schedule_id) REFERENCES equipment_schedule (id);
ALTER TABLE personnel ADD CONSTRAINT fk_personnel_production_line_id FOREIGN KEY (production_line_id) REFERENCES production_line (id);
ALTER TABLE personnel ADD CONSTRAINT fk_personnel_asset_id FOREIGN KEY (asset_id) REFERENCES asset (id);
ALTER TABLE personnel ADD CONSTRAINT fk_personnel_personnel_group_id FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE personnel_group ADD CONSTRAINT fk_personnel_group_asset_group_id FOREIGN KEY (asset_group_id) REFERENCES asset_group (id);
ALTER TABLE personnel_structure ADD CONSTRAINT fk_personnel_structure_personnel_group_id FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE personnel_structure ADD CONSTRAINT fk_personnel_structure_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_skill ADD CONSTRAINT fk_personnel_skill_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_specification ADD CONSTRAINT fk_personnel_specification_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_portion ADD CONSTRAINT fk_personnel_portion_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_document ADD CONSTRAINT fk_personnel_document_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_issue ADD CONSTRAINT fk_personnel_issue_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE personnel_issue ADD CONSTRAINT fk_personnel_issue_personnel_group_id FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE personnel_countermeasure ADD CONSTRAINT fk_personnel_countermeasure_personnel_issue_id FOREIGN KEY (personnel_issue_id) REFERENCES personnel_issue (id);
ALTER TABLE work_operation ADD CONSTRAINT fk_work_operation_work_process_id FOREIGN KEY (work_process_id) REFERENCES work_process (id);
ALTER TABLE work_operation ADD CONSTRAINT fk_work_operation_equipment_group_id FOREIGN KEY (equipment_group_id) REFERENCES equipment_group (id);
ALTER TABLE work_operation ADD CONSTRAINT fk_work_operation_personnel_group_id FOREIGN KEY (personnel_group_id) REFERENCES personnel_group (id);
ALTER TABLE work_content ADD CONSTRAINT fk_work_content_work_operation_id FOREIGN KEY (work_operation_id) REFERENCES work_operation (id);
ALTER TABLE work_assignment ADD CONSTRAINT fk_work_assignment_work_operation_id FOREIGN KEY (work_operation_id) REFERENCES work_operation (id);
ALTER TABLE work_assignment ADD CONSTRAINT fk_work_assignment_personnel_id FOREIGN KEY (personnel_id) REFERENCES personnel (id);
ALTER TABLE work_assignment ADD CONSTRAINT fk_work_assignment_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE work_capacity ADD CONSTRAINT fk_work_capacity_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE work_capacity ADD CONSTRAINT fk_work_capacity_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE work_order ADD CONSTRAINT fk_work_order_work_process_id FOREIGN KEY (work_process_id) REFERENCES work_process (id);
ALTER TABLE work_schedule ADD CONSTRAINT fk_work_schedule_work_order_id FOREIGN KEY (work_order_id) REFERENCES work_order (id);
ALTER TABLE work_performance ADD CONSTRAINT fk_work_performance_work_order_id FOREIGN KEY (work_order_id) REFERENCES work_order (id);
ALTER TABLE work_performance ADD CONSTRAINT fk_work_performance_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE work_result ADD CONSTRAINT fk_work_result_work_schedule_id FOREIGN KEY (work_schedule_id) REFERENCES work_schedule (id);
ALTER TABLE work_result ADD CONSTRAINT fk_work_result_work_content_id FOREIGN KEY (work_content_id) REFERENCES work_content (id);
ALTER TABLE inventory_item ADD CONSTRAINT fk_inventory_item_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE inventory_capacity ADD CONSTRAINT fk_inventory_capacity_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE inventory_capacity ADD CONSTRAINT fk_inventory_capacity_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE inventory_capacity ADD CONSTRAINT fk_inventory_capacity_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE inventory_order ADD CONSTRAINT fk_inventory_order_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE inventory_order ADD CONSTRAINT fk_inventory_order_production_order_id FOREIGN KEY (production_order_id) REFERENCES production_order (id);
ALTER TABLE inventory_schedule ADD CONSTRAINT fk_inventory_schedule_inventory_order_id FOREIGN KEY (inventory_order_id) REFERENCES inventory_order (id);
ALTER TABLE inventory_schedule ADD CONSTRAINT fk_inventory_schedule_from_inventory_item_id FOREIGN KEY (from_inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_schedule ADD CONSTRAINT fk_inventory_schedule_to_inventory_item_id FOREIGN KEY (to_inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_transfer ADD CONSTRAINT fk_inventory_transfer_inventory_item_id FOREIGN KEY (inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_transfer ADD CONSTRAINT fk_inventory_transfer_inventory_schedule_id FOREIGN KEY (inventory_schedule_id) REFERENCES inventory_schedule (id);
ALTER TABLE inventory_result ADD CONSTRAINT fk_inventory_result_inventory_item_id FOREIGN KEY (inventory_item_id) REFERENCES inventory_item (id);
ALTER TABLE inventory_result ADD CONSTRAINT fk_inventory_result_inventory_schedule_id FOREIGN KEY (inventory_schedule_id) REFERENCES inventory_schedule (id);
ALTER TABLE energy ADD CONSTRAINT fk_energy_energy_group_id FOREIGN KEY (energy_group_id) REFERENCES energy_group (id);
ALTER TABLE energy_structure ADD CONSTRAINT fk_energy_structure_energy_id FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_function ADD CONSTRAINT fk_energy_function_energy_id FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_specification ADD CONSTRAINT fk_energy_specification_energy_id FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_node ADD CONSTRAINT fk_energy_node_energy_id FOREIGN KEY (energy_id) REFERENCES energy (id);
ALTER TABLE energy_capacity ADD CONSTRAINT fk_energy_capacity_site_id FOREIGN KEY (site_id) REFERENCES site (id);
ALTER TABLE energy_capacity ADD CONSTRAINT fk_energy_capacity_term_id FOREIGN KEY (term_id) REFERENCES term (id);
ALTER TABLE energy_capacity ADD CONSTRAINT fk_energy_capacity_energy_group_id FOREIGN KEY (energy_group_id) REFERENCES energy_group (id);
ALTER TABLE energy_order ADD CONSTRAINT fk_energy_order_energy_node_id FOREIGN KEY (energy_node_id) REFERENCES energy_node (id);
ALTER TABLE energy_schedule ADD CONSTRAINT fk_energy_schedule_energy_order_id FOREIGN KEY (energy_order_id) REFERENCES energy_order (id);
ALTER TABLE energy_performance ADD CONSTRAINT fk_energy_performance_energy_node_id FOREIGN KEY (energy_node_id) REFERENCES energy_node (id);
ALTER TABLE energy_performance ADD CONSTRAINT fk_energy_performance_energy_order_id FOREIGN KEY (energy_order_id) REFERENCES energy_order (id);
ALTER TABLE energy_result ADD CONSTRAINT fk_energy_result_energy_schedule_id FOREIGN KEY (energy_schedule_id) REFERENCES energy_schedule (id);
ALTER TABLE energy_result ADD CONSTRAINT fk_energy_result_equipment_id FOREIGN KEY (equipment_id) REFERENCES equipment (id);
ALTER TABLE sales_item ADD CONSTRAINT fk_sales_item_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE sales_item ADD CONSTRAINT fk_sales_item_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_document ADD CONSTRAINT fk_sales_document_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_order ADD CONSTRAINT fk_sales_order_sales_document_id FOREIGN KEY (sales_document_id) REFERENCES sales_document (id);
ALTER TABLE sales_order ADD CONSTRAINT fk_sales_order_sales_item_id FOREIGN KEY (sales_item_id) REFERENCES sales_item (id);
ALTER TABLE sales_specification ADD CONSTRAINT fk_sales_specification_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_invoice ADD CONSTRAINT fk_sales_invoice_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_invoice ADD CONSTRAINT fk_sales_invoice_shipping_result_id FOREIGN KEY (shipping_result_id) REFERENCES shipping_result (id);
ALTER TABLE sales_forecast ADD CONSTRAINT fk_sales_forecast_sales_item_id FOREIGN KEY (sales_item_id) REFERENCES sales_item (id);
ALTER TABLE sales_quotation ADD CONSTRAINT fk_sales_quotation_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id);
ALTER TABLE sales_quotation ADD CONSTRAINT fk_sales_quotation_sales_item_id FOREIGN KEY (sales_item_id) REFERENCES sales_item (id);
ALTER TABLE shipping_result ADD CONSTRAINT fk_shipping_result_sales_order_id FOREIGN KEY (sales_order_id) REFERENCES sales_order (id);
ALTER TABLE purchase_item ADD CONSTRAINT fk_purchase_item_production_item_id FOREIGN KEY (production_item_id) REFERENCES production_item (id);
ALTER TABLE purchase_item ADD CONSTRAINT fk_purchase_item_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_document ADD CONSTRAINT fk_purchase_document_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_order ADD CONSTRAINT fk_purchase_order_purchase_document_id FOREIGN KEY (purchase_document_id) REFERENCES purchase_document (id);
ALTER TABLE purchase_order ADD CONSTRAINT fk_purchase_order_purchase_item_id FOREIGN KEY (purchase_item_id) REFERENCES purchase_item (id);
ALTER TABLE purchase_specification ADD CONSTRAINT fk_purchase_specification_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_invoice ADD CONSTRAINT fk_purchase_invoice_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_invoice ADD CONSTRAINT fk_purchase_invoice_receiving_result_id FOREIGN KEY (receiving_result_id) REFERENCES receiving_result (id);
ALTER TABLE purchase_forecast ADD CONSTRAINT fk_purchase_forecast_purchase_item_id FOREIGN KEY (purchase_item_id) REFERENCES purchase_item (id);
ALTER TABLE purchase_quotation ADD CONSTRAINT fk_purchase_quotation_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier (id);
ALTER TABLE purchase_quotation ADD CONSTRAINT fk_purchase_quotation_purchase_item_id FOREIGN KEY (purchase_item_id) REFERENCES purchase_item (id);
ALTER TABLE receiving_result ADD CONSTRAINT fk_receiving_result_purchase_order_id FOREIGN KEY (purchase_order_id) REFERENCES purchase_order (id);
