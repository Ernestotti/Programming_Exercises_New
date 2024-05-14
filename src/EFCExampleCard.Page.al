page 70018 EFCExampleCard
{
  PageType = Card;
  ApplicationArea = All;
  UsageCategory = None;
  SourceTable = EFCExample;
  Caption = 'EFC Example Card';
  
  layout
  {
    area(Content)
    {
      group(General)
      {
        field(FieldOne; Rec.FieldOne)
        {
          ToolTip = 'Specifies the value of the FieldOne field.';

          trigger OnValidate()
          Begin
            TriggerLog.InsertLogEntry('Page ExampleCard', 'OnValidate - FieldOne');
          End;
        }
        field(FieldTwo; Rec.FieldTwo)
        {
          ToolTip = 'Specifies the value of the FieldTwo field.';

          trigger OnValidate()
          Begin
            TriggerLog.InsertLogEntry('Page ExampleCard', 'OnValidate - FieldTwo');
          End;
        }
      }
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
    trigger OnInit()
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnInit');
    End;

    trigger OnOpenPage()
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnOpenPage');
    End;

    trigger OnNewRecord(BelowRec: Boolean)
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnNewRecord');
    End;

    trigger OnClosePage()
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnClosePage');
    End;

    trigger OnFindRecord(Which: Text): Boolean
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnFindRecord');
    End;

    trigger OnNextRecord(Steps: Integer): Integer
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnNextRecord');
    End;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnQueryClosePage');
    End;

    trigger OnAfterGetRecord()
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnAfterGetRecord');
    End;

    trigger OnAfterGetCurrRecord()
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnAfterGetCurrRecord');
    End;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnInsertRecord');
    End;

    trigger OnModifyRecord(): Boolean
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnModifyRecord');
    End;

    trigger OnDeleteRecord(): Boolean
    Begin
        TriggerLog.InsertLogEntry('Page ExampleCard', 'OnDeleteRecord');
    End;

   var
        TriggerLog: Record EFCTriggerLog;
}