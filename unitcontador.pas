unit unitContador;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnGanhou: TButton;
    btnPerdeu: TButton;
    btnNovaRodada: TButton;
    btnNovaPartida: TButton;
    Label1: TLabel;
    lblEnergia: TLabel;
    sbStatus: TStatusBar;
    procedure btnGanhouClick(Sender: TObject);
    procedure btnNovaPartidaClick(Sender: TObject);
    procedure btnNovaRodadaClick(Sender: TObject);
    procedure btnPerdeuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private
    energia: integer;
    rodada: integer;

  public
    procedure novaPartida();
    procedure atualizaEnergia();
    procedure atualizaRodada();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
     novaPartida();
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin
  sbStatus.Panels[0].Text := 'Tecla: ' + Key;
  case Key of
    '1': btnGanhouClick(Sender);
    '2': btnPerdeuClick(Sender);
    '3': btnNovaRodadaClick(Sender);
    '0': btnNovaPartidaClick(Sender);
  end;
end;

procedure TForm1.btnGanhouClick(Sender: TObject);
begin
  energia += 1;
  atualizaEnergia();
end;

procedure TForm1.btnNovaPartidaClick(Sender: TObject);
begin
  novaPartida();
end;

procedure TForm1.btnNovaRodadaClick(Sender: TObject);
begin
  energia += 2;
  rodada += 1;
  atualizaEnergia();
  atualizaRodada();
end;

procedure TForm1.btnPerdeuClick(Sender: TObject);
begin
  energia -= 1;
  atualizaEnergia();
end;

procedure TForm1.novaPartida();
begin
     energia := 3;
     rodada := 1;
     atualizaEnergia();
     atualizaRodada();
end;

procedure TForm1.atualizaEnergia();
begin
     lblEnergia.Caption := IntToStr(energia);
end;

procedure TForm1.atualizaRodada();
begin
  sbStatus.Panels[1].Text := 'Rodada ' + IntToStr(rodada);
end;

end.

