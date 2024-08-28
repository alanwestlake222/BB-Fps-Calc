unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem5: TMenuItem;
    time1: TEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    time2: TEdit;
    BBweight: TEdit;
    DistanceToMic: TEdit;
    travelTime: TEdit;
    velocityIMP: TEdit;
    velocityMetric: TEdit;
    shotEnergy: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
const
  metricConversion = 0.3048;          //from feet to metres
  speedOfSound = 1125;                //speed of sound in feet per sec

var
  start, stop, weight, distance : double ;
  shotTime, timetoMic, velFPS, velMetres, Energy : double ;

begin
  Try
     //convert the text in the boxes to floats
     start := StrToFloat(time1.Text) ;
     stop := StrToFloat(time2.Text) ;
     weight := StrToFloat(BBweight.Text) ;
     distance := StrToFloat(distanceToMic.Text);

     //do the calcs
     shotTime := stop - start ;                 //find the time
     timetoMic := distance / speedOfSound;      //take account of mic distance
     shotTime := shotTime - timetoMic;          //so shot time is slightly shorter
     velFPS := distance / shotTime;             //fps (vel) = distance/time
     velMetres := velFPS * metricConversion;    //convert to metric
     Energy := 0.5*(weight/1000)*Power(velMetres,2);  //joules = 1/2 mv^2

     //populate the results
     travelTime.Text := FloatToStr(RoundTo(shotTime,-4));
     velocityIMP.Text := FloatToStr(RoundTo(velFPS,0));
     velocityMetric.Text := FloatToStr(RoundTo(velMetres ,-1));
     shotEnergy.Text := FloatToStr(RoundTo(Energy,-2));

  except
      on E: Exception do
        //ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
        ShowMessage( 'Error. Enter valid numbers in all 4 boxes' );
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    Close;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  ShowMessage('BB Feet per second and Energy calculator' + sLineBreak
   + sLineBreak +'Version 0.1 ')
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
 ShowMessage('Use an audio tool like Audacity to find the firing time'
   + sLineBreak + 'and time at the target. Try and be accurate, EG:'
   + sLineBreak + 'Start 2.545 and End 2.591 giving travel time of 0.0353secs.'
   + sLineBreak + 'Remember to measure the distance target to microphone in feet.'
   + sLineBreak + 'Audacity will let you both zoom in and slow the '
   + sLineBreak + 'recording down. Listen carefully for the shot and '
   + sLineBreak + 'the sound of the BB hitting the target. '
   + sLineBreak + 'If you get a sensible number like 300 fps '
   + sLineBreak + 'you are probably doing it right. ' ) ;
end;

end.

