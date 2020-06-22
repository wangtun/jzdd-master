CREATE
	OR REPLACE VIEW v_dashboard_todo AS SELECT
	t1.ORDER_ID,
	t1.ORDER_NO,
	t1.CORP_NO,
	t1.ORDER_TIME,
	'01' AS FOLLOW_CODE,
	t2.FOLLOW_NAME,
	t2.FOLLOW_SEQ,
	t2.STEP_NAME,
	t1.SUPPLIER_NO,
	t1.SUPPLIER_NAME,
	t2.POSITION_CODES,
	t1.FINISH_FLG,
	t1.IS_DEL,
	t1.CREATED_BY_NAME,
	t1.CREATED_WHEN,
	t1.LAST_MODIFIED_BY_NAME,
	t1.LAST_MODIFIED_WHEN
FROM
	t_install_order t1,
	t_order_step t2
WHERE
	t1.ORDER_NO = t2.ORDER_NO
	AND t2.FOLLOW_CODE = '01'
	AND t2.CURRENT_STEP_FLG = 'Y'
	AND t1.BEGIN_CACLE = 'N'
	AND t1.IS_DEL = 'N'
	AND t2.IS_DEL = 'N' UNION ALL
SELECT
	t1.ORDER_ID,
	t1.ORDER_NO,
	t1.CORP_NO,
	t1.ORDER_TIME,
	'02',
	t2.FOLLOW_NAME,
	t2.FOLLOW_SEQ,
	t2.STEP_NAME,
	t1.SUPPLIER_NO,
	t1.SUPPLIER_NAME,
	t2.POSITION_CODES,
	t1.FINISH_FLG,
	t1.IS_DEL,
	t1.CREATED_BY_NAME,
	t1.CREATED_WHEN,
	t1.LAST_MODIFIED_BY_NAME,
	t1.LAST_MODIFIED_WHEN
FROM
	t_delivery_order t1,
	t_order_step t2
WHERE
	t1.ORDER_NO = t2.ORDER_NO
	AND t2.FOLLOW_CODE = '02'
	AND t2.CURRENT_STEP_FLG = 'Y'
	AND t1.BEGIN_CACLE = 'N'
	AND t1.IS_DEL = 'N'
	AND t2.IS_DEL = 'N' UNION ALL
SELECT
	t1.ID,
	t1.APPLY_NO,
	t1.CORP_NO,
	t1.APPLY_DATE,
	'03',
	t2.FOLLOW_NAME,
	t2.FOLLOW_SEQ,
	t2.STEP_NAME,
	t1.SUPPLIER_NO,
	t1.SUPPLIER_NAME,
	t2.POSITION_CODES,
	( CASE WHEN t2.LAST_STEP = 'Y' AND t2.STEP_TIME IS NOT NULL THEN 'Y' ELSE 'N' END ) AS FINISH_FLG,
	t1.IS_DEL,
	t1.CREATED_BY_NAME,
	t1.CREATED_WHEN,
	t1.LAST_MODIFIED_BY_NAME,
	t1.LAST_MODIFIED_WHEN
FROM
	t_order_cancel t1,
	t_order_step t2
WHERE
	t1.APPLY_NO = t2.ORDER_NO
-- 	AND t2.FOLLOW_CODE = '03'
	AND t2.CURRENT_STEP_FLG = 'Y'
	AND t1.IS_DEL = 'N'
	AND t2.IS_DEL = 'N' UNION ALL
SELECT
	t1.SETTLE_ID,
	t1.SETTLE_NO,
	t1.CORP_NO,
	t1.CREATED_WHEN,
	'04',
	t2.FOLLOW_NAME,
	t2.FOLLOW_SEQ,
	t2.STEP_NAME,
	t1.SUPPLIER_NO,
	t1.SUPPLIER_NAME,
	t2.POSITION_CODES,
	t1.FINISH_FLG,
	t1.IS_DEL,
	t1.CREATED_BY_NAME,
	t1.CREATED_WHEN,
	t1.LAST_MODIFIED_BY_NAME,
	t1.LAST_MODIFIED_WHEN
FROM
	t_settle t1,
	t_order_step t2
WHERE
	t1.SETTLE_NO = t2.ORDER_NO
	AND t2.FOLLOW_CODE = '04'
	AND t2.CURRENT_STEP_FLG = 'Y'
	AND t1.SETTLE_STATUS = '01'
	AND t1.IS_DEL = 'N'
	AND t2.IS_DEL = 'N'