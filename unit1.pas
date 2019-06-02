unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  tcp_udpport, ISOTCPDriver, PLCTagNumber, PLCBlock, HMIEdit, HMICheckBox;

type

  { TForm1 }

  TForm1 = class(TForm)
    BConnect: TButton;
    BStart: TButton;
    BStop: TButton;
    BDisconnect: TButton;
    EIpAddress: TEdit;
    ERack: TEdit;
    ESlot: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    HMIEdit1: THMIEdit;
    HMIEdit2: THMIEdit;
    ISOTCPDriver1: TISOTCPDriver;
    LConnectionState: TLabel;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    TagCounterControl: TPLCTagNumber;
    TagSetPoint: TPLCTagNumber;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    TagCurrentValue: TPLCTagNumber;
    TCPPort: TTCP_UDPPort;
    procedure BConnectClick(Sender: TObject);
    procedure BDisconnectClick(Sender: TObject);
    procedure BStartClick(Sender: TObject);
    procedure BStopClick(Sender: TObject);
    procedure TCPPortCommPortClosed(Sender: TObject);
    procedure TCPPortCommPortOpened(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.TCPPortCommPortClosed(Sender: TObject);
begin
  LConnectionState.Caption := 'NOT CONNECTED';
  LConnectionState.Color := clRed;
end;

procedure TForm1.TCPPortCommPortOpened(Sender: TObject);
begin
  LConnectionState.Caption := 'CONNECTED';
  LConnectionState.Color := clGreen;
end;

procedure TForm1.BConnectClick(Sender: TObject);
begin
  TCPPort.Host := EIpAddress.Text;
  ISOTCPDriver1.PLCRack := strtoint(ERack.Text);
  ISOTCPDriver1.PLCSlot := strtoint(ESlot.Text);
  TCPPort.Active := true;
end;

procedure TForm1.BDisconnectClick(Sender: TObject);
begin
  TCPPort.Active := false;
end;

procedure TForm1.BStartClick(Sender: TObject);
begin
  TagCounterControl.Value := 1;
end;

procedure TForm1.BStopClick(Sender: TObject);
begin
  TagCounterControl.Value := 2;
end;

end.

