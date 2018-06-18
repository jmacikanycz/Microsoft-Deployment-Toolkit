[Setup]
AppName=Lenovo Fingerprint Manager
AppVersion=4.5.289.0
AppPublisher=Lenovo Fingerprint Manager
AppPublisherURL=http://www.lenovo.com/support
AppSupportURL=http://www.lenovo.com/support
AppUpdatesURL=http://www.lenovo.com/support
Compression=lzma2/ultra
DefaultDirName=C:\SWTOOLS\DRIVERS\Fingerprint\ls4c78a2
DefaultGroupName=Lenovo Fingerprint Manager
DisableProgramGroupPage=yes
LicenseFile=\\10.176.36.8\PreloadPA3\temp\Judy\Fingeprint\exe\ls4c78a2\ILAENG_template.txt
OutputBaseFilename=ls4c78a2
OutputDir=\\10.176.36.8\PreloadPA3\temp\Judy\Fingeprint\exe\ls4c78a2
SolidCompression=yes
VersionInfoCopyright=Copyright (C) Lenovo 2012.
VersionInfoDescription=""
VersionInfoProductName=Lenovo Fingerprint Manager
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
Filename: "{sys}\dllhost.exe"; Description: "{cm:LaunchProgram,Lenovo Fingerprint Manager}"; Flags: shellexec waituntilterminated postinstall runascurrentuser; AfterInstall: Install();

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
    if Exec(ExpandConstant('{app}\WBF_Synaptics_FMA_CMN_Setup_L.exe'), GetParam(), '', IsSilent(), ewWaitUntilTerminated, iTemp) then begin
      iReturnCode := iTemp;
    end else
      iReturnCode := -1;
end;

function GetCustomSetupExitCode(): Integer;
begin
  Result := iReturnCode;
end;



