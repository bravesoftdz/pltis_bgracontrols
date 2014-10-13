unit uPSI_BGRAPascalScript;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_BGRAPascalScript = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_bgrapascalscript(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_bgrapascalscript_Routines(S: TPSExec);

procedure Register;

implementation


uses
   BGRABitmap
  ,BGRABitmapTypes
  ,BGRAPascalScript
  ;
 
 
procedure Register;
begin
  RegisterComponents('BGRA Controls', [TPSImport_bgrapascalscript]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_BGRAPascalScript(CL: TPSPascalCompiler);
begin
 CL.AddDelphiFunction('Procedure bgra_Create( id : Integer)');
 CL.AddDelphiFunction('Procedure bgra_CreateFromFile( id : Integer; AFilename : string)');
 CL.AddDelphiFunction('Procedure bgra_Destroy( id : Integer)');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_BGRAPascalScript_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@bgra_Create, 'bgra_Create', cdRegister);
 S.RegisterDelphiFunction(@bgra_CreateFromFile, 'bgra_CreateFromFile', cdRegister);
 S.RegisterDelphiFunction(@bgra_Destroy, 'bgra_Destroy', cdRegister);
end;

 
 
{ TPSImport_BGRAPascalScript }
(*----------------------------------------------------------------------------*)
procedure TPSImport_BGRAPascalScript.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_BGRAPascalScript(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_BGRAPascalScript.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  //RIRegister_BGRAPascalScript(ri);
  RIRegister_BGRAPascalScript_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.