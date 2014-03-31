var f:array[0..8001]of longint;
    data:array[0..maxint,1..3]of longint;
    n,m,i,j,ans,a,b:longint;
begin
  assign(input,'embro.in');reset(input);
  assign(output,'embro.out');rewrite(output);
  readln(n,m);
  for i:=1 to 3 do
    begin
      read(a);read(data[a,1],data[a,2]);
    end;
  fillchar(f,sizeof(f),$f7);
  f[0]:=0;
  for i:=1 to n do
    begin
      readln(b,a);
      for j:=m downto b*data[a,2]+b do
        if(f[j-(b*data[a,2]+b)]>=0)then
        if(f[j-(b*data[a,2]+b)]+b*data[a,1]>f[j])then
          f[j]:=f[j-(b*data[a,2]+b)]+b*data[a,1];
    end;
  for i:=0 to m do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
  close(input);close(output);
end.
