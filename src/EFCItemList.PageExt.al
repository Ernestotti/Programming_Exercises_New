pageextension 70022 EFCItemList extends "Item List"
{
  layout
  {
    addafter(InventoryField)
    {
      field(EFCAvailability;Availability)
      {
        Caption = 'EFCAvailability';
        ToolTip = 'Availability';
        ApplicationArea = All;
        Editable = false;
        StyleExpr = AvailabilityStyle; 
        // Visible = false;
      }
    }
  }

  trigger OnAfterGetRecord()
  begin
    Rec.CalcFields(Inventory, "Qty. on Purch. Order", "Qty. on Sales Order" );
    Availability := Rec.Inventory + Rec."Qty. on Purch. Order" - Rec."Qty. on Sales Order";
    Clear(AvailabilityStyle);
    if Availability < Rec.Inventory then
      AvailabilityStyle := 'Attention'
    else
      if Availability > Rec.Inventory then
        AvailabilityStyle := 'Favorable';
  end;

  var
    AvailabilityStyle: Text;
    Availability: Decimal;
}