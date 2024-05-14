table 70026 EFCTriggerLog
{
    Caption = 'EFCTriggerLog';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "EFCEntryNo."; Integer)
        {
            Caption = 'EFCEntryNo.';
        }
        field(2; EFCObjectName; Text[100])
        {
            Caption = 'EFCObjectName';
        }
        field(3; EFCTriggerName; Text[100])
        {
            Caption = 'EFCTriggerName';
        }
        field(4; EFCTimestamp; DateTime)
        {
            Caption = 'Timestamp';
        }
    }
    keys
    {
        key(PK; "EFCEntryNo.")
        {
            Clustered = true;
        }
    }
    
    procedure InsertLogEntry(ObjectName: Text[100]; TriggerName: Text[100])
    var 
        TriggerLog: Record EFCTriggerLog;
        EntryNo: Integer;
    begin
        EntryNo := 1;
        if TriggerLog.FindLast() then
            EntryNo := TriggerLog."EFCEntryNo." + 1;

        TriggerLog.Reset();
        TriggerLog.Init();
        TriggerLog."EFCEntryNo." := EntryNo;
        TriggerLog.EFCObjectName := ObjectName;
        TriggerLog.EFCTriggerName := TriggerName;
        TriggerLog.EFCTimestamp := CurrentDateTime;
        TriggerLog.Insert();
    end;

    procedure ClearLogEntries()
    var
        triggerLog: Record EFCTriggerLog;
    begin
        if TriggerLog.IsEmpty() then
            TriggerLog.DeleteAll();
    end;
}
