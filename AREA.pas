var a:array[0..101,1..2]of longint;
    i,n:longint;
    ans:longint;
function p(x1,y1,x2,y2:longint):longint;
begin
  exit(x1*y2-x2*y1);
end;
begin
  assign(input,'AREA.in');reset(input);
  assign(output,'AREA.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i,1],a[i,2]);
    end;
  a[n+1]:=a[1];
  for i:=1 to n do
    ans:=ans+p(a[i,1],a[i,2],a[i+1,1],a[i+1,2]);
 writeln(ans>>1);
 close(input);close(output);
end.