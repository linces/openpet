unit uGlobal;

interface

uses
  SysUtils;

type
  EGUIException = class(Exception)
  end;

function IsAdmin: boolean;
function IsManager: boolean;
procedure CheckAdmin;
procedure CheckManager;

implementation

uses
  Dialogs;

const
  AdminPass = 'blabla2';
  ManagerPass = 'jucabala';

function IsAdmin: boolean;
var
  Password: string;
begin
  Result :=
    InputQuery('Autoriza��o', 'Digite a senha para essa opera��o', Password)
    and (Password = AdminPass);
end;

function IsManager: boolean;
var
  Password: string;
begin
  Result :=
    InputQuery('Autoriza��o', 'Digite a senha para essa opera��o', Password)
    and ((Password = AdminPass) or (Password = ManagerPass));
end;

procedure CheckAdmin;
begin
  if not IsAdmin then
    raise Exception.Create('Opera��o cancelada');
end;

procedure CheckManager;
begin
  if not IsAdmin then
    raise Exception.Create('Opera��o cancelada');
end;

end.
