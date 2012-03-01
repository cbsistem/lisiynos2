
 { = = = �㬬� ��������� = = = }
  Function pAdd( A,B:Polynom ):Polynom;

 { = = = �������� ��������� = = = }
  Function pSub( A,B:Polynom ):Polynom;

 { = = = �p���������� ��������� = = = }
  Function pMul( A,B:Polynom ):Polynom;

 { = = = �p��������� = = = }
  Function Derive( P:Polynom ):Polynom;

 { = = = ����p�������� ��⥣p�� = = = }
  Function Integral( P:Polynom; C:Real_Type ):Polynom;

 { = = = ��p�������� ��⥣p�� = = = }
  Function DefineIntegral( P:Polynom; A,B:Real_Type ):Real_Type;

 { = = = ���� ��� ����⢨⥫��� ��p��� = = = }
  Function Polynom_Real_Roots( P:Polynom ):Array_Of_Real;

 { �������������������������������������������¿ }
 { ��       ��쥪� ��������� �������        �� }
 { ��������������������������������������������� }

 { = = = ��쥪� ��������� ������� = = = }
  Type Complex_Polynom = ^Complex_Polynom_Block;
       Complex_Polynom_Block = Object( Array_Of_Complex_Block )
        { ���樠������ ���᪠ �����樥�⮢ }
         Constructor Init( _Deg:Word );
        { �⥯��� �������� }
         Function Deg:Integer;
        { ��������� ���祭�� �����樥�� ��। X � �⥯��� N }
         Procedure S( N:Word; New_Value:Complex );
        { ���뢠��� ���祭�� �����樥�� ��p�� X � �⥯��� N }
         Function G( N:Word ):Complex;
        { ���᫥��� ���祭�� �������� �p� �������� X }
         Function Value( X:Complex ):Complex;
       End;

 { = = = �㬬� ��������� = = = }
  Function cpAdd( A,B:Complex_Polynom ):Complex_Polynom;

 { = = = �������� ��������� = = = }
  Function cpSub( A,B:Complex_Polynom ):Complex_Polynom;

 { = = = �p���������� ��������� = = = }
  Function cpMul( A,B:Complex_Polynom ):Complex_Polynom;

 { �������������������������������������������¿ }
 { ��   ��쥪� �஡��-����������쭠� �㭪��  �� }
 { ��������������������������������������������� }

 { = = = ��쥪� �஡��-����������쭠� �㭪�� = = = }
  Type A_Polynom = ^A_Polynom_Block;
       A_Polynom_Block = Object
         Up,Down:Polynom; { ��᫨⥫� � �������⥫� �஡� }
        { ���樠������ ���᪠ �����樥�⮢ }
         Constructor Init( Up_Deg,Down_Deg:Word );
        { ����⪠ � ���p�⨥ ���᪠ �����樥�⮢ }
         Destructor Done;
        { ��������� ���祭�� �����樥�� ��᫨⥫� ��p�� X � �⥯��� N }
         Procedure SU( N:Word; NewValue:Real_Type );
        { ��������� ���祭�� �����樥�� �������⥫� ��p�� X � �⥯��� N }
         Procedure SD( N:Word; NewValue:Real_Type );
        { ���뢠��� ���祭�� �����樥�� ��᫨⥫� ��p�� X � �⥯��� N }
         Function GU( N:Word ):Real_Type;
        { ���뢠��� ���祭�� �����樥�� �������⥫� ��p�� X � �⥯��� N }
         Function GD( N:Word ):Real_Type;
        { ���᫥��� ���祭�� �p� �������� X }
         Function Value( X:Real_Type ):Real_Type;
        { ����⢨⥫�� ��୨ }
         Function Real_Roots:Array_Of_Real;
       End;

 { = = = �㬬� �஡��-��樮������ �㭪権 = = = }
  Function apAdd( A,B:A_Polynom ):A_Polynom;

 { = = = �������� �஡��-��樮������ �㭪権 = = = }
  Function apSub( A,B:A_Polynom ):A_Polynom;

 { = = = �p���������� �஡��-��樮������ �㭪権 = = = }
  Function apMul( A,B:A_Polynom ):A_Polynom;

 { = = = �p��������� �஡��-��樮������ �㭪権 = = = }
  Function aDerive( P:A_Polynom ):A_Polynom;

