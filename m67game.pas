var n,m,i,k:longint;
    h,l:array[0..21,0..21]of integer;
    map:array[0..21,0..21]of boolean;
    hh,ll,nl,nh,ch,cl,nll,nhh:array[0..21]of longint;
function can(x,y,z:longint):boolean;
begin
  if z=0 then
    begin
      if((hh[x]=h[x,nh[x]])or(hh[x]=0))and((ll[y]=l[y,nl[y]])or(ll[y]=0))then
        exit(true);
      exit(false);
    end
  else
    begin
      if(hh[x]<h[x,nh[x]])and(ll[y]<l[y,nl[y]])then exit(true);
      exit(false);
    end;
end;
procedure dfs(x,y:longint);
var t1,t2,t3,t4,i,j:integer;
begin
  if y>m then
    begin
      if(ch[x]<>nhh[x])then exit;
      inc(x);y:=1;nh[x]:=1;hh[x]:=0;
    end;
  if x>n then
    begin
      for i:=1 to n do
        if(nh[i]<h[i,0])or(hh[i]<>h[i,nh[i]])then exit;
      for i:=1 to m do
        if(nl[i]<l[i,0])or(ll[i]<>l[i,nl[i]])then exit;
      for i:=1 to n do begin
      for j:=1 to m do
        if map[i,j]then
          write('##')
        else write('  ');
      writeln;end;
      close(output);halt;
    end;
  if can(x,y,0)then
    begin
      map[x,y]:=false;
      t1:=hh[x];t2:=ll[y];t3:=nh[x];t4:=nl[y];
      if hh[x]<>0 then inc(nh[x]);if ll[y]<>0 then inc(nl[y]);
      hh[x]:=0;ll[y]:=0;
      dfs(x,y+1);
      hh[x]:=t1;ll[y]:=t2;nh[x]:=t3;nl[y]:=t4;
    end;
  if can(x,y,1)then
    begin
      map[x,y]:=true;
      nhh[x]:=nhh[x]+1;
      t1:=hh[x];t2:=ll[y];t3:=nh[x];t4:=nl[y];
      inc(hh[x]);inc(ll[y]);
      dfs(x,y+1);
      dec(nhh[x]);
      hh[x]:=t1;ll[y]:=t2;nh[x]:=t3;nl[y]:=t4;
    end;
end;
begin
  assign(input,'game.in');reset(input);
  assign(output,'game.out');rewrite(output);
  readln(m,n);
  for i:=1to m do
    begin
      read(k);nl[i]:=1;
      while k<>0  do
        begin
          inc(l[i,0]);l[i,l[i,0]]:=k;cl[i]:=cl[i]+k;  read(k);
        end;
    end;
  for i:=1to n do
    begin
      read(k);nh[i]:=1;
      while k<>0  do
        begin
          inc(h[i,0]);h[i,h[i,0]]:=k;ch[i]:=ch[i]+k;  read(k);
        end;
    end;
  dfs(1,1);
  close(input);close(output);
end.