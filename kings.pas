const g:array[1..8,1..2]of -1..1=((0,1),(0,-1),(1,-1),(1,0),(1,1),(-1,-1),(-1,0),(-1,1));
var f,ff:array[0..11,0..1024]of longint;
    dis:array[0..1024,0..11]of longint;
    md:array[0..9,0..9,0..9,0..9]of longint;
    a,b:array[0..11,1..2]of longint;
    q:array[0..1001,1..2]of longint;
    i,n,j,ii,jj,t,s,x,y:longint;
    st:ansistring;
function dp:longint;
var i,j,k,flag,p,pp,kk,opt:longint;
begin
  k:=0;p:=0;
  for i:=1 to 8 do
    begin
      readln(st);
      for j:=1 to 8 do
        if st[j]='P' then
          begin
            inc(p);
            b[p,1]:=i;b[p,2]:=j;
          end
        else
        if st[j]='K'then
          begin
            inc(k);
            a[k,1]:=i;a[k,2]:=j;
          end;
    end;
  fillchar(ff,sizeof(ff),43);
  fillchar(f,sizeof(f),43);
  flag:=f[0,0];
  for pp:=1 to k do
    begin
      fillchar(dis,sizeof(dis),43);
      for i:=1 to p do
       dis[1<<(i-1),i]:=md[a[pp,1],a[pp,2],b[i,1],b[i,2]];
      ff[pp,0]:=0;
      for i:=1 to 1<<p-1 do
        begin
          for j:=1 to p do
          if i and(1<<(j-1))>0 then
          begin
          for kk:=1to p do
          if i and(1<<(kk-1))=0 then
          if dis[i,j]+md[b[j,1],b[j,2],b[kk,1],b[kk,2]]<dis[i or(1<<(kk-1)),kk] then
            dis[i or(1<<(kk-1)),kk]:=dis[i,j]+md[b[j,1],b[j,2],b[kk,1],b[kk,2]];
          if dis[i,j]<ff[pp,i]then ff[pp,i]:=dis[i,j];
          end;
        end;
    end;
  f[0,0]:=0;
  for pp:=1 to k do
  for i:=0 to 1<<p-1 do
  if f[pp-1,i]<flag then
  for j:=0 to 1<<p-1 do
  if(i or j=j)then
    begin
      opt:=i xor j;
      if f[pp-1,i]+ff[pp,opt]<f[pp,j]then
        f[pp,j]:=f[pp-1,i]+ff[pp,opt];
    end;
  exit(f[k,1<<p-1]);
end;
begin
  assign(input,'kings.in');reset(input);
  assign(output,'kings.out');rewrite(output);
  fillchar(md,sizeof(md),43);
  for i:=1 to 8 do
  for j:=1 to 8 do
    begin
      md[i,j,i,j]:=0;
      t:=0;s:=1;
      q[t,1]:=i;q[t,2]:=j;
      repeat
        for ii:=1 to 8 do
          begin
            x:=q[t,1]+g[ii,1];y:=q[t,2]+g[ii,2];
            if(x>0)and(x<9)and(y>0)and(y<9)then
              if md[i,j,q[t,1],q[t,2]]+1<md[i,j,x,y]then
                begin
                  md[i,j,x,y]:=md[i,j,q[t,1],q[t,2]]+1;
                  q[s,1]:=x;q[s,2]:=y;inc(s);
                end;
          end;
        inc(t);
      until t=s;
    end;
  readln(n);
  for i:=1 to n do
    writeln(dp);
  close(input);close(output);
end.
