page 70025 EFCDataManipulationExamples
{
  PageType = Card;
  ApplicationArea = All;
  UsageCategory = Administration;
  Caption = 'EFC Data Manipulation Examples';
  // SourceTable = TableName;
  
  // layout
  // {
  //   area(Content)
  //   {
  //     group(GroupName)
  //     {
  //       field(Name; NameSource)
  //       {
  //         ApplicationArea = All;
          
  //       }
  //     }
  //   }
  // }
  
  actions
  {
    area(Processing)
    {
      action(FindSomeRecords)
      {
        ApplicationArea = All;
        Caption = 'Find Some Records';
        ToolTip = 'Find Some Records';
        Image = Find;
      
        trigger OnAction()
        var Customer: Record Customer;
        begin
          Customer.FindFirst();
          Message('%1', Customer);
        end;
      }
      action(LoopOverAllVendors)
      {
        ApplicationArea = All;
        Caption = 'Loop over all vendors';
        ToolTip = 'Loop over all vendors';
        Image = Vendor;

        trigger OnAction()
        var 
          Vendor: Record Vendor;
        begin
          if Vendor.FindSet() then
            repeat
              Message('%1', Vendor.Name);
            until Vendor.Next() = 0;
        end;
      }

      action(GetItemProduct)
      {
        ApplicationArea = All;
        Caption = 'Get item table product';
        ToolTip = 'Get item table product';
        Image = Item;

        trigger OnAction()
        var 
          Item: Record Item;
        begin
          GetItem1900S(Item);
          Message(Item."No.");
        end;
      }
      action(GetFromAtlanta)
      {
        ApplicationArea = All;
        Caption = 'Get customers from City';
        ToolTip = 'Get customers from City';
        Image = CustomerList;

        trigger OnAction()
        begin
          GetCustomerFromAtlanta()
        end;
      }
      action(GetNotFromAtlanta)
      {
        ApplicationArea = All;
        Caption = 'Get customers not from City';
        ToolTip = 'Get customers not from City';
        Image = CustomerList;

        trigger OnAction()
        begin
          GetCustomerNotFromAtlanta()
        end;
      }
    }
  }
  
  local procedure GetItem1900S(var Item: Record Item)
  var
    ItemNoFoundErr: label 'Item not found';
  begin
    if not Item.Get('1900-S') then
      Error(ItemNoFoundErr);
  end;

  local procedure GetCustomerFromAtlanta()
  var
    Customer: Record Customer;
  begin
    Customer.SetFilter(City, 'Atlanta');
    if Customer.Findset() then
      repeat
        Message('%1', customer);
      until Customer.Next( ) = 0;
  end;

  local procedure GetCustomerNotFromAtlanta()
  var
    Customer: Record Customer;
  begin
    Customer.SetFilter(City, '<>Atlanta');
    if Customer.Findset() then
      repeat
        Message('%1', customer);
      until Customer.Next( ) = 0;
  end;
}