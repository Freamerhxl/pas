var a,b:ansistring;
    x,y:longint;
    ans:int64;
function gcd(a,b:int64):int64;
begin
  if b=0 then exit(a)
  else exit(gcd(b,a mod b));
end;
procedure work1(a,b:ansistring);
var i,j,k1,k2:longint;

begin
  k1:=pos('.',a);k2:=pos('.',b);
end;
procedure work2(a,b:ansistring);
var op,fza2,fzb2,fma2,fmb2,ansfz:int64;
    fza,fzb,fma,fmb:longint;
    st:ansistring;
begin
  st:=copy(a,1,pos('/',a)-1);
  delete(a,1,pos('/',a));
  val(st,fza,fza);
  val(a,fma,fma);
  st:=copy(b,1,pos('/',b)-1);
  delete(b,1,pos('/',b));
  val(st,fzb,fzb);
  val(b,fmb,fmb);
  op:=gcd(fza,fma);
  fza:=fza div op;
  fma:=fma div op;
  op:=gcd(fzb,fmb);
  fzb:=fzb div op;
  fmb:=fmb div op;
  op:=gcd(fma,fmb);
  op:=int64(fma)*int64(fmb)div op;
  fza2:=int64(fza)*(op div fma);
  fma2:=op;
  fzb2:=int64(fzb)*(op div fmb);
  fmb2:=op;
  ansfz:=int64(fza2)+int64(fzb2);
  op:=gcd(ansfz,fma2);
  ansfz:=ansfz div op;
  fma2:=fma2 div op;
  write(ansfz);if fma2>1 then writeln('/',fma2);
end;
begin
  readln(a);
  readln(b);
  if(pos('.',a)>0)or(pos('.',b)>0)then
    work1(a,b)
  else
  if(pos('/',a)>0)or(pos('/',b)>0)then
    work2(a,b)
  else
    begin
      val(a,x,x);
      val(b,y,y);
      writeln(int64(x)+int64(y));
    end;
end.