{ <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><> }
{ <><><><><><><><><><> } Implementation { <><><><><><><><><><> }
{ <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><> }

 { �������������������������������������������¿ }
 { ��             ��쥪� �������              �� }
 { ��������������������������������������������� }

  Constructor Polynom_Block.Init;
    Begin
      Inherited Init(_Deg+1);
    End;

  Function Polynom_Block.Deg;
    Begin
      Deg:=Num-1;
    End;

  Procedure Polynom_Block.S;
    Begin
      Inherited S(N+1,New_Value);
    End;

  Function Polynom_Block.G;
    Begin
      G:= Inherited G(N+1);
    End;

  Function Polynom_Block.Value;
    Var Result:Real_Type; I:Word;
    Begin
      Result:=List^[Num];
      For I:=(Num-1) downto 1 do Result:=List^[I]+Result*X;
      Value:=Result;
    End;

  Function Polynom_Block.Find_Root;
    Var XB,XE,X,YB,YE,Y:Real_Type; Inc_Flag:Boolean;
    Begin
      XB:=A; YB:=Value(XB);
      XE:=B; YE:=Value(XE);
      Inc_Flag:=YE>YB;
      If YB*YE<=0 then { �᫨ YB � YE ����� p���� ����� }
        Begin
          Repeat
            X:=(XB+XE)/2; Y:=Value(X);
            If Inc_Flag then
              If Y>0 then XE:=X Else XB:=X { �㭪�� ���p��⠥� }
            Else
              If Y<0 then XE:=X Else XB:=X; { �㭪�� �뢠�� }
          Until (XE-XB)<Find_Root_Limit;
          Find_Root:=X;
        End
      Else { �᫨ YB � YE ����� ��������� ����� }
        X:=Max_Real;
      Find_Root:=X;
    End;

  Function Polynom_Block.Plus_Limit;
    Begin
      Plus_Limit:=Round(G(Deg)/Abs(G(Deg)));
    End;

  Function Polynom_Block.Minus_Limit;
    Begin
      Minus_Limit:=1-((Deg mod 2)*2)*Round(G(Deg)/Abs(G(Deg)));
    End;

 { = = = �㬬� ��������� = = = }
  Function pAdd( A,B:Polynom ):Polynom;
    Var Result:Polynom; I,C,D:Word;
    Begin
      C:=Trunc(Min(A^.Deg,B^.Deg));
      D:=Trunc(Max(A^.Deg,B^.Deg));
      New(Result,Init(D));
      For I:=0 to C do Result^.S(I,A^.G(I)+B^.G(I));
      If A^.Deg=D then
        For I:=(C+1) to D do Result^.S(I,A^.G(I))
      Else
        For I:=(C+1) to D do Result^.S(I,B^.G(I));
      pAdd:=Result;
    End;

 { = = = �������� ��������� = = = }
  Function pSub( A,B:Polynom ):Polynom;
    Var Result:Polynom; I,C,D:Word;
    Begin
      C:=Trunc(Min(A^.Deg,B^.Deg));
      D:=Trunc(Max(A^.Deg,B^.Deg));
      New(Result,Init(D));
      For I:=0 to C do Result^.S(I,A^.G(I)-B^.G(I));
      If A^.Deg=D then
        For I:=(C+1) to D do Result^.S(I,A^.G(I))
      Else
        For I:=(C+1) to D do Result^.S(I,-B^.G(I));
      pSub:=Result;
    End;

 { = = = �p���������� ��������� = = = }
  Function pMul( A,B:Polynom ):Polynom;
    Var Result:Polynom; I,J:Word;
    Begin
      New(Result,Init(A^.Deg+B^.Deg));
      For I:=0 to Result^.Deg do Result^.S(I,0);
      For I:=0 to A^.Deg do
        For J:=0 to B^.Deg do
          Result^.S(I+J,Result^.G(I+J)+A^.G(I)*B^.G(J));
      pMul:=Result;
    End;

 { = = = �p��������� = = = }
  Function Derive( P:Polynom ):Polynom;
    Var Result:Polynom; I:Word;
    Begin
      New(Result,Init(P^.Deg-1));
      For I:=0 to Result^.Deg do Result^.S(I,(I+1)*P^.G(I+1));
      Derive:=Result;
    End;

 { = = = ����p�������� ��⥣p�� = = = }
  Function Integral( P:Polynom; C:Real_Type ):Polynom;
    Var Result:Polynom; I:Word;
    Begin
      New(Result,Init(P^.Deg+1));
      Result^.S( 0, C );
      For I:=0 to P^.Deg do Result^.S(I+1,P^.G(I)/(I+1));
      Integral:=Result;
    End;

 { = = = ��p�������� ��⥣p�� = = = }
  Function DefineIntegral( P:Polynom; A,B:Real_Type ):Real_Type;
    Var Temp:Polynom;
    Begin
      Temp:=Integral(P,0);
      DefineIntegral:=Temp^.Value(B)-Temp^.Value(A);
    End;

 { = = = ���� ��� ����⢨⥫��� ��p��� = = = }
  Function Polynom_Real_Roots( P:Polynom ):Array_Of_Real;
    Var Result:Array_Of_Real;    { ��p�� �p������� }
        Temp:Array_Of_Real;      { ��p�� �p������� � ����饭�ﬨ �� �訡�� }
        _Derive : Polynom;       { �p��������� }
        Min_Max : Array_Of_Real; { ��窨 ����㬠 / ����㬠 }
        C,I:Word;                { ���稪� }
        Minus_Limit:ShortInt;    { ���� �������� �p� X -> -��᪮��筮�� }
        Plus_Limit:ShortInt;     { ���� �������� �p� X -> +��᪮��筮�� }
        L,X,Y,DL,UL:Real_Type;   { DL - ������ �p����  UL - ��p娩 }
    Begin
      If P^.Deg=0 then { ��p���⪠ �訡�� }
        Begin
          New(Result,Init(0));
          Polynom_Real_Roots:=Result;
          Exit;
        End;
      If P^.Deg=1 then { ��p���⪠ ��������� �p������� }
        Begin
          If P^.G(1)<>0 then
            Begin
              New(Result,Init(1));
              Result^.S(1,-(P^.G(0)/P^.G(1)));
            End
          Else
            New(Result,Init(0));
          Polynom_Real_Roots:=Result;
          Exit;
        End;
     { * * * ��p���⪠ ���������� ��������� * * * }
     { 1. ��६ �ந������� }
      _Derive:=Derive(P);
     { 2. ��室�� �� ��୨ - ����६�� }
      Min_Max:=Polynom_Real_Roots(_Derive);
     { 3. ��室�� ����� �p������ �������� �� ��᪮��筮�� }
      Plus_Limit:=Round(P^.Plus_Limit);
      Minus_Limit:=Round(P^.Minus_Limit);
     { 4. �饬 �࠭��� �������� }
      If Min_Max^.Num>0 then
        Begin
         { ���� ������ �p����� }
          L:=1; X:=Min_Max^.G(1); Y:=P^.Value(X);
          If Minus_Limit*Y>=0 then
            DL:=X
          Else
            Repeat L:=L*2; DL:=X-L; Until P^.Value(DL)*Y<=0;
         { ���� ��p孥� �p����� }
          L:=1; X:=Min_Max^.G(Min_Max^.Num); Y:=P^.Value(X);
          If Plus_Limit*Y>=0 then
            UL:=X
          Else
            Repeat L:=L*2; UL:=X+L; Until P^.Value(UL)*Y<=0;
        End;
     { ���� ��p��� �� �p�����⪠� ���p��⠭�� / �뢠��� }
      New(Temp,Init(_Derive^.Deg+1));
      Case Min_Max^.Num of
        0:   { ��� ����p��㬮� }
          Begin
            Y:=P^.Value(0);
            If Y<>0 then
              Begin
                X:=Y*_Derive^.Value(0); L:=1;
                Repeat L:=L*2; Until P^.Value(-X*L)*Y<=0;
                If X>0 then
                  Temp^.S(1,P^.Find_Root(0,-X*L))
                Else
                  Temp^.S(1,P^.Find_Root(-X*L,0));
              End
            Else
              Temp^.S(1,0);
          End;
        1:   { 1 ����p��� }
          Begin
            Temp^.S(1,P^.Find_Root(DL,Min_Max^.G(1)));
            Temp^.S(2,P^.Find_Root(Min_Max^.G(1),UL));
          End;
        Else { ����� ����p��㬮� }
          Begin
            Temp^.S(1,P^.Find_Root(DL,Min_Max^.G(1)));
            For C:=2 to Temp^.Num-1 do
               Temp^.S(C,P^.Find_Root(Min_Max^.G(C-1),Min_Max^.G(C)));
            Temp^.S( Temp^.Num,P^.Find_Root(Min_Max^.G(1),UL));
          End;
      End;
      I:=0;
      For C:=1 to Temp^.Num do
        If Temp^.G(C)<>Max_Real then
          Begin Inc(I); Temp^.S(I,Temp^.G(C)); End;
      New( Result, Init(I) );
      For C:=1 to I do Result^.S(C,Temp^.G(C));
      Dispose( Temp, Done );
      Dispose( _Derive, Done );
      Dispose( Min_Max, Done );
      Polynom_Real_Roots:=Result;
    End;

 { �������������������������������������������¿ }
 { ��       ��쥪� ��������� �������        �� }
 { ��������������������������������������������� }

  Constructor Complex_Polynom_Block.Init;
    Begin
      Inherited Init(_Deg+1);
    End;

  Function Complex_Polynom_Block.Deg;
    Begin
      Deg:=Num-1;
    End;

  Procedure Complex_Polynom_Block.S;
    Begin
      Inherited S(N+1,New_Value);
    End;

  Function Complex_Polynom_Block.G;
    Begin
      G:= Inherited G(N+1);
    End;

  Function Complex_Polynom_Block.Value;
    Var Result:Complex; I:Word;
    Begin
      New(Result);
      Result^:=List^[Num];
      For I:=(Num-1) downto 1 do
        Begin
          Result^.Re:=List^[I].Re + Result^.Re*X^.Re - Result^.Im*X^.Im;
          Result^.Im:=List^[I].Im + Result^.Re*X^.Im + Result^.Im*X^.Re;
        End;
      Value:=Result;
    End;

 { = = = �㬬� ��������� = = = }
  Function cpAdd( A,B:Complex_Polynom ):Complex_Polynom;
    Var Result:Complex_Polynom; I,C,D:Word;
    Begin
      C:=Trunc(Min(A^.Deg,B^.Deg));
      D:=Trunc(Max(A^.Deg,B^.Deg));
      New(Result,Init(D));
      For I:=0 to C do Result^.S(I,cAdd(A^.G(I),B^.G(I)));
      If A^.Deg=D then
        For I:=(C+1) to D do Result^.S(I,A^.G(I))
      Else
        For I:=(C+1) to D do Result^.S(I,B^.G(I));
      cpAdd:=Result;
    End;

 { = = = �������� ��������� = = = }
  Function cpSub( A,B:Complex_Polynom ):Complex_Polynom;
    Var Result:Complex_Polynom; I,C,D:Word;
    Begin
      C:=Trunc(Min(A^.Deg,B^.Deg));
      D:=Trunc(Max(A^.Deg,B^.Deg));
      New(Result,Init(D));
      For I:=0 to C do Result^.S(I,cSub(A^.G(I),B^.G(I)));
      If A^.Deg=D then
        For I:=(C+1) to D do Result^.S(I,A^.G(I))
      Else
        For I:=(C+1) to D do Result^.S(I,cSub(cSet(0,0),B^.G(I)));
      cpSub:=Result;
    End;

 { = = = �p���������� ��������� = = = }
  Function cpMul( A,B:Complex_Polynom ):Complex_Polynom;
    Var Result:Complex_Polynom; I,J:Word;
    Begin
      New(Result,Init(A^.Deg+B^.Deg));
      For I:=0 to Result^.Deg do Result^.S(I,cSet(0,0));
      For I:=0 to A^.Deg do
        For J:=0 to B^.Deg do
          Result^.S(I+J,cAdd(Result^.G(I+J),cMul(A^.G(I),B^.G(J))));
      cpMul:=Result;
    End;

 { �������������������������������������������¿ }
 { ��   ��쥪� �஡��-����������쭠� �㭪��  �� }
 { ��������������������������������������������� }

  Constructor A_Polynom_Block.Init( Up_Deg,Down_Deg:Word );
    Begin
      New(Up,Init(Up_Deg));
      New(Down,Init(Down_Deg));
    End;

  Destructor A_Polynom_Block.Done;
    Begin
      Dispose(Up,Done);
      Dispose(Down,Done);
    End;

  Procedure A_Polynom_Block.SU( N:Word; NewValue:Real_Type );
    Begin
      Up^.S(N,NewValue);
    End;

  Procedure A_Polynom_Block.SD( N:Word; NewValue:Real_Type );
    Begin
      Down^.S(N,NewValue);
    End;

  Function A_Polynom_Block.GU( N:Word ):Real_Type;
    Begin
      GU:=Up^.G(N);
    End;

  Function A_Polynom_Block.GD( N:Word ):Real_Type;
    Begin
      GD:=Down^.G(N);
    End;

  Function A_Polynom_Block.Value( X:Real_Type ):Real_Type;
    Var Temp:Real;
    Begin
      Temp:=Down^.Value(X);
      If Temp<>0 then Value:=Up^.Value(X)/Temp Else Value:=Max_Real;
    End;

  Function A_Polynom_Block.Real_Roots:Array_Of_Real;
    Var U,D,Temp,Result:Array_Of_Real; UC,DC,TC,I:Word;
    Begin
      U:=Polynom_Real_Roots(Up);
      D:=Polynom_Real_Roots(Down);
      New(Temp,Init(U^.Num));
      DC:=1; TC:=0;
      For UC:=1 to Up^.Deg do
        Begin
          While (((D^.G(DC)<U^.G(UC)) And (DC<D^.Num))) do Inc(DC);
          If D^.G(DC)<>U^.G(UC) then
            Begin
              Inc(TC);
              Temp^.S(TC,U^.G(UC));
            End;
        End;
      New(Result,Init(TC));
      For I:=1 to TC do Result^.S(I,Temp^.G(I));
      Dispose(Temp,Done);
      Dispose(U,Done);
      Dispose(D,Done);
      Real_Roots:=Result;
    End;
    
 { = = = �㬬� �஡��-��樮������ �㭪権 = = = }
  Function apAdd( A,B:A_Polynom ):A_Polynom;
    Var Result:A_Polynom;
    Begin
      New(Result,Init(0,0));
      Result^.Up:=pAdd(pMul(A^.Up,B^.Down),pMul(B^.Up,A^.Down));
      Result^.Down:=pMul(A^.Down,B^.Down);
      apAdd:=Result;
    End;

 { = = = �������� �஡��-��樮������ �㭪権 = = = }
  Function apSub( A,B:A_Polynom ):A_Polynom;
    Var Result:A_Polynom;
    Begin
      New(Result,Init(0,0));
      Result^.Up:=pSub(pMul(A^.Up,B^.Down),pMul(B^.Up,A^.Down));
      Result^.Down:=pMul(A^.Down,B^.Down);
      apSub:=Result;
    End;

 { = = = �p���������� �஡��-��樮������ �㭪権 = = = }
  Function apMul( A,B:A_Polynom ):A_Polynom;
    Var Result:A_Polynom;
    Begin
      New(Result,Init(0,0));
      Result^.Up:=pMul(A^.Up,B^.Up);
      Result^.Down:=pMul(A^.Down,B^.Down);
      apMul:=Result;
    End;

 { = = = �p��������� �஡��-��樮������ �㭪権 = = = }
  Function aDerive( P:A_Polynom ):A_Polynom;
    Var Result:A_Polynom;
    Begin
      New(Result,Init(0,0));
      Result^.Up:=pSub(pMul(Derive(P^.Up),P^.Down),
                       pMul(P^.Up,Derive(P^.Down)));
      Result^.Down:=pMul(P^.Down,P^.Down);
      aDerive:=Result
    End;

begin
  
end.