var f1:array[0..201,0..201]of longint;
    f2:array[0..10001]of longint;
    a:array[0..10001]of longint;
    i,j,k,n,m:longint;
    s:ansistring;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'FORMAT.IN');reset(input);
  assign(output,'FORMAT.OUT');rewrite(output);
  readln(n);
  fillchar(f1,sizeof(f1),43);
  for i:=1 to n do
    f1[2,i]:=(i-1)*(i-1);
  f1[1,0]:=0;
  for i:=1 to n do
   f1[1,i]:=500;
  for i:=3 to n do
  for j:=i-1 to n do
  for k:=i-2 to j-1 do
    f1[i,j]:=fmin(f1[i,j],f1[i-1,k]+sqr(j-k-1));
  fillchar(f2,sizeof(f2),43);
  f2[0]:=0;
  m:=0;
  while not eof do
    begin
      readln(s);s:=s+' ';
      while length(s)>0 do
        begin
          while s[1]=' ' do delete(s,1,1);
          i:=pos(' ',s);
          if i>0 then
            begin
              inc(m);a[m]:=i-1;
              delete(s,1,i);
            end;
        end;
    end;
  for i:=2 to m do
    a[i]:=a[i-1]+a[i];
  for i:=1 to m do
    begin
      for j:=i downto 1 do
        if n-(a[i]-a[j-1])>=i-j then
          f2[i]:=fmin(f2[j-1]+f1[i-j+1,n-(a[i]-a[j-1])],f2[i])
        else break;
    end;
  writeln('Minimal badness is ',f2[m],'.');
  close(input);close(output);
end.
