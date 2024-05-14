page 70029 EFCExampleList
{
  ApplicationArea = All;
  Caption = 'Example List';
  PageType = List;
  SourceTable = EFCExample;
  UsageCategory = Lists;
  // Editable = false;
  CardPageId = EFCExampleCard;

  layout
  {
    area(Content)
    {
      repeater(GroupName)
      {
        field(FieldOne; Rec.FieldOne)
        {
          ToolTip = 'Specifies the value of the FieldOne field.';
        }
        field(FieldTwo; Rec.FieldTwo)
        {
          ToolTip = 'Specifies the value of the FieldTwo field.';
        }
      }
    }
    area(Factboxes)
    {
      
    }
  }
  
  actions
  {
    area(Processing)
    {
      action(ActionName)
      {
        ApplicationArea = All;
        
        trigger OnAction()
        begin
          
        end;
      }
    }
  }
}