var cost:array[0..51,0..51]of longint;
    id:array[0..301,0..301]of longint;
    can:array[0..5001,0..51]of boolean;
    ok:array[0..5001]of boolean;
    a:array[0..5001,1..3]of longint;
    p:array[0..301]of longint;
    f:array[0..51]of longint;
    n,m,t,v,k,pp,i,j,mm,t1,t2,x,y,flag:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  k:=a[(t+w)>>1,3];i:=t;j:=w;
  repeat
    while a[i,3]<k do inc(i);
    while a[j,3]>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function get(x:longint):longint;
begin
  if p[x]=x then exit(x);
  p[x]:=get(p[x]);
  exit(p[x]);
end;
function MST:longint;
var i,c,x,y:longint;
begin
  for i:=1 to n do
    p[i]:=i;
  c:=0;MST:=0;
  for i:=1 to m do
    if ok[i]then
      begin
        x:=get(a[i,1]);y:=get(a[i,2]);
        if x<>y then
          begin
            inc(c);MST:=MST+a[i,3];
            p[y]:=x;
            if c=n-1 then exit;
          end;
      end;
  MST:=flag;
end;
begin
  assign(input,'d.in');reset(input);
  assign(output,'d.out');rewrite(output);
  readln(n,m,t,v,k);
  for i:=1 to m do
    begin
      inc(mm);
      readln(a[mm,1],a[mm,2],a[mm,3]);
      if id[a[mm,1],a[mm,2]]<>0 then
        begin
          if a[mm,3]<a[id[a[mm,1],a[mm,2]],3]then
            begin
              a[id[a[mm,1],a[mm,2]],3]:=a[mm,3];
            end;
          dec(mm);
        end
      else
        begin
          id[a[mm,1],a[mm,2]]:=mm;
          id[a[mm,2],a[mm,1]]:=mm;
        end;
    end;
  m:=mm;
  sort(1,m);
  for i:=1 to m do
    begin
      id[a[i,1],a[i,2]]:=i;
      id[a[i,2],a[i,1]]:=i;
    end;
  readln(pp);
  for i:=1 to pp do
    begin
      readln(x,y,t1,t2);
      if t2>t then t2:=t;
      for j:=t1 to t2 do
        can[id[x,y],j]:=true;
    end;
  fillchar(f,sizeof(f),43);
  flag:=f[0];

  for i:=1 to t do
  begin
  for j:=1 to m do
    ok[j]:=true;
  for j:=i to t do
    begin
      for pp:=1 to m do
        if(ok[pp])and(can[pp,j])then
          ok[pp]:=false;
      cost[i,j]:=MST;
    end;
  end;

  f[0]:=0;
  for i:=1 to t do
  for j:=0 to i-1 do
  if cost[j+1,i]<flag then
   if f[j]+k+cost[j+1,i]*v*(i-j)<f[i]then
    f[i]:=f[j]+k+cost[j+1,i]*v*(i-j);
  writeln(f[t]);
  close(input);close(output);
end.
