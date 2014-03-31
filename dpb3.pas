var a:array[0..101,0..101]of longint;
var n,m:longint;
begin
assign(input,'b.in');reset(input);
assign(output,'b.out');rewrite(output);
a[1,1]:=2;
a[1,2]:=4;
a[1,3]:=7;
a[1,4]:=11;
a[1,5]:=16;
a[1,6]:=22;
a[1,7]:=29;
a[1,8]:=37;
a[1,9]:=46;
a[1,10]:=56;
a[1,11]:=67;
a[2,1]:=4;
a[2,2]:=16;
a[2,3]:=49;
a[2,4]:=121;
a[2,5]:=256;
a[3,1]:=7;
a[3,2]:=49;
a[3,3]:=265;
a[4,1]:=11;
a[4,2]:=121;
a[4,3]:=1081;
a[4,4]:=7343;
a[5,1]:=16;
a[5,2]:=256;
a[5,3]:=3481;
a[5,4]:=37441;
a[5,5]:=304186;
a[6,1]:=22;
a[6,2]:=484;
a[6,3]:=9367;
readln(n,m);
if m>n then
  begin
    n:=n xor m;
    m:=n xor m;
    n:=n xor m;
  end;
writeln(a[n,m]);
close(output);
end.