page 70026 EFCTriggerLogList
{
  PageType = List;
  ApplicationArea = All;
  UsageCategory = Lists;
  SourceTable = EFCTriggerLog;
  Caption = 'TriggerLog List';
  Editable = false;

  
  layout
  {
    area(Content)
    {
      repeater(General)
      {
        field("EFCEntryNo."; Rec."EFCEntryNo.")
        {
          ToolTip = 'Specifies the value of the Entry No. field';
        }
        field(EFCObjectName; Rec.EFCObjectName)
        {
          ToolTip = 'Specifies the value of the Object Name field';
        }
        field(EFCTriggerName; Rec.EFCTriggerName)
        {
          ToolTip = 'Specifies the value of the Trigger Name field';
        }
        field(EFCTimestamp; Rec.EFCTimestamp)
        {
          ToolTip = 'Specifies the value of the Timestamp field';
        }
      }
    }
  }

  actions
  {
    area(Processing)
    {
      action(ClearLogEntries)
      {
        ApplicationArea = All;
        Caption = 'Clear log entries';
        ToolTip = 'Clear log entries';
        Image = ClearLog;

        trigger OnAction()
        begin
          Rec.ClearLogEntries();
        end;
      }
    }
    area(Promoted)
    {
      actionref(ClearLogEntries_ref; ClearLogEntries) { }
    }
  }
}