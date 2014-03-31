type point=^node;
     node=record
       sum:longint;
       l,r:longint;
       lc,rc:point;
end;
var tree:point;
    n,m,i,x,y:longint;
    ans:extended;
procedure make(l,r:longint;var p:point);
var mid,temp:longint;
begin
  p^.l:=l;p^.r:=r;
  if l=r then
    begin
      read(temp);p^.sum:=temp;
      exit;
    end
  else
    begin
      mid:=(l+r)>>1;
      new(p^.lc);make(l,mid,p^.lc);
      new(p^.rc);make(mid+1,r,p^.rc);
      p^.sum:=p^.lc^.sum+p^.rc^.sum;
    end;
end;
function find(l,r:longint;p:point):longint;
var mid:longint;
begin
  if(p^.l=l)and(p^.r=r)then
    exit(p^.sum)
  else
    begin
      mid:=(p^.l+p^.r)>>1;
      if(mid>=r)then
        exit(find(l,r,p^.lc))
      else
      if(mid<l)then
        exit(find(l,r,p^.rc))
      else
        exit(find(l,mid,p^.lc)+find(mid+1,r,p^.rc));
    end;
end;
procedure change(x:longint;p:point);
var mid:longint;
begin
  if(p^.l=p^.r)and(p^.l=x)then
    begin
      p^.sum:=0;
    end
  else
    begin
      mid:=(p^.l+p^.r)>>1;
      if x>mid then change(x,p^.rc)
      else change(x,p^.lc);
      p^.sum:=p^.lc^.sum+p^.rc^.sum;
    end;
end;
begin
  readln(n);
  new(tree);make(1,n,tree);
  readln(m);
  for i:=1 to m do
    begin
      readln(x,y);
      ans:=find(x,y,tree)*3.14;
      writeln(ans:0:2);
      change((x+y)>>1,tree);
    end;
end.