var data:array[0..100001,1..3]of integer;
    f:array[0..100001,1..3,1..3,1..2]of longint;
    i,j,n,ans:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  assign(input,'garden.in');reset(input);
  assign(output,'garden.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    for j:=1 to 3 do
      read(data[i,j]);
  fillchar(f,sizeof(f),$f7);
  f[1,1,1,1]:=data[1,1];
  f[1,2,2,1]:=data[1,2];
  f[1,2,2,2]:=data[1,2];
  f[1,3,3,2]:=data[1,3];
  for i:=2 to n do
    begin
      f[i,1,1,1]:=fmax(f[i-1,1,2,2],f[i-1,1,3,2])+data[i,1];
      f[i,2,1,1]:=fmax(f[i-1,2,2,2],f[i-1,2,3,2])+data[i,1];
      f[i,3,1,1]:=fmax(f[i-1,3,2,2],f[i-1,3,3,2])+data[i,1];
      f[i,1,2,1]:=f[i-1,1,3,2]+data[i,2];
      f[i,2,2,1]:=f[i-1,2,3,2]+data[i,2];
      f[i,3,2,1]:=f[i-1,3,3,2]+data[i,2];
      f[i,1,2,2]:=f[i-1,1,1,1]+data[i,2];
      f[i,2,2,2]:=f[i-1,2,1,1]+data[i,2];
      f[i,3,2,2]:=f[i-1,3,1,1]+data[i,2];
      f[i,1,3,2]:=fmax(f[i-1,1,2,1],f[i-1,1,1,1])+data[i,3];
      f[i,2,3,2]:=fmax(f[i-1,2,2,1],f[i-1,2,1,1])+data[i,3];
      f[i,3,3,2]:=fmax(f[i-1,3,2,1],f[i-1,3,1,1])+data[i,3];
    end;
  ans:=fmax(f[n,1,2,2],f[n,1,3,2]);
  ans:=fmax(ans,fmax(f[n,2,3,2],f[n,2,1,1]));
  ans:=fmax(ans,fmax(f[n,3,1,1],f[n,3,2,1]));
  writeln(ans);
  close(input);close(output);
end.