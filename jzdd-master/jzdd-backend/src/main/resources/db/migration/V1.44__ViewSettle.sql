CREATE
OR REPLACE VIEW v_settle AS SELECT
	T1.SETTLE_ID AS SETTLE_ID,
	T1.CORP_NO AS CORP_NO,
	T1.SETTLE_NO AS SETTLE_NO,
	T1.SETTLE_STATUS AS SETTLE_STATUS,
	T1.SETTLE_STATUS_NAME AS SETTLE_STATUS_NAME,
	T1.TTL_AMT AS TTL_AMT,
	T1.SUPPLIER_NO AS SUPPLIER_NO,
	T1.SUPPLIER_NAME AS SUPPLIER_NAME,
	T1.ORDER_TYPE AS ORDER_TYPE,
	T1.ORDER_TYPE_NAME AS ORDER_TYPE_NAME,
	T1.IS_DEL AS IS_DEL,
	T1.CREATED_BY_NAME AS CREATED_BY_NAME,
	T1.CREATED_WHEN AS CREATED_WHEN,
	T1.LAST_MODIFIED_BY_NAME AS LAST_MODIFIED_BY_NAME,
	T1.LAST_MODIFIED_WHEN AS LAST_MODIFIED_WHEN,
	T1.FINISH_FLG AS FINISH_FLG,
	T1.FINISH_TIME AS FINISH_TIME,
	T1.INVOICE_STATUS AS INVOICE_STATUS,
	T1.INVOICE_STATUS_NAME AS INVOICE_STATUS_NAME,
	T1.FIRST_VERIFY_FLG AS FIRST_VERIFY_FLG,
	T1.SECOND_VERIFY_FLG AS SECOND_VERIFY_FLG,
	T2.FOLLOW_SEQ AS FOLLOW_SEQ,
	T2.POSITION_CODES AS POSITION_CODES,
	T2.CURRENT_STEP_FLG AS CURRENT_STEP_FLG,
	T2.STEP_NAME AS STEP_NAME,
	T2.STEP_MATRIX AS STEP_MATRIX
FROM
	t_settle T1
JOIN t_order_step T2
WHERE
	T1.IS_DEL = 'N'
AND T2.IS_DEL = 'N'
AND T1.SETTLE_NO = T2.ORDER_NO
AND T2.CURRENT_STEP_FLG = 'Y'