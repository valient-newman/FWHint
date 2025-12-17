////////////////////////////////////////////////////////////////////////////////
//
//  ****************************************************************************
//  * Project   : Fangorn Wizards Lab Exstension Library v1.35
//  * Unit Name : FWHint
//  * Purpose   : Registering class to work with application hints.
//  * Author    : Alexander (Rouse_) Bagel
//  * Copyright : © Fangorn Wizards Lab 1998 - 2005.
//  * Version   : 1.04
//  ****************************************************************************
//

{ Corrections were made to comply with Delphi 2009 requirements.               }
{ Date last modified by Newman:  December 17, 2025                             }
{ Github Repository <https://github.com/valient-newman>                        }

unit FWHintReg;

interface

uses
  Windows, Classes, SysUtils, Controls, TypInfo, Graphics, 
  {$IFDEF VER130}
    DsgnIntf
  {$ELSE}
    DesignIntf, DesignEditors
  {$ENDIF};

type
  // Editor for property About
  TFWHintAboutPropertyEditor = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses FWHint;

procedure Register;
begin
  RegisterComponents('DFS', [TFWHint]);
  RegisterPropertyEditor(TypeInfo(String), TFWHint, 'About', TFWHintAboutPropertyEditor);
end;

{ TAboutPropertyEditor }

procedure TFWHintAboutPropertyEditor.Edit;
begin
  inherited;
 {$IF CompilerVersion >= 20.0}
 // Delphi 2009 and higher
  MessageBoxEx(0,
    PWideChar('Fangorn Wizards Lab Exstension Library v1.35'+ #13#10 +
    '© Fangorn Wizards Lab 1998 - 2005' + #13#10 +
    'Author: Alexander (Rouse_) Bagel' + #13#10 +
    'Corrections made by Valient Newman.'),
    'About...',  MB_ICONASTERISK, LANG_NEUTRAL);
  {$ELSE}
  MessageBoxEx(0,
    PAnsiChar('Fangorn Wizards Lab Exstension Library v1.35'+ #13#10 +
    '© Fangorn Wizards Lab 1998 - 2005' + #13#10 +
    'Author: Alexander (Rouse_) Bagel' + #13#10 +
    'Corrections made by Valient Newman.'),
    'About...',  MB_ICONASTERISK, LANG_NEUTRAL);
  {$IFEND}
end;

function TFWHintAboutPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;

end.
