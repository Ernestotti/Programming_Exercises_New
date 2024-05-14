pageextension 70019 EFCCustomerList extends "Customer List"
{
  actions
  {
    addfirst("&Customer")
    {
      action(EFCVariablesAndDatatypes)
      {
        Caption = 'Run Codeunit VariablesAndDatatypes';
        ToolTip = 'Run Codeunit VariablesAndDatatypes';
        Image = Process;
        ApplicationArea = All;
        RunObject = codeunit EFCVariablesAndDatatypes;
      }
    }
  }
}
