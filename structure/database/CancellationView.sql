SELECT  O.ORDER_ID, O.STATUS, M."NAME", OL.QUANTITY
FROM    ORDERMEAL O INNER JOIN ORDERLIST OL 
ON O.ORDER_ID = OL.ORDER_ID
INNER JOIN MEAL M
ON OL.MEAL_ID = M.MEAL_ID
WHERE O.STATUS = 'Canceled';