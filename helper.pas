unit helper;

interface
uses Windows, Messages, SysUtils, Classes, advApiHook, PSAPI, TlHelp32,
  fs_iinterpreter,WinSock;

  // ������� ��������������
  function DataPckToStrPck(var pck): string; stdcall;
  function SymbolEntersCount(s: string): string;
  function HexToString(Hex:String):String;
  function StringToHex(str1,Separator:String):String;
  function ByteArrayToHex(str1:array of Byte; size: Word):String;
  function StringToWideString(const s: AnsiString; codePage: Word): WideString;
  function WideStringToString(const ws: WideString; codePage: Word): AnsiString;

  // ��� ������ � ��������
  // ������� ������ �� ������
  function GetSocketData(Socket: TSocket; var Data; const Size: Word): Boolean;
  //������� ����������� �������
  function WaitClient(var hSocket, NewSocket: TSocket): Boolean;
  //���������� � ��������
  function ConnectToServer(var hSocket: TSocket; Port: Word; IP: Integer): Boolean;
  //��������� �����
  procedure DeInitSocket(const hSocket: Integer);
  //�������������� �����
  function InitSocket(var hSocket: TSocket; Port: Word; IP: String): Boolean;

  
  function GetNamePacket(s:string):string; // �������� �������� ����� �� ������
  procedure GetProcessList(var sl: TStrings); // �������� ������ ���������
  procedure ShowMessageNew(const Msg: string); // �������� ��������� FastScript

  function CRLFToSpace(const Str: string): string;
  function DSpaceToCRLF(const Str: string): string;
  function CopyArr(arr: array of Byte; ind, count: Integer): string;
  procedure AntiLIIC4(var data: array of Byte);

type
  //������
  TScript = record
    fsScript: TfsScript;
    Name: string;
    Compilled: Boolean;
    cs: RTL_CRITICAL_SECTION;
  end;
  
var
  ShowMessageOld: procedure (const Msg: string);
  Scripts: array[0..63] of TScript;
  WSA: TWSAData;

const
  {The name of the debug info support L2phx}
  UnLoadDllSuccessfully = '���������� %s ������� ���������';
  LoadDllUnSuccessful = '���������� %s ����������� ��� ������������� ������ �����������';
  LoadDllSuccessfully = '������� ��������� %s';
  StartLocalServer = '�� %d ��������������� ��������� ������';
  FailedLocalServer = '��������� ���������������� ��������� ������ �� ����� %d'+ #13#10+ '�������� ���� ���� ����� ������ �����������';
  CreateNewConnect = '������� ����� ���������� - %d';
  ConnectBreak = '���������� %d ���������';
  WSA_VER=$202;

implementation

function DataPckToStrPck(var pck): string; stdcall;
var
  tpck: packed record
    size: Word;
    id: Byte;
  end absolute pck;
begin
  SetLength(Result,tpck.size-2);
  Move(tpck.id,Result[1],Length(Result));
end;

