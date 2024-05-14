table 70023 EFCMyDevCustomer
{
  DataClassification = CustomerContent;
  Caption = 'My Dev Customer';

  fields
  {
    field(1; "EFCNo."; Code[20])
    {
      Caption = 'No.';
      
    }
    field(2; EFCName; Text[100])
    {
      Caption = 'Name';
    }
    field(3; EFCCity; Text[30])
    {
      Caption = 'City';
    }
  }
  keys
  {
    key(PK; "EFCNo.")
    {
      Clustered = true;
    }
  }
}