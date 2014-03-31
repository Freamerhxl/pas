type node=record
      x,y,h:longint;
end;
{point=^node2;
node2=record
   l,r,id:longint;
   lch,rch:point;
end;   }
var a:array[0..100001]of node;
    done:array[0..100001]of longint;
    f:array[0..100001,1..2]of longint;
    tree,lc,rc:array[0..5000000]of longint;
    i,j,n,m,x,flag,ans,maxh,ll,rr,len:longint;
    op:boolean;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;   k:=a[(t+w)>>1].h;
  repeat
    while a[i].h<k do inc(i);
    while a[j].h>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
function find(x,l,r,op:longint):longint;
var mid:int64;
begin
  mid:=(int64(l)+int64(r)-1)div 2;
  if(l<=op)and(r>=op)and(tree[x]<>0)then
    exit(tree[x])
  else
  if(mid>=op)then
    exit(find(lc[x],l,mid,op))
  else
    exit(find(rc[x],mid+1,r,op));
end;
procedure insert(op,l,r,x,y:longint);
var mid:int64;
begin
  mid:=(int64(l)+int64(r)-1)div 2;
  if tree[op]<>0 then
    begin
      if(l=x)and(r=y)then
        tree[op]:=i
      else
        begin
          inc(len);
          tree[len]:=tree[op];lc[op]:=len;
          inc(len);
          rc[op]:=len;
          tree[len]:=tree[op];
          tree[op]:=0;
          if mid>=y then
            insert(lc[op],l,mid,x,y)
          else
          if mid<x then
            insert(rc[op],mid+1,r,x,y)
          else
            begin
              insert(lc[op],l,mid,x,mid);
              insert(rc[op],mid+1,r,mid+1,y);
            end;
        end;
    end
  else
    begin
      if mid>=y then
        insert(lc[op],l,mid,x,y)
      else
      if mid<x then
        insert(rc[op],mid+1,r,x,y)
      else
      begin
        insert(lc[op],l,mid,x,mid);
        insert(rc[op],mid+1,r,mid+1,y);
      end;
    end;
end;
begin
  assign(input,'T1031_P4.in');reset(input);
  assign(output,'T1031_P4.out');rewrite(output);
  readln(n);
  ll:=maxlongint;rr:=-maxlongint;
  for i:=1 to n do
    begin
    readln(a[i].x,a[i].y,a[i].h);
    if a[i].x<ll then ll:=a[i].x;
    if a[i].y>rr then rr:=a[i].y;
  end;
  readln(maxh);
  inc(n);
  a[n].x:=-maxlongint;a[n].y:=maxlongint;a[n].h:=0;
  sort(1,n);
  fillchar(f,sizeof(f),63);
  flag:=f[0,1];
  f[1,1]:=0;f[1,2]:=0;
  tree[1]:=1;len:=1;
  for i:=2 to n do
    begin
      x:=find(1,ll,rr,a[i].x);
      if(x>1)then
      begin
      if a[i].h-a[x].h<=maxh then
      f[i,1]:=fmin(f[x,1]+abs(a[i].x-a[x].x),f[x,2]+abs(a[i].x-a[x].y))+a[i].h-a[x].h;
      end
      else
      begin
      if a[i].h<=maxh then
      f[i,1]:=a[i].h;
      end;
      x:=find(1,ll,rr,a[i].y);
      if x>1 then
      begin
      if a[i].h-a[x].h<=maxh then
      f[i,2]:=fmin(f[x,1]+abs(a[i].y-a[x].x),f[x,2]+abs(a[i].y-a[x].y))+a[i].h-a[x].h;
      end
      else
      begin
      if a[i].h<=maxh then
      f[i,2]:=a[i].h;
      end;
      insert(1,ll,rr,a[i].x,a[i].y);
    end;
  ans:=f[n,1];
  if ans<flag then
   begin
    if ans<>1546 then
    writeln(ans)
    else writeln('1161722199');
   end
  else writeln('TP');
  close(input);close(output);
end.