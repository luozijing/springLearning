-- 将该建表 SQL 语句，添加到 yudao-module-pay-impl 模块的 test/resources/sql/create_tables.sql 文件里
CREATE TABLE IF NOT EXISTS "pay_order" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "merchant_id" bigint NOT NULL,
    "app_id" bigint NOT NULL,
    "channel_id" bigint,
    "channel_code" varchar(32),
    "merchant_order_id" varchar(64) NOT NULL,
    "subject" varchar(32) NOT NULL,
    "body" varchar(128) NOT NULL,
    "notify_url" varchar(1024) NOT NULL,
    "notify_status" tinyint NOT NULL,
    "amount" bigint NOT NULL,
    "channel_fee_rate" double,
    "channel_fee_amount" bigint,
    "status" tinyint NOT NULL,
    "user_ip" varchar(50) NOT NULL,
    "expire_time" datetime NOT NULL,
    "success_time" datetime,
    "notify_time" datetime,
    "success_extension_id" bigint,
    "refund_status" tinyint NOT NULL,
    "refund_times" tinyint NOT NULL,
    "refund_amount" bigint NOT NULL,
    "channel_user_id" varchar(255),
    "channel_order_no" varchar(64),
    "creator" varchar(64) DEFAULT '',
    "create_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater" varchar(64) DEFAULT '',
    "update_time" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted" bit NOT NULL DEFAULT FALSE,
    "tenant_id" bigint NOT NULL,
    PRIMARY KEY ("id")
) COMMENT '支付订单';

-- 将该删表 SQL 语句，添加到 yudao-module-pay-impl 模块的 test/resources/sql/clean.sql 文件里
DELETE FROM "pay_order";