function SymbolEntersCount(s: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(s) do
    if not(s[i] in [' ',#10,#13]) then
      Result:=Result+s[i];
end;

function HexToString(Hex:String):String;
var
  buf:String;
  bt:Byte;
  i:Integer;
begin
  buf:='';
  Hex:=SymbolEntersCount(UpperCase(Hex));
  for i:=0 to (Length(Hex) div 2)-1 do begin
    bt:=0;
    if (Byte(hex[i*2+1])>$2F)and(Byte(hex[i*2+1])<$3A)then bt:=Byte(hex[i*2+1])-$30;
    if (Byte(hex[i*2+1])>$40)and(Byte(hex[i*2+1])<$47)then bt:=Byte(hex[i*2+1])-$37;
    if (Byte(hex[i*2+2])>$2F)and(Byte(hex[i*2+2])<$3A)then bt:=bt*16+Byte(hex[i*2+2])-$30;
    if (Byte(hex[i*2+2])>$40)and(Byte(hex[i*2+2])<$47)then bt:=bt*16+Byte(hex[i*2+2])-$37;
    buf:=buf+char(bt);
  end;
  HexToString:=buf;
end;

function StringToHex(str1,Separator:String):String;
var
  buf:String;
  i:Integer;
begin
  buf:='';
  for i:=1 to Length(str1) do begin
    buf:=buf+IntToHex(Byte(str1[i]),2)+Separator;
  end;
  Result:=buf;
end;

function ByteArrayToHex(str1:array of Byte; size: Word):String;
var
  buf:String;
  i:Integer;
begin
  buf:='';
  for i:=0 to size-1 do begin
    buf:=buf+IntToHex(str1[i],2);
  end;
  Result:=buf;
end;

function WideStringToString(const ws: WideString; codePage: Word): AnsiString;
var
  l: integer;
begin
  if ws = '' then
    Result := ''
else
  begin
    l := WideCharToMultiByte(codePage,
      WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
      @ws[1], -1, nil, 0, nil, nil);
    SetLength(Result, l - 1);
    if l > 1 then
      WideCharToMultiByte(codePage,
        WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
        @ws[1], -1, @Result[1], l - 1, nil, nil);
  end;
end;

function StringToWideString(const s: AnsiString; codePage: Word): WideString;
var
  l: integer;
begin
  if s = '' then
    Result := ''
else
  begin
    l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, PChar(@s[1]), -1, nil,
      0);
    SetLength(Result, l - 1);
    if l > 1 then
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PChar(@s[1]),
        -1, PWideChar(@Result[1]), l - 1);
  end;
end;


function GetSocketData(Socket: TSocket; var Data; const Size: Word): Boolean;
var
  Position: Word;
  Len: Integer;
  DataB: array[0..$5000] of Byte absolute Data;
begin
  Result:=False;
  Position:=0;
  while Position<Size do begin
    Len:=recv(Socket,DataB[Position],1,0);
    if Len<=0 then Exit;
    Inc(Position, Len);
  end;
  Result:=True;
end;

function WaitClient(var hSocket, NewSocket: TSocket): Boolean;
var
  Addr_in: sockaddr_in;
  AddrSize: Integer;
begin
  Result:=False;
  if listen(hSocket, 1)<>0 then
  begin
    DeInitSocket(hSocket);
    Exit;
  end;
  FillChar(Addr_in,SizeOf(sockaddr_in),0);
  Addr_in.sin_family:=AF_INET;
  Addr_in.sin_addr.s_addr:=inet_addr(PChar('0.0.0.0'));
  Addr_in.sin_port:=HToNS(0);
  AddrSize:=SizeOf(Addr_in);
  NewSocket:=accept(hSocket,@Addr_in,@AddrSize);
  if NewSocket>0 then Result:=True;
  if not Result then begin
    DeInitSocket(NewSocket);
    DeInitSocket(hSocket);
  end;
end;

function ConnectToServer(var hSocket: TSocket; Port: Word; IP: Integer): Boolean;
var
  Addr_in: sockaddr_in;
begin
  Result:=False;
  Addr_in.sin_family:=AF_INET;
  Addr_in.sin_addr.S_addr:=IP;
  Addr_in.sin_port:=Port;
  if connect(hSocket,Addr_in,SizeOf(Addr_in))=0 then Result:=True;
  if not Result then DeInitSocket(hSocket);
end;

procedure DeInitSocket(const hSocket: Integer);
begin
  // ��������� �����
  if hSocket <> INVALID_SOCKET then closesocket(hSocket);
end;

function InitSocket(var hSocket: TSocket; Port: Word; IP: String): Boolean;
var
  Addr_in: sockaddr_in;
begin
  Result:=False;
  hSocket := socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
  if hSocket = INVALID_SOCKET then
  begin
    DeInitSocket(hSocket);
    Exit;
  end;
  FillChar(Addr_in, SizeOf(sockaddr_in), 0);
  Addr_in.sin_family:= AF_INET;
  Addr_in.sin_addr.s_addr := inet_addr(PChar(IP));
  Addr_in.sin_port := HToNS(Port);
  if bind(hSocket, Addr_in, SizeOf(sockaddr_in)) <> 0 then  //������, ���� ������ ����
  begin
    DeInitSocket(hSocket);
    Exit;
  end;
  Result := True;
end;

function GetNamePacket(s:string):string;
var
  ik: Word;
begin
  Result:='';
  ik:=1;
  // ���� ����� ����� ������
  while (s[ik]<>':') and (ik<Length(s)) do begin
    Result:=Result+s[ik];
    Inc(ik);
  end;
  if (ik=Length(s))and(s[ik]<>':') then Result:=Result+s[ik];
end;

procedure GetProcessList(var sl: TStrings);
var
  pe: TProcessEntry32;
  ph, snap: THandle; //����������� �������� � ������
  mh: hmodule; //���������� ������
  procs: array[0..$FFF] of dword; //������ ��� �������� ������������ ���������
  count, cm: cardinal; //���������� ���������
  i: integer;
  ModName: array[0..max_path] of char; //��� ������
  tmp: string;
begin
  sl.Clear;
  if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
  begin //���� ��� Win9x
    snap := CreateToolhelp32Snapshot(th32cs_snapprocess, 0);
    if integer(snap)=-1 then
    begin
      exit;
    end
    else
    begin
      pe.dwSize:=sizeof(pe);
      if Process32First(snap, pe) then
        repeat
          sl.Add(string(pe.szExeFile));
        until not Process32Next(snap, pe);
    end;
  end else begin //���� WinNT/2000/XP
    if not EnumProcesses(@procs, sizeof(procs), count) then
    begin
      exit;
    end;
    for i:=0 to (count div 4) - 1 do if procs[i] <> 4 then
    begin
      EnablePrivilegeEx(INVALID_HANDLE_VALUE,'SeDebugPrivilege');
      ph := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, procs[i]);
      if ph > 0 then
      begin
        EnumProcessModules(ph, @mh, 4, cm);
        GetModuleFileNameEx(ph, mh, ModName, sizeof(ModName));
        tmp:=LowerCase(ExtractFileName(string(ModName)));
        sl.Add(IntToStr(procs[i])+'='+tmp);
        CloseHandle(ph);
      end;
    end;
  end;
