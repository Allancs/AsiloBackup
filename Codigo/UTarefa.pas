unit UTarefa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  Buttons,
  jpeg, ExtCtrls,
  FMTBcd, DB, SqlExpr;

type
  TTarefa = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btnGravar: TBitBtn;
    Esquerda: TSpeedButton;
    Direita: TSpeedButton;
    btnInserir: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    Image1: TImage;
    sqlAux: TSQLQuery;
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tarefa: TTarefa;

implementation

uses UModulo;

{$R *.dfm}

procedure TTarefa.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;
          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          btnGravar.Enabled      := True;
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_TAREFA) AS ULTIMO FROM TAREFA ');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsTarefa.Insert;
           Modulo.cdsTarefaCOD_TAREFA.Value := NReg;
           DBEdit2.SetFocus;

end;

procedure TTarefa.btnGravarClick(Sender: TObject);
begin
Modulo.cdsTarefa.Post;

         Modulo.cdsTarefa.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TTarefa.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsTarefa.Cancel;
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled       := False;
          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;
          btnGravar.Enabled      := False;
end;

procedure TTarefa.btnDeletarClick(Sender: TObject);
begin
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled       := False;


 If
           MessageDlg ('Voc� tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsTarefa.Delete;
                         Modulo.cdsTarefa.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
end;

end.
