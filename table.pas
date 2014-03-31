var c:array[0..501,0..501]of longint;
    h,co:array[0..501]of longint;
    a,b:array[0..501]of longint;
    i,j,n,m,k,maxflow,nowflow,sum:longint;
    found:boolean;
procedure sap(x:longint);
var i,t,minh:longint;
begin
  if x=n+m+1 then
    begin
      inc(maxflow,nowflow);
      found:=true;
      exit;
    end;
  minh:=n+m+2;t:=nowflow;
  for i:=0 to n+m+1 do
   if(c[x,i]>0) then
     begin
       if h[x]=h[i]+1 then
         begin
           if c[x,i]<nowflow then nowflow:=c[x,i];
           sap(i);
           if found then break;
           nowflow:=t;
         end;
       if h[i]<minh then minh:=h[i];
     end;
  if found then
    begin
      dec(c[x,i],nowflow);
      inc(c[i,x],nowflow);
    end
  else
    begin
      dec(co[h[x]]);
      if co[h[x]]=0 then h[0]:=n+m+4;
      h[x]:=minh+1;
      inc(co[minh+1]);
    end;
end;
begin
  assign(input,'table.in');reset(input);
  assign(output,'table.out');rewrite(output);
  readln(m,n);
  for i:=1 to m do
    begin
    read(a[i]);
    sum:=sum+a[i];
    end;
  for i:=1 to n do
    read(b[i]);
  for i:=1 to m do
    c[0,i]:=a[i];
  for i:=m+1 to n+m do
    c[i,n+m+1]:=b[i-m];
  for i:=1 to m do
  for j:=m+1 to n+m do
    c[i,j]:=1;
  co[0]:=n+m+2;
  while h[0]<n+m+2 do
    begin
      nowflow:=maxlongint;
      found:=false;
      sap(0);
    end;
  if maxflow<sum then
    writeln(0)
  else
    begin
      writeln(1);
      for i:=1 to m do
      begin
      for j:=m+1 to m+n do
       if c[i,j]=0 then
         write(j-m,' ');
      writeln;
      end;
    end;
  close(input);close(output);
end.
