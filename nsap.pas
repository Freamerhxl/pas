var g:array[0..501,0..501]of longint;
    h,c:array[0..501]of longint;
    i,j,n,m,k,maxf,nowf,x,y,z:longint;
    found:boolean;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
procedure sap(x:longint);
var i,tf,minh:longint;
begin
  tf:=nowf;minh:=n-1;
  if x=n then
    begin
      inc(maxf,nowf);
      found:=true;
      exit;
    end;
  for i:=1 to n do
    if g[x,i]>0 then
      begin
        if h[x]=h[i]+1 then
          begin
            nowf:=fmin(nowf,g[x,i]);
            sap(i);
            if found then break;
            if h[1]=n then exit;
            nowf:=tf;
          end;
        if h[i]<minh then minh:=h[i];
      end;
  if found then
    begin
      dec(g[x,i],nowf);inc(g[i,x],nowf);
    end
  else
    begin
{      dec(c[h[x]]);
      if c[h[x]]=0 then
        begin
          h[1]:=n;exit;
        end;  }
      h[x]:=minh+1;
 //     inc(c[h[x]]);
    end;
end;
begin
  assign(input,'nsap.in');reset(input);
  assign(output,'nsap.out');rewrite(output);
  readln(m,n);
  for i:=1 to m do
    begin
      readln(x,y,z);
      inc(g[x,y],z);
    end;
  c[0]:=n;
  while h[1]<n do
    begin
      nowf:=maxlongint;
      found:=false;
      sap(1);
    end;
  writeln(maxf);
  close(input);close(output);
end.