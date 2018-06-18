[Setup]
AppName=Validity Fingerprint Common Driver
AppVersion=4.5.289.0
AppPublisher=Validity Fingerprint Common Driver
AppPublisherURL=http://www.lenovo.com/support
AppSupportURL=http://www.lenovo.com/support
AppUpdatesURL=http://www.lenovo.com/support
Compression=lzma2/ultra
DefaultDirName=C:\SWTOOLS\DRIVERS\Fingerprint\lz4xr6a2
DefaultGroupName=Validity Fingerprint Common Driver
DisableProgramGroupPage=yes
LicenseFile=\\10.176.36.8\PreloadPA3\temp\Judy\Fingeprint\exe\lz4xr6a2\ILAENG_template.txt
OutputBaseFilename=lz4xr6a2
OutputDir=\\10.176.36.8\PreloadPA3\temp\Judy\Fingeprint\exe\lz4xr6a2
SolidCompression=yes
VersionInfoCopyright=Copyright (C) Lenovo 2012.
VersionInfoDescription=""
VersionInfoProductName=Validity Fingerprint Common Driver
VersionInfoProductTextVersion=4.5.289.0
VersionInfoProductVersion=4.5.289.0
VersionInfoTextVersion=4.5.289.0
VersionInfoVersion=4.0.100.1124
Uninstallable=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "\\10.176.36.8\PreloadPA3\temp\Judy\Fingeprint\*"; DestDir: "{app}"; Flags: createallsubdirs ignoreversion recursesubdirs

[Run]
Filename: "{sys}\dllhost.exe"; Description: "{cm:LaunchProgram,Validity Fingerprint Common Driver}"; Flags: shellexec waituntilterminated postinstall runascurrentuser; AfterInstall: Install();

[CustomMessages]
LaunchProgram=Install %1 now

[Code]
var iReturnCode, iTemp: Integer;

function IsSilent(): Integer;
begin
  if Pos('/VERYSILENT', GetCmdTail()) > 0 then begin
    Result :=SW_HIDE;
  end else
    Result :=SW_SHOW;
end;

function IsExtract(): Boolean;
var
  str: String;
begin
  str := ExpandConstant('{param:EXTRACT|no}');
  case str of
    'yes': Result :=True;
    'Yes': Result :=True;
    'YES': Result :=True;
  else
    Result := False;
  end;
end;

function GetParam(): String;
var
  str: String;
  de: String;
  replacement: String;
  index: Integer;
begin
  str := ExpandConstant('{param:PARAM}');
  de :='!!';
  replacement :='"';

  While pos(de, str) <> 0 do begin
    index := pos(de, str);
    delete(str, index, 2);
    insert(replacement, str, index);
  end;

  Result := str;
end;

procedure Install();
begin
  if IsExtract() then begin
    iReturnCode := 0;
  end else
    if Exec(ExpandConstant('{app}\WBFDDKSetup_CMN_5011.exe'), GetParam(), '', IsSilent(), ewWaitUntilTerminated, iTemp) then begin
      iReturnCode := iTemp;
    end else
      iReturnCode := -1;
end;

function GetCustomSetupExitCode(): Integer;
begin
  Result := iReturnCode;
end;



