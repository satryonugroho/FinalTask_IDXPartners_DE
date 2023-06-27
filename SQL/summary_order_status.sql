CREATE PROCEDURE summary_order_status @StatusID int
AS
BEGIN
    SELECT 
        FactSalesOrder.OrderID, 
        DimCustomer.CustomerName, 
        DimProduct.ProductName, 
        FactSalesOrder.Quantity, 
        DimStatusOrder.StatusOrder 
    FROM 
        FactSalesOrder 
    INNER JOIN DimCustomer ON FactSalesOrder.CustomerID = DimCustomer.CustomerID
    INNER JOIN DimProduct ON FactSalesOrder.ProductID = DimProduct.ProductID
    INNER JOIN DimStatusOrder ON FactSalesOrder.StatusID = DimStatusOrder.StatusID
    WHERE 
        FactSalesOrder.StatusID = @StatusID;
END;