end;

{�������� ��������� � ���, ��� ���������� ������ FastScript}
procedure ShowMessageNew(const Msg: string);
begin
  if Msg<>'Unregistered version of FastScript.' then
    ShowMessageOld(Msg);
end;
{�� ����� ��� ������������}
function CRLFToSpace(const Str: string): string;
var
  P: Integer;
begin
  Result:=str;
  repeat
    P:=Pos(sLineBreak, Result);
    if P>0 then
    begin
      Result[P]:=' ';
      Result[P+1]:=' ';
    end;
  until P=0;
end;
{�� ����� ��� ������������}
function DSpaceToCRLF(const Str: string): string;
var
  P: Integer;
begin
  Result:=str;
  repeat
    P:=Pos('  ', Result);
    if P>0 then
    begin
      Result[P]:=sLineBreak[1];
      Result[P+1]:=sLineBreak[2];
    end;
  until P=0;
end;
{�� ����� ��� ������������}
function CopyArr(arr: array of Byte; ind, count: Integer): string;
begin
  SetLength(Result,count);
  Move(arr[ind],Result[1],count);
end;

{�� ����� ��� ������������}
procedure AntiLIIC4(var data: array of Byte);
var
  i:Word;
  crc: Byte;
begin
  crc:=0;
  i:=3;
  while not((data[i]=0)and(data[i+1]=0)) do begin
    crc:=crc xor data[i];
    Inc(i);
  end;
  data[4]:=crc;
  data[2]:=$07;
end;

end.