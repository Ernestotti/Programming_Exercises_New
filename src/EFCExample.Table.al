table 70027 EFCExample
{
    Caption = 'EFCExample';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; FieldOne; Integer)
        {
            Caption = 'FieldOne';

            trigger OnValidate()
            begin
                TriggerLog.InsertLogEntry('Table Example', 'OnValidate - FieldOne');
            end;
        }
        field(2; FieldTwo; Integer)
        {
            Caption = 'FieldTwo';

            trigger OnValidate()
            begin
                TriggerLog.InsertLogEntry('Table Example', 'OnValidate - FieldOTwo');
            end;
        }
    }
    keys
    {
        key(PK; FieldOne)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    Begin
        TriggerLog.InsertLogEntry('Table Example', 'OnInsert');
    End;
    
    trigger OnModify()
    Begin
        TriggerLog.InsertLogEntry('Table Example', 'OnModify');
    End;
    
    trigger OnDelete()
    Begin
        TriggerLog.InsertLogEntry('Table Example', 'OnDelete');
    End;

    trigger OnRename()
    Begin
        TriggerLog.InsertLogEntry('Table Example', 'OnRename');
    End;
    var
        TriggerLog: Record EFCTriggerLog;
}
