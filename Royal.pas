type point=^node;
node=record
  x:longint;
  next:point;
end;
var son:array[0..2001]of point;
    count,f,op,be,cc:array[0..2001]of longint;
    done,ok:array[0..2001]of boolean;
    i,j,n,m,k,x,y,all:longint;
    p:point;
procedure out(k:longint);
var i,j:longint;
begin
  for i:=1 to n do
    if f[i]=0 then
      begin
        f[i]:=k;
        op[k]:=i;
      end;
  writeln(k);
  for i:=1 to n do
    write(f[i],' ');
  writeln;
  for i:=1 to k do
    write(op[i],' ');
  close(output);halt;
end;
procedure flagit(x,opt,fa:longint);
var p:point;
begin
  f[x]:=opt;
  p:=son[x];
  while p<>nil do
    begin
      if(p^.x<>fa)and(f[p^.x]=0)then
        begin
          flagit(p^.x,opt,x);
        end;
      p:=p^.next;
    end;
end;
procedure work(x,fa:longint);
var p,q:point;
    i,j,t:longint;
    flag:boolean;
begin
  p:=son[x];done[x]:=true;count[x]:=1;j:=0;
  while p<>nil do
    begin
      if done[p^.x]=false then
        begin
          work(p^.x,x);
          count[x]:=count[x]+count[p^.x];
          if(count[p^.x]>=m)and(count[p^.x]<=3*m)then
            begin
              inc(k);flagit(p^.x,k,x);
              op[k]:=p^.x;all:=all-count[p^.x];
              j:=j+count[p^.x];
            end;
          if all<=3*m then out(k+1);
        end;
      p:=p^.next;
    end;
  count[x]:=count[x]-j;j:=0;
  if count[x]>3*m then
    begin
      i:=0;
      p:=son[x];
      while p<>nil do
        begin
          if(f[p^.x]=0)and(p^.x<>fa)then
            i:=i+count[p^.x];
          if i>=m then
            begin
              all:=all-i;count[x]:=count[x]-i;i:=0;
              q:=son[x];inc(k);op[k]:=x;
              while q<>p^.next do
                begin
                  if(q^.x<>fa)and(f[q^.x]=0)then
                    flagit(q^.x,k,x);
                  q:=q^.next;
                end;
            end;
          if count[x]<=3*m then break;
          p:=p^.next;
        end;
    end;
  if all<=3*m then out(k+1);
end;
begin
  assign(input,'Royal.in');reset(input);
  assign(output,'Royal.out');rewrite(output);
  readln(n,m);
  for i:=1 to n-1 do
    begin
      readln(x,y);
      new(p);p^.x:=y;p^.next:=son[x];son[x]:=p;
      new(p);p^.x:=x;p^.next:=son[y];son[y]:=p;
    end;
  k:=0;
  all:=n;
  work(1,0);
  writeln(0);
  close(input);close(output);
end.