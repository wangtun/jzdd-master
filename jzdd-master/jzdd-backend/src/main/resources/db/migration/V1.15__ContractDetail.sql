drop table if exists m_contract_detail;

/*==============================================================*/
/* Table: S_CORP                                                */
/*==============================================================*/
create table m_contract_detail
(
   DETAIL_ID              varchar(100) not null comment '本实体记录的唯一标识，产生规则为流水号',
   CORP_NO                varchar(32) comment '公司编号',
   DETAIL_NO             varchar(32) comment '合同明细编码',
   CONTRACT_NO             varchar(32) comment '合同编码',
   VEHICLE_NOS         text comment '车型编码',
   PILE_MODELS         text comment '充电桩型号,就是PILE_NO',
   DETAIL_NOS         text comment '车型明细编码',
--    DETAIL_BEGIN_DATE    date comment '策略开始日期',
--    DETAIL_END_DATE      date comment '策略结束日期',
   REMARK               varchar(256) comment '备注',
   IS_DEL               varchar(8) comment '是否删除:Y删除 N有效',
   CREATED_BY_NAME      varchar(256) comment '创建者',
   CREATED_WHEN         datetime comment '创建时间',
   LAST_MODIFIED_BY_NAME varchar(256) comment '更新者',
   LAST_MODIFIED_WHEN   datetime comment '更新时间',
   primary key (DETAIL_ID)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin
COMMENT = '合同明细表';
