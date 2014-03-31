const p=1000000007;
var f1,f2:array[0..2001,0..2001]of longint;
    i,j,n,m:longint;
    s1,s2:ansistring;
begin
  assign(input,'password.in');reset(input);
  assign(output,'password.out');rewrite(output);
  readln(s1);readln(s2);
   for i:=0 to length(s1)do
    f2[i,0]:=1;
  for i:=0 to length(s2)do
    f2[0,i]:=1;
  for i:=1 to length(s1)do
  for j:=1 to length(s2)do
  begin
    if s1[i]=s2[j]then
      f1[i,j]:=f1[i-1,j-1]+1
    else
      if f1[i-1,j]>f1[i,j-1]then
        f1[i,j]:=f1[i-1,j]
      else f1[i,j]:=f1[i,j-1];

    if s1[i]=s2[j]then
      f2[i,j]:=f2[i-1,j-1]
    else
      begin
        if f1[i,j-1]=f1[i,j]then
          f2[i,j]:=(f2[i,j]+f2[i,j-1])mod p;
        if f1[i-1,j]=f1[i,j]then
          f2[i,j]:=(f2[i,j]+f2[i-1,j])mod p;
      end;
  end;
  writeln(f2[length(s1),length(s2)]);
  close(input);close(output);
end.