unit Unit1;

interface

uses
  SysUtils, Variants, Classes,Graphics,
  Controls,Forms, Dialogs,Grids, StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    Edit3: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Y: array of double;
  M: integer;
  C: array of double;
  X,P: double;
  Name: string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i : integer;
begin
    M  :=StrToInt(Edit2.Text);
    X:=StrToFloat(Edit3.Text);
    SetLength(C,M+1);
    //Name:='';
    StringGrid1.ColCount:=M+1;

    for i := 0 to M do StringGrid1.Cells[i,0]:='C('+intToStr(i)+')';

    for i := 0 to M do StringGrid1.Cells[i,1]:=IntToStr(Random(10));

    for i := 0 to M do C[i]:=StrToFloat(StringGrid1.Cells[i,1]);

    for i := 0 to M do StringGrid1.Cells[i,2]:=FloatToStr(C[i]);
    Label1.Caption:='Р=';

    for i := 0 to M do Label1.Caption:=Label1.Caption+'+'+FloatToStr(C[i])
                                       +'*'+FloatToStr(X)+'^'+IntToStr(i);


    P:=C[M];
    for i := M-1 downto 0 do P:=P*X+C[i];

     Label5.Caption:='Значение полинома Р ='+FloatToStrF(P,Fffixed,12,4);

end;
end.
