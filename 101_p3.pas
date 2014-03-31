type point=^node;
     node=record
       x:longint;
       next:point;
     end;
var z,a,color:array[0..1000001]of longint;
    son:array[0..1000001]of point;
    i,j,n,m,k,x,y,l,r,anss:longint;
    ans:array[1..2]of longint;
    can:array[0..2]of boolean;
    p:point;
procedure noans;
begin
  writeln('NO');
  halt;
end;
begin
  readln(n,m);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to m do
    begin
      readln(x,y);
      if x<>y then
      begin
      new(p);p^.x:=y;p^.next:=son[x];son[x]:=p;
      new(p);p^.x:=x;p^.next:=son[y];son[y]:=p;
      end;
    end;
  for i:=1 to n do
    if color[i]=0 then
    begin
  l:=0;r:=1;
  z[0]:=i;color[i]:=1;ans[1]:=0;ans[2]:=0;
  repeat
    p:=son[z[l]];
    while p<>nil do
      begin
        if color[p^.x]=0 then
          begin
            color[p^.x]:=3-color[z[l]];
            z[r]:=p^.x;
            inc(r);
          end
        else
          if color[p^.x]=color[z[l]]then
            noans;
        p:=p^.next;
      end;
    inc(l);
  until l=r;
  for j:=1 to n do
    if(color[j]=1)or(color[j]=2) then
    begin
     inc(ans[color[j]],a[j]);
     color[j]:=-1;
   end;
  if ans[1]<ans[2]then anss:=anss+ans[1]else anss:=anss+ans[2];
  end;
  writeln(anss);
end.
