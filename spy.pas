var c,a,map:array[0..201,0..201]of longint;
    gap,h:array[0..201]of longint;
    i,j,n,m,s,t,p,x,y,z,maxf,nowf,l,r,mid:longint;
    found:boolean;
procedure sap(x:longint);
var i,tempf,minh:longint;
begin
  if x=t then
    begin
      inc(maxf,nowf);
      found:=true;
      exit;
    end;
  tempf:=nowf;minh:=maxlongint;
  for i:=1to n do
    if c[x,i]>0 then
      begin
        if h[x]+1=h[i]then
          begin
            if c[x,i]<nowf then nowf:=c[x,i];
            sap(i);
            if h[s]>=n then exit;
            if found then break;
            nowf:=tempf;
          end;
        if h[i]<minh then minh:=h[i];
      end;
  map:=new;
  if found then
    begin
      inc(c[i,x],nowf);
      dec(c[x,i],nowf);
    end
  else
    begin
      dec(gap[h[x]]);
      if gap[h[x]]=0 then
        begin
          h[s]:=n;
          exit;
        end;
      h[x]:=minh+1;
      inc(gap[h[x]]);
    end;
end;
begin
  readln(n,m);
  readln(s,t,p);
  for i:=1 to m do
    begin
      readln(x,y,z);
      inc(c[x,y],z);
    end;
  map:=c;
  gap[0]:=n;
  while h[s]<n do
    begin
      found:=false;
      nowf:=maxlongint;
      sap(s);
    end;
  if maxf=0 then
    writeln('0 Warship.')
  else if maxf>=p then
    writeln('Taston is angry!')
  else
    begin

    end;
end.