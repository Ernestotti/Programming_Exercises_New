codeunit 70018 EFCVariablesAndDatatypes
{
  trigger OnRun()
  begin
    String1 := 'HolaMundoDeMuchosPersonajesEnLaCadena';
    String2 := CopyStr(String1, 1, MaxStrLen(String2));
    Message(String2);
    Message('El valor de %1 es %2', 'LoopNo', LoopNo);
  end;

  // [EventSubscriber(ObjectType::Table, Database::Item, OnAfterValidateEvent, Description, false, false)]
  // local procedure SetItemDescriptionAfterValidateEvent(var Rec: Record Item; var xRec: Record Item; CurrFieldNo: Integer)
  // begin
  //   if StrLen(Rec.Description) > 20 then
  //     Error('Descripcion demasiado larga');
  // end;

  [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", OnAfterLogin, '', false, false)]
  local procedure GetEmployeeBirthOnAfterLogin()
  var
    Employee: Record Employee;
    TodayMonthDay: Text;
    EmployeeBirthMonthDay: Text;
  begin
    TodayMonthDay := CopyStr(Format(Today, 0, '<Month,2><Day,2>'), 1, 4);
    if Employee.FindSet() then
      repeat
        EmployeeBirthMonthDay := CopyStr(Format(Employee."Birth Date", 0, '<Month,2><Day,2>'), 1, 4);
        if TodayMonthDay = EmployeeBirthMonthDay then
          Message(Employee.Name);
      until Employee.Next() = 0;
  end;

  var
    Color: Option Red,Green,Blue;
    LoopNo: Integer;
    MyDate: Date;
    MyText: Text;
    LoopNoDec: Decimal;
    String1: Text[60];
    String2: Text[30];
}