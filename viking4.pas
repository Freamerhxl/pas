type arr=array[1..4]of ansistring;
var a:array[0..600]of arr;
    map:Array[0..600,0..600]of boolean;
    done:array[0..600]of boolean;
    dis:array[0..600]of longint;
    st:arr;
    i,j,ans,n,x,y:longint;
    flag:boolean;
procedure make;
  var ii,jj,i1,i2,i3,j1,j2,j3:integer;
      i,j:array[1..4]of integer;
      ch:char;
begin
  for i1:=1 to 4 do
  for i2:=1 to 4 do
  if(i1<>i2)then
  for i3:=1 to 4 do
  if(i1<>i3)and(i3<>i2)then
  begin
    i[1]:=i1;i[2]:=i2;i[3]:=i3;
    i[4]:=10-i[1]-i[2]-i[3];
    for j1:=1 to 4 do
    for j2:=1 to 4 do
    if(j1<>j2)then
    for j3:=1 to 4 do
    if(j3<>j1)and(j3<>j2)then
    begin
    j[1]:=j1;j[2]:=j2;j[3]:=j3;
    j[4]:=10-j[1]-j[2]-j[3];
    for ii:=1 to 4 do
    for jj:=1 to 4 do
     st[ii,jj]:=a[0,i[ii],j[jj]];
     inc(n);a[n]:=st;
    end;
  end;
end;
function can(x,y:integer):boolean;
var st:ansistring;
    ch:char;
    t:arr;
    i,j:longint;
    flag:boolean;
begin
  for i:=1 to 3 do
    begin
      t:=a[x];
      st:=t[i];t[i]:=t[i+1];t[i+1]:=st;
      flag:=true;
      for j:=1 to 4 do
        if t[j]<>a[y,j]then
          begin
            flag:=false;break;
          end;
      if flag then exit(true);
    end;
  for j:=1 to 3 do
    begin
      t:=a[x];
      for i:=1 to 4 do
        begin
          ch:=t[i,j];t[i,j]:=t[i,j+1];t[i,j+1]:=ch;
        end;
      flag:=true;
      for i:=1 to 4 do
        if t[i]<>a[y,i]then
          begin
            flag:=false;break;
          end;
       if flag then exit(true);
    end;
  exit(false);
end;
begin
  assign(input,'data.in');reset(input);
  for i:=1 to 4 do
    readln(a[0,i]);
  st:=a[0];
  make;
  for i:=1 to n-1 do
  for j:=i+1 to n do
  if can(i,j)then
    begin
      map[i,j]:=true;
      map[j,i]:=true;
    end;
  fillchar(dis,sizeof(dis),43);
  dis[1]:=0;
  for i:=1 to n do
    begin
      y:=dis[0];
      for j:=1 to n do
        if(done[j]=false)and(dis[j]<y)then
          begin
            y:=dis[j];x:=j;
          end;
       done[x]:=true;
       for j:=1 to n do
         if(done[j]=false)and(map[x,j])and(dis[x]+1<dis[j])then
           dis[j]:=dis[x]+1;
    end;
  st[1]:='0123';st[2]:='4567';st[3]:='89AB';st[4]:='CDEF';
  for i:=1 to n do
   begin
     flag:=true;
     for j:=1 to 4 do
       if a[i,j]<>st[j]then
         begin
           flag:=false;
           break;
         end;
     if flag then break;
   end;
  writeln(dis[i]);
end.
