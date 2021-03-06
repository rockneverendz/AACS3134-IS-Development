SELECT C.CUST_ID, C.USERNAME, O.ORDER_ID, O.STATUS, P.PAYMENT_ID, P.DATE, P.TIME, P.AMOUNT
FROM CUSTOMER C INNER JOIN  ORDERMEAL O ON C.CUST_ID = O.CUST_ID
INNER JOIN PAYMENT P ON P.PAYMENT_ID O.PAYMENT_ID
WHERE MONTH(P.DATE) = ? AND O.STATUS= 'Paid'
OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY

--calculate total
SELECT COUNT(*) AS TOTAL_PAYMENT ,SUM(P.AMOUNT) AS TOTAL_AMOUNT
FROM CUSTOMER C INNER JOIN  ORDERMEAL O ON C.CUST_ID = O.CUST_ID
INNER JOIN PAYMENT P ON P.PAYMENT_ID = O.PAYMENT_ID
WHERE MONTH(P.DATE) = 3 AND O.STATUS= 'Paid'