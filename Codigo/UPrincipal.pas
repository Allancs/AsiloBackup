unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Menus,
  OleCtrls, SHDocVw,
  jpeg,IniFiles,
  DB, DBClient, SimpleDS;

type
  TPrincipal = class(TForm)
    Env: TBitBtn;
    A: TBitBtn;
    Con: TBitBtn;
    Des: TBitBtn;
    Fun: TBitBtn;
    I: TBitBtn;
    Resp: TBitBtn;
    Par: TBitBtn;
    Pro: TBitBtn;
    Res: TBitBtn;
    S: TBitBtn;
    T: TBitBtn;
    Vol: TBitBtn;
    PoupUP: TTimer;
    Aviso: TGroupBox;
    DBText2: TDBText;
    Ser: TBitBtn;
    GP1: TGroupBox;
    AvisosPoP: TCheckBox;
    MainMenu1: TMainMenu;
    Cadastro: TMenuItem;
    Funcionarios1: TMenuItem;
    Residentes1: TMenuItem;
    Responsaveis1: TMenuItem;
    email: TMenuItem;
    EnviodeEmail1: TMenuItem;
    SMTP: TMenuItem;
    Conta: TMenuItem;
    Conta1: TMenuItem;
    Despesas1: TMenuItem;
    Parceiros1: TMenuItem;
    Profissionais1: TMenuItem;
    Voluntarios1: TMenuItem;
    Avisos: TMenuItem;
    Avisos1: TMenuItem;
    arefas1: TMenuItem;
    Idosos1: TMenuItem;
    Saude: TMenuItem;
    Saude1: TMenuItem;
    incidentes1: TMenuItem;
    UNome: TLabel;
    Rela: TMenuItem;
    Avali: TBitBtn;
    px: TButton;
    an: TButton;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    CadastroConta: TMenuItem;
    tipo: TLabel;
    Sair1: TMenuItem;
    sdsAux: TSimpleDataSet;
    DataSource1: TDataSource;
    Image1: TImage;
    sdsAuxOBS: TStringField;
    sdsAuxDATA: TDateField;
    Tarefas: TCheckBox;
    Aux: TSimpleDataSet;
    DataSource2: TDataSource;
    TarefaPop: TGroupBox;
    DBText3: TDBText;
    DBText4: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    TarefaP: TButton;
    TarefaA: TButton;
    AuxDATA: TDateField;
    AuxTAREFA: TStringField;
    procedure EnvClick(Sender: TObject);
    procedure VolClick(Sender: TObject);
    procedure AClick(Sender: TObject);
    procedure PoupUPTimer(Sender: TObject);
    procedure SerClick(Sender: TObject);
    procedure ResClick(Sender: TObject);
    procedure RespClick(Sender: TObject);
    procedure DesClick(Sender: TObject);
    procedure ConClick(Sender: TObject);
    procedure FunClick(Sender: TObject);
    procedure IClick(Sender: TObject);
    procedure ParClick(Sender: TObject);
    procedure ProClick(Sender: TObject);
    procedure SClick(Sender: TObject);
    procedure TClick(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Avisos1Click(Sender: TObject);
    procedure Conta1Click(Sender: TObject);
    procedure Despesas1Click(Sender: TObject);
    procedure incidentes1Click(Sender: TObject);
    procedure Responsaveis1Click(Sender: TObject);
    procedure EnviodeEmail1Click(Sender: TObject);
    procedure Parceiros1Click(Sender: TObject);
    procedure Profissionais1Click(Sender: TObject);
    procedure Idosos1Click(Sender: TObject);
    procedure Saude1Click(Sender: TObject);
    procedure arefas1Click(Sender: TObject);
    procedure Voluntarios1Click(Sender: TObject);
    procedure SMTPClick(Sender: TObject);
    procedure pxClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure anClick(Sender: TObject);
    procedure CadastroContaClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure AvaliClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TarefaAClick(Sender: TObject);
    procedure TarefaPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses UEmail, UVoluntarios,  UModulo,  USMTP, UIdoso,
  UResponsavel, UCadastroAvisos, UDespesas, UFuncionario, UContas,
  UIncidentes, UParceiros, UProfissionais, USaude, UTarefa,
  UAv,
  ULogin,
  UCadastroConta;

{$R *.dfm}

procedure TPrincipal.EnvClick(Sender: TObject);
begin
Emails.Visible := True;
end;

procedure TPrincipal.VolClick(Sender: TObject);
begin
Voluntarios.visible := true;
end;

procedure TPrincipal.AClick(Sender: TObject);
begin
CadastroAvisos.Visible := True;
end;

procedure TPrincipal.PoupUPTimer(Sender: TObject);
begin
   if AvisosPop.Checked = true
     then
     begin
           Aviso.Visible := True;
      end
      Else
       Begin
      Aviso.Visible := False;
      End;

       if Tarefas.Checked = true
     then
     begin
           TarefaPop.Visible := True;
      end
      Else
       Begin
      TarefaPop.Visible := False;
      End;
  end;

procedure TPrincipal.SerClick(Sender: TObject);
begin
SMTPs.Visible := True;
end;

procedure TPrincipal.ResClick(Sender: TObject);
begin
Idoso.Visible := True;
end;

procedure TPrincipal.RespClick(Sender: TObject);
begin
Responsavel.Visible := True;
end;

procedure TPrincipal.DesClick(Sender: TObject);
begin
Despesas.Visible := True;
end;

procedure TPrincipal.ConClick(Sender: TObject);
begin
Contas.Visible := True;
end;

procedure TPrincipal.FunClick(Sender: TObject);
begin
Funcionario.Visible := True;
end;

procedure TPrincipal.IClick(Sender: TObject);
begin
Incidentes.Visible := True;
end;

procedure TPrincipal.ParClick(Sender: TObject);
begin
Parceiros.Visible := True;
end;

procedure TPrincipal.ProClick(Sender: TObject);
begin
Profissionais.Visible := True;
end;

procedure TPrincipal.SClick(Sender: TObject);
begin
Saudes.Visible := True;
end;

procedure TPrincipal.TClick(Sender: TObject);
begin
Tarefa.Visible := True;
end;

procedure TPrincipal.Funcionarios1Click(Sender: TObject);
begin
Funcionario.Visible := True;
end;

procedure TPrincipal.Avisos1Click(Sender: TObject);
begin
CadastroAvisos.Visible := True;
end;

procedure TPrincipal.Conta1Click(Sender: TObject);
begin
Contas.Visible := True;
end;

procedure TPrincipal.Despesas1Click(Sender: TObject);
begin
Despesas.Visible := True;
end;

procedure TPrincipal.incidentes1Click(Sender: TObject);
begin
Incidentes.Visible := True;
end;

procedure TPrincipal.Responsaveis1Click(Sender: TObject);
begin
Responsavel.Visible := True;
end;

procedure TPrincipal.EnviodeEmail1Click(Sender: TObject);
begin
Email.Visible := True;
end;

procedure TPrincipal.Parceiros1Click(Sender: TObject);
begin
Parceiros.Visible := True;
end;

procedure TPrincipal.Profissionais1Click(Sender: TObject);
begin
Profissionais.Visible := True;
end;

procedure TPrincipal.Idosos1Click(Sender: TObject);
begin
Idoso.Visible := True;
end;

procedure TPrincipal.Saude1Click(Sender: TObject);
begin
Saude.Visible := True;
end;

procedure TPrincipal.arefas1Click(Sender: TObject);
begin
Tarefa.Visible := True;
end;

procedure TPrincipal.Voluntarios1Click(Sender: TObject);
begin
Voluntarios.visible := true;
end;

procedure TPrincipal.SMTPClick(Sender: TObject);
begin
SMTP.Visible := True;
end;

procedure TPrincipal.pxClick(Sender: TObject);
begin
sdsAux.Prior;
//Modulo.cdsAviso.Prior;
end;

procedure TPrincipal.Button2Click(Sender: TObject);
begin
Login.visible := true;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
     If TLogin.Create(Self).ShowModal = mrCancel
     Then Begin
        Application.Terminate;
        Exit;
        End;
         If (ULogin.User = 'admin')
             Then Begin
             Tarefa.btnDeletar.Enabled := true;
             Tarefa.btnEditar.Enabled := true;
             Tarefa.btnCancelar.Enabled := true;
                  Cadastro.Visible := true;
                  Conta.Visible := true;
                  Rela.Visible := true;
                  SMTP.Visible := true;
                  email.Visible := true;
                  tipo.visible := true;
                  CadastroAvisos.btnEditar.visible := true;
                  CadastroAvisos.btnInserir.visible := true;
                  CadastroAvisos.btnCancelar.visible := true;
                  CadastroAvisos.btnDeletar.visible := true;
                  CadastroAvisos.btnGravar.visible := true;
                  Tarefa.btnEditar.visible := true;
                  Tarefa.btnInserir.visible := true;
                  Tarefa.btnCancelar.visible := true;
                  Tarefa.btnDeletar.visible := true;
                  Tarefa.btnGravar.visible := true;
                  pro.visible := true;
                  par.visible := true;
                  con.visible := true;
                  des.visible := true;
                  res.visible := true;
                  fun.visible := true;
                  resp.visible := true;
                  vol.visible := true;
                  env.visible := true;
                  ser.visible := true;
                  avali.visible := true;
                  CadastroConta.Visible := true;
                  Tarefa.btnInserir.Enabled := true;
                  Tarefa.btnGravar.Enabled := true;
                  


                    end
                    else If (ULogin.User = 'padrao')
                    then
                    begin
                    pro.visible := true;
                    par.visible := true;
                    con.visible := true;
                    des.visible := true;
                    res.visible := true;
                    fun.visible := true;
                    resp.visible := true;
                    vol.visible := true;
                    env.visible := true;
                    ser.visible := true;
                    avali.visible := true;
                    //Saudes.btnDeletar.Visible := false;
//Incidentes.btnDeletar.Visible := false;
Tarefa.btnDeletar.Visible := false;
CadastroAvisos.btnDeletar.Visible := false;
//Parceiros.btnDeletar.Visible := false;
Contas.btnDeletar.Visible := false;
Despesas.btnDeletar.Visible := false;
//Responsavel.btnDeletar.Visible := false;
//Funcionario.btnDeletar.Visible := false;
Voluntarios.btnDeletar.Visible := false;
Emails.Mostrar.Visible := false;
Emails.Ocutar.Visible := false;
Ser.Visible := false;
Emails.Baixo.Visible := false;

end;
end;



procedure TPrincipal.anClick(Sender: TObject);
begin
sdsAux.Next;
//Modulo.cdsAviso.Next;
end;

procedure TPrincipal.CadastroContaClick(Sender: TObject);
begin
  CadastroContas.Visible := true;
end;

procedure TPrincipal.Sair1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TPrincipal.AvaliClick(Sender: TObject);
begin
Avaliacao.Visible := True;
end;

procedure TPrincipal.FormActivate(Sender: TObject);
Var       TxtConsulta, TxxtConsulta, DtaAtual : String;
begin

          // Pega a Data
          DtaAtual := DateToStr(Date);
          // Troca a / por . (Firebird guarda a data com . e nao /)
          DtaAtual := StringReplace(DtaAtual, '/', '.', [rfreplaceall]);

          // para formatar a data -> FormatDateTime('mm/dd/yyyy', SuaData)

          TxtConsulta :=
          'SELECT OBS, DATA FROM AVISOS WHERE DATA >= '
           + QuotedStr(DtaAtual);
           //+ QuotedStr(DateToStr(DateTimePicker1.DateTime) com troca / por .);

          // Executa
          sdsAux.Close;
          sdsAux.DataSet.CommandText := TxtConsulta;
          sdsAux.Open;
          TxxtConsulta :=
          'Select DATA, TAREFA From TAREFA WHERE DATA >='
          + QuotedStr(DtaAtual);
          Aux.Close;
          Aux.DataSet.CommandText := TxxtConsulta;
          Aux.Open;

end;

procedure TPrincipal.TarefaAClick(Sender: TObject);
begin
Aux.Next;
end;

procedure TPrincipal.TarefaPClick(Sender: TObject);
begin
Aux.Prior;
end;

end.






