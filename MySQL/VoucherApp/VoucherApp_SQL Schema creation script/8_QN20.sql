-- You are also to write SQL to generate two queries which must meet the following requirements.
-- 20(A.) A summary report that employs table and column aliases and minimially at least one filter,
--    two INNER JOINS, one SQL Aggregate, GROUP BY functions. In the design of your report,
--    you need to specify your target audience or role and how you envisage the report would be
--    used by the target audience.
--    Target audience requests for sales report of a particular customer to confirm the Quantity of Voucher and Type purchased as a black and white.

    SELECT C.first_name as "First Name",C.last_name as "Last Name",C.email as "Email", V.VOUCHERTYPE as "Type", COUNT(V.VoucherType) as "QTY"
	FROM Customer C 
    INNER join ORDERCART OC
    ON C.idCustomer = OC.Customer_idCustomer AND C.idCustomer='1'
    INNER JOIN Voucher V
    ON V.OrderCart_IDOrderCart = OC.idOrderCart
    group by VoucherType;
    
   
-- 20(B.) A daily list of orders placed by customers providing details of the orders including 
--    order date, done
--    customer email done
--    order number done
--    and details of each voucher in terms of the 
--    email of the voucher’s recipient,
--    type of voucher and 
--    the voucher’s value. 
--    The list is to be sorted by
--    voucher type and 
--    voucher ID.

SELECT datePurchased as "Order Date",C.email as "Email",idcart_checkout as "Order Number", 
	   V.receiptEmail, idvoucher, C.first_name as "First Name",C.last_name as "Last Name",
       V.VOUCHERTYPE as "Type", vv.voucherVariablecol
from voucher V 
inner join ordercart oc 
on V.OrderCart_IDOrderCart = OC.idOrderCart AND V.VOUCHERSTATUS ="PURCHASED"
inner join customer c
on C.idCustomer = OC.Customer_idCustomer AND C.idCustomer='1'
inner join cartcheckout cc
on cc.ordercart_idOrdercart = OC.idOrderCart
inner join VoucherVariable vv
on vv.idvouchervariable = v.vouchervariable_idvouchervariable
order by vouchertype,idvoucher asc;

