var a:array[0..101,1..2]of longint;
    n,i,ans:longint;
begin
  readln(n);
  for i:=1 to n do
    readln(a[i,1],a[i,2]);
  a[n+1]:=a[1];
  for i:=2 to n+1 do
    ans:=ans+a[i-1,1]*a[i,2]-a[i-1,2]*a[i,1];
  writeln(ans>>1);
end.