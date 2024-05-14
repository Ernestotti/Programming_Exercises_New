page 70021 EFCMyDevCustomer
{
    ApplicationArea = All;
    Caption = 'EFCMyDevCustomer';
    PageType = List;
    SourceTable = EFCMyDevCustomer;
    UsageCategory = Lists;
    CardPageId = "Customer Card";
    Extensible = false;
    
    layout
    {
        area(content)
        {
            group(Input)
            {
                field(InputTxt; InputTxt)
                {
                    Caption = 'City';
                    ApplicationArea = All;
                    Tooltip = 'City';
            }
            }
            repeater(General)
            {
                field("EFCNo."; Rec."EFCNo.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(EFCName; Rec.EFCName)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(City; Rec.EFCCity)
                {
                    ToolTip = 'Specifies the value of the City field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CopyFromCustomer)
            {
                Caption = 'Copy from customers';
                Tooltip = 'Copy from customers';
                ApplicationArea = All;
                Image = Copy;
                trigger OnAction()
                var
                    Customer: Record Customer;
                    EFCMyDevCustomer : Record EFCMyDevCustomer;
                    CityFilterErr: Label 'Set the correct filter';
                begin
                    if InputTxt = '' then
                        Error(CityFilterErr);

                    Customer.SetFilter(City, InputTxt);
                    if Customer.FindSet() then
                        repeat
                            //EFCMyDevCustomer.TransferFields(Customer);
                            EFCMyDevCustomer."EFCNo." := Customer."No.";
                            EFCMyDevCustomer.EFCName := Customer.Name;
                            EFCMyDevCustomer.EFCCity := Customer.City;
                            if EFCMyDevCustomer.Insert() then;
                        until Customer.Next() = 0;

                    CurrPage.Update();
                end;
            }
            action(ClearMyDevCustomers)
            {
                Caption = 'Clear table My Dev Customers';
                ToolTip = 'Clear table My Dev Customers';
                ApplicationArea = All;
                Image = Delete;
                
                trigger OnAction()
                var
                     EFCMyDevCustomer : Record EFCMyDevCustomer;
                begin
                    EFCMyDevCustomer.DeleteAll();
                    CurrPage.Update();
                end;
            }
        }
    }
    var 
        InputTxt: Text;
}
