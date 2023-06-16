using {
    Currency,
    managed,
    sap
} from '@sap/cds/common';

namespace my.capire.northwind;

type ProductID : Int32;

define entity Shipper {
    key ShipperID   : Int32 not null;
        CompanyName : String(40) not null;
        Phone       : String(24);
}

define entity Employee {
    key EmployeeID      : Int32 not null;
        LastName        : String(20) not null;
        FirstName       : String(10) not null;
        Title           : String(30);
        TitleOfCourtesy : String(25);
        BirthDate       : Date;
        HireDate        : Date;
        Address         : String(60);
        City            : String(15);
        Region          : String(15);
        PostalCode      : String(10);
        Country         : String(15);
        HomePhone       : String(24);
        Extension       : String(4);
        Photo           : LargeBinary @Core.MediaType: 'image/png';
        Notes           : LargeString;
        ReportsTo       : Int32;
        PhotoPath       : String(255);
}

entity Customer {
    key CustomerID   : String(5) not null;
        CompanyName  : String(40) not null;
        ContactName  : String(30);
        ContactTitle : String(30);
        Address      : String(60);
        City         : String(15);
        Region       : String(15);
        PostalCode   : String(10);
        Country      : String(15);
        Phone        : String(24);
        Fax          : String(24);
}

define entity Category {
    key CategoryID   : Int32;
        CategoryName : String(15);
        Description  : String;
        Picture      : LargeBinary @Core.MediaType: 'image/png';
        Products     : Association to many Product
                           on Products.CategoryID = $self.CategoryID;
}

define entity Order {
    key OrderID        : Int32;
        CustomerID     : String(5);
        EmployeeID     : Int32;
        OrderDate      : Date;
        RequiredDate   : Date;
        ShippedDate    : Date;
        ShipVia        : Int32;
        Freight        : Decimal(19, 4);
        ShipName       : String(40);
        ShipAddress    : String(60);
        ShipCity       : String(15);
        ShipRegion     : String(15);
        ShipPostalCode : String(10);
        ShipCountry    : String(15);
}

define entity Order_Detail {
    key OrderID   : Int32;
    key ProductID : ProductID;
        UnitPrice : Decimal(19, 4);
        Quantity  : Int16;
        Discount  : Decimal(3, 2);
}

define entity Product {
    key ProductID       : ProductID not null;
        ProductName     : String(40) not null;
        SupplierID      : Int32;
        CategoryID      : Int32;
        QuantityPerUnit : String(20);
        UnitPrice       : Decimal(19, 4);
        UnitsInStock    : Int16;
        UnitsOnOrder    : Int16;
        ReorderLevel    : Int16;
        Discontinued    : Boolean;
        //Associations
        Categories : Association to one Category on Categories.CategoryID = $self.CategoryID;
        Suppliers : Association to one Supplier on Suppliers.SupplierID = $self.SupplierID;
}

define entity Supplier {
    key SupplierID   : Int32;
        CompanyName  : String(40);
        ContactName  : String(30);
        ContactTitle : String(30);
        Address      : String(60);
        City         : String(15);
        Region       : String(15);
        PostalCode   : String(10);
        Country      : String(15);
        Phone        : String(24);
        Fax          : String(24);
        HomePage     : LargeString;
}