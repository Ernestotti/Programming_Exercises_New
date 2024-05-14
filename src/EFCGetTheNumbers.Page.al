page 70027 EFCGetTheNumbers
{
  PageType = Card;
  ApplicationArea = All;
  UsageCategory = Administration;
  Caption = 'EFC Get The Numbers';
  
  layout
  {
    area(Content)
    {
      group(General)
      {
        Caption = 'Input';
        field(EFCInput; Input)
        {
          ApplicationArea = All;
          Caption = 'Input';
          Tooltip = 'Specifies the value of the Input field';
          
        }
      }
    }
  }
  
  actions
  {
    area(Processing)
    {
      action(Execute)
      {
        ApplicationArea = All;
        Caption = 'Execute';
        ToolTip = 'Executes the Execute action';
        Image = ExecuteBatch;
        trigger OnAction()
        begin
          Message(GetTheNumbers());
        end;
      }
    }
    area(Promoted)
    {
      actionref(Execute_ref; Execute) { }
    }
  }
  
  var
    Input: Text;

  local procedure GetTheNumbers() InputResult: Text
  var
    i: Integer;
    InputList: List of [Text];
    Character: Text;
  begin
    for i := 1 to StrLen(Input) do
      InputList.Add(CopyStr(Input, i, 1));

    foreach Character in InputList do
      if IsNumber(Character) then
        InputResult += Character;
    
    if InputResult = '' then
      InputResult := 'None';
  end;

  local procedure IsNumber(Cahracter: Text): Boolean
  begin
    if Cahracter in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      exit(true);
  end;
}
