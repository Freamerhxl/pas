var map:array[0..1001,0..1001]of boolean;
    can:array[0..1001]of boolean;
    p,ida,a,b,idb:array[0..1001]of longint;
    ans1,ans2,i,j,n,m,k1,k2,l,r:longint;
    t:int64;
function mm(x,y:longint):int64;
var t:int64;
begin
  if y=0 then exit(1);
  if y=1 then exit(x);
  t:=mm(x,y>>1)mod (m*10);
  t:=(t*t)mod (m*10);
  if odd(y)then t:=(t*x)mod (m*10);
  mm:=t;
end;
function find(x:longint):boolean;
var i:longint;
begin
  for i:=1 to k2 do
    if(map[x,idb[i]])and(can[idb[i]])then
      begin
        can[idb[i]]:=false;
        if(p[idb[i]]=0)or(find(p[idb[i]]))then
          begin
            p[idb[i]]:=x;
            exit(true);
          end;
      end;
  exit(false);
end;
begin
  assign(input,'sgs0.in');reset(input);
//  assign(output,'IGC_P4.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      read(m);
      if((odd(m)=false)and(m<>2))or(m=1)then
        begin
          inc(k1);ida[k1]:=i;
          continue
        end;
   if m<>2 then
      begin
      t:=mm(3,m)mod m;
      if t<>3 mod m then
        begin
          inc(k1);ida[k1]:=i;
          continue;
        end;
      t:=mm(7,m)mod m;
      if t<>7 mod m then
        begin
          inc(k1);ida[k1]:=i;
          continue;
        end;
      end;
      inc(k2);idb[k2]:=i;
    end;
  for i:=1 to n do
    begin
      readln(a[i],b[i]);
    end;
  for i:=1 to k1-1 do
  for j:=1 to k1-i do
    if(a[ida[j]]<a[ida[j+1]])then
      begin
        ida[j]:=ida[j+1]xor ida[j];
        ida[j+1]:=ida[j+1]xor ida[j];
        ida[j]:=ida[j+1]xor ida[j];
      end;
  for i:=1 to k1 do
  for j:=1 to k2 do
    if(idb[j]>=ida[i]-b[ida[i]])and(idb[j]<=ida[i]+b[ida[i]])then
      map[ida[i],idb[j]]:=true;
  for i:=1 to k1 do
    begin
      fillchar(can,sizeof(can),true);
      if find(ida[i])then
        begin
          inc(ans1);inc(ans2,a[ida[i]]);
        end;
    end;
  writeln(ans1);writeln(ans2);
  close(output);
end.
