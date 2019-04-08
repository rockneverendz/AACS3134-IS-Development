SELECT  M.MEAL_ID, M."NAME", COUNT(OL.QUANTITY) AS TOTAL_CANCELLED
FROM ORDERMEAL O INNER JOIN ORDERLIST OL ON O.ORDER_ID = OL.ORDER_ID
INNER JOIN MEAL M ON OL.MEAL_ID = M.MEAL_ID
INNER JOIN COUPON C ON C.COUPON_ID = OL.COUPON_ID
WHERE O.STATUS = 'Canceled' AND MONTH(C.REDEEM_DATE) = 4
GROUP BY  M.MEAL_ID, M."NAME"