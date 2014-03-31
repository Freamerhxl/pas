type  point=^node;
      node=record
        l,r,min:longint;
        lc,rc:point;
end;
var tree:point;
    f,a:array[0..100001]of longint;
    i,j,n,m,k,min:longint;

procedure maketree(l,r:longint;var p:point);
var mid:longint;
begin
  p^.l:=l;p^.r:=r;p^.min:=1000000;
  if l=r then exit;
  mid:=(l+r)>>1;
  new(p^.lc);new(p^.rc);
  maketree(l,mid,p^.lc);maketree(mid+1,r,p^.rc);
end;

procedure ins(p:point;x:longint);
var mid:longint;
begin
  if(p^.l=p^.r)and(p^.l=x)then
    begin
      p^.min:=f[x];exit;
    end
  else
    begin
      mid:=(p^.l+p^.r)>>1;
      if(x>mid)then
        begin
          ins(p^.rc,x);
          if p^.rc^.min<p^.min then
            p^.min:=p^.rc^.min;
        end
      else
        begin
          ins(p^.lc,x);
          if p^.lc^.min<p^.min then
            p^.min:=p^.lc^.min;
        end;
    end;
end;
function find(l,r:longint;p:point):longint;
var mid,min:longint;
begin
  if(p^.l=l)and(p^.r=r)then
    exit(p^.min)
  else
    begin
      mid:=(p^.l+p^.r)>>1;
      if l>mid then
        exit(find(l,r,p^.rc))
      else
      if r<=mid then
        exit(find(l,r,p^.lc))
      else
        begin
          find:=find(l,mid,p^.lc);
          min:=find(mid+1,r,p^.rc);
          if min<find then find:=min;
        end;
    end;
end;
begin
  assign(input,'park.in');reset(input);
  assign(output,'park.out');rewrite(output);
  readln(n,m);
  new(tree);
  maketree(1,n,tree);
  for i:=1 to n do
    read(a[i]);

  for i:=n downto 1 do
    begin
      if(i+a[i]>n)then
        f[i]:=1
      else
      if a[i]=0 then
        f[i]:=1000000
      else
        f[i]:=find(i+1,i+a[i],tree)+1;
      ins(tree,i);
    end;
  min:=f[1];

  for i:=2 to n do
    begin
      if min+1<f[i]then f[i]:=min+1;
      if f[i]<min then min:=f[i];
    end;
  for i:=1 to m-1 do
    begin
      read(k);write(f[k],' ');
    end;
  read(k);writeln(f[k]);
  close(input);close(output);
end.
