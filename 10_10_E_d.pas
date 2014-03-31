var f,d:array[-302..302,-302..302]of longint;
    a:array[0..302]of ansistring;
    i,j,n,k,ans,op,t:longint;
    st:ansistring;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'dance.in');reset(input);
  readln(n);
  for i:=n downto 1 do
    begin
      readln(st);
      j:=pos(' ',st);
      while j>0 do begin delete(st,j,1);j:=pos(' ',st);end;
      a[i]:=st;
      for j:=1 to 2*i-1 do
        if st[j]='-' then
         f[i,j]:=f[i,j-1]+1
        else f[i,j]:=0;
    end;
   for i:=1 to n do
   for j:=1 to 2*i-1 do
    if(a[i][j]='-')and(odd(j))then
      begin
        if f[i,j]>2 then
          d[i,j]:=fmin(d[i,j-2],d[i-1,j-2])+1
        else
          d[i,j]:=1;
        if d[i,j]>ans then ans:=d[i,j];
      end;
   for i:=n downto 1 do
   for j:=1 to 2*i-1 do
   if not(odd(j))and(a[i][j]='-')then
     begin
       if f[i,j]>2 then
         d[i,j]:=fmin(d[i,j-2],d[i+1,j])+1
       else d[i,j]:=1;
       if d[i,j]>ans then ans:=d[i,j];
     end;
  writeln(ans*ans);
end.