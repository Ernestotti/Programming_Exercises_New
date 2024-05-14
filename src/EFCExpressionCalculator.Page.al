page  70020 EFCExpressionCalculator
{
  PageType = Card;
  ApplicationArea = All;
  UsageCategory = Administration;
  Caption = 'EFC Expression Calculator';
  
  layout
  {
    area(Content)
    {
      group(Input)
      {
        Caption = 'Input';
        field(FirstValue; FirstValue)
        {
          Caption = 'First';
          ApplicationArea = All;
          ToolTip = 'Specifies the value of the First field.';
        }
        field(SecondValue; SecondValue)
        {
          Caption = 'Second';
          ApplicationArea = All;
          ToolTip = 'Specifies the value of the Second field.';
        }
      }
      group(Output)
      {
        Caption = 'Output';
        group(Left)
        {
          ShowCaption = false;
          field(EFCResult; Result)
          {
            Caption = 'Result';
            ApplicationArea = All;
            Editable = false;
            ToolTip = 'Specifies the value of the Result field.';
          }
        }
        group(Right)
        {
          ShowCaption = false;
          field(IsBigger; IsBigger)
          {
            Caption = 'Is bigger';
            ApplicationArea = All;
            Editable = false;
            ToolTip = 'Specifies the value of the Is bigger field.';
          }
          field(IsSmaller; IsSmaller)
          {
            Caption = 'Is smaller';
            ApplicationArea = All;
            Editable = false;
            ToolTip = 'Specifies the value of the Is smaller field.';
          }
        }
      }
    }
  }
  actions
  {
    area(Processing)
    {
      action(Plus)
      {
        ApplicationArea = All;
        Caption = '+';
        Image = Calculate;
        ToolTip = 'Executes the + action.';
        trigger OnAction()
        begin
          Result := FirstValue + SecondValue;
        end;
      }
      action(Substract)
      {
        ApplicationArea = All;
        Caption = '-';
        Image = Calculate;
        ToolTip = 'Executes the - action.';
        trigger OnAction()
        begin
          Result := FirstValue - SecondValue;
        end;
      }
      action(Multiply)
      {
        ApplicationArea = All;
        Caption = '*';
        Image = Calculate;
        ToolTip = 'Executes the * action.';
        trigger OnAction()
        begin
          Result := FirstValue * SecondValue;
        end;
      }
      action(Split)
      {
        ApplicationArea = All;
        Caption = '/';
        Image = Calculate;
        ToolTip = 'Executes the / action.';
        trigger OnAction()
        begin
          if SecondValue = 0 then
            Result := 0
          else
            Result := FirstValue / SecondValue;
        end;
      }
      action(IsBiggerThan)
      {
        ApplicationArea = All;
        Caption = '>';
        Image = Calculate;
        ToolTip = 'Executes the > action.';
        trigger OnAction()
        begin
          InitResults();
          if FirstValue > SecondValue then
            IsBigger := true;
        end;
      }
       action(IsSmallerThan)
      {
        ApplicationArea = All;
        Caption = '<';
        Image = Calculate;
        ToolTip = 'Executes the < action.';
        trigger OnAction()
        begin
          InitResults();
          if FirstValue < SecondValue then
            IsSmaller := true;
        end;
      }
      action(MOD)
      {
        ApplicationArea = All;
        Caption = 'MOD';
        Image = Calculate;
        ToolTip = 'Executes the MOD action.';
        trigger OnAction()
        begin
          if SecondValue = 0 then
            Result := 0
          else
            Result := FirstValue mod SecondValue
        end;
      }
      action(DIV)
      {
        ApplicationArea = All;
        Caption = 'DIV';
        Image = Calculate;
        ToolTip = 'Executes the DIV action.';
        trigger OnAction()
        begin
          if SecondValue = 0 then
            Result := 0
          else
            Result := FirstValue div SecondValue;
        end;
      }
    }
    area(Promoted)
    {
      actionref(Plusref; Plus) { }
      actionref(Substractref; Substract) { }
      actionref(Multiplyref; Multiply) { }
      actionref(Splitref; Split) { }
      actionref(IsBiggerThanref; IsBiggerThan) { }
      actionref(IsSmallerrThanref; IsSmallerThan) { }
      actionref(MODref; MOD) { }
      actionref(DIVref; DIV) { }
    }
  }
  
  var
    FirstValue, SecondValue, Result: Decimal;
    IsBigger, IsSmaller: Boolean;

  local procedure InitResults()
  begin
    Result := 0;
    IsBigger := false;
    IsSmaller := false;
  end;
}