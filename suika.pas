type point=^node;
     node=record
       x,dis:longint;
     next:point;
end;
const pp=1000000;
var f:array[0..1,0..5001]of longint;
    r:array[0..1,0..5001]of boolean;
    map:array[0..5001]of point;
    w,s,be:array[0..5001]of byte;
    zz:array[0..pp,1..2]of longint;
    i,j,n,m,ans,x,y,z,t,ss:longint;
    p:point;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
begin
  assign(input,'suika.in');reset(input);
  assign(output,'suika.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    read(be[i]);
  for i:=1 to n do
    read(w[i]);
  for i:=1 to n do
    read(s[i]);
  for i:=1 to m do
    begin
      readln(x,y,z);
      new(p);p^.x:=y;p^.dis:=z;
      p^.next:=map[x];map[x]:=p;
    end;
  fillchar(f,sizeof(f),63);
  f[be[1],1]:=0;
  t:=0;zz[0,1]:=1;zz[0,2]:=be[1];
  ss:=1;
  r[be[1],1]:=true;
  repeat
    if zz[t,2]=1 then
      begin
        if f[zz[t,2],zz[t,1]]+s[zz[t,1]]<f[0,zz[t,1]]then
          begin
            f[0,zz[t,1]]:=f[zz[t,2],zz[t,1]]+s[zz[t,1]];
            if r[0,zz[t,1]]=false then
              begin
                r[0,zz[t,1]]:=true;
                zz[ss,1]:=zz[t,1];
                zz[ss,2]:=0;
                inc(ss);if ss>pp then ss:=0;
              end;
          end;
      end
    else
      begin
        if f[zz[t,2],zz[t,1]]<f[1,zz[t,1]]then
          begin
            f[1,zz[t,1]]:=f[zz[t,2],zz[t,1]];
            if r[1,zz[t,1]]=false then
              begin
                r[1,zz[t,1]]:=true;
                zz[ss,1]:=zz[t,1];
                zz[ss,2]:=1;
                inc(ss);if ss>pp then ss:=0;
              end;
          end;
      end;
    p:=map[zz[t,1]];
    while p<>nil do
      begin
        if be[zz[t,1]]=be[p^.x]then
          begin
            if f[zz[t,2],zz[t,1]]+p^.dis<f[1-zz[t,2],p^.x]then
              begin
                f[1-zz[t,2],p^.x]:=f[zz[t,2],zz[t,1]]+p^.dis;
                if r[1-zz[t,2],p^.x]=false then
                  begin
                    r[1-zz[t,2],p^.x]:=true;
                    zz[ss,1]:=p^.x;zz[ss,2]:=1-zz[t,2];
                    inc(ss);if ss>pp then ss:=0;
                  end;
              end;
          end
        else
          begin
            if zz[t,2]=1 then
              begin
                z:=p^.dis+abs(w[zz[t,1]]-w[p^.x]);
              end
            else
              begin
                z:=p^.dis-abs(w[zz[t,1]]-w[p^.x]);
                if z<0 then z:=0;
              end;
            if f[zz[t,2],zz[t,1]]+z<f[zz[t,2],p^.x]then
              begin
                f[zz[t,2],p^.x]:=f[zz[t,2],zz[t,1]]+z;
                if r[zz[t,2],p^.x]=false then
                  begin
                    r[zz[t,2],p^.x]:=true;
                    zz[ss,1]:=p^.x;
                    zz[ss,2]:=zz[t,2];
                    inc(ss);if ss>pp then ss:=0;
                  end;
              end;
          end;
        p:=p^.next;
      end;
    r[zz[t,2],zz[t,1]]:=false;
    inc(t);if t>pp then t:=0;
  until t>=ss;
  writeln(fmin(f[0,n],f[1,n]));
  close(input);close(output);
end.