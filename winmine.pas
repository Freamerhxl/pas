const go:array[1..8,1..2]of -1..1=((1,-1),(0,-1),(-1,-1),(-1,0),(-1,1),(0,1),(1,1),(1,0));
var a,b,c,d,e,f,g:array[-1..101,-1..101]of longint;
    op,done,can:array[-1..101,-1..101]of boolean;
    i,j,n,m,k,now,x,y,t,s,x1,y1:longint;
    ch:char;
function work(x,y:longint):boolean;
var x1,y1,i,j,tw,nw:longint;
    flag:boolean;
procedure dfs(x,y:integer);
var x1,y1,i,k:integer;
begin
  op[x,y]:=true;if c[x,y]<>0 then exit;
  for i:=1 to 8 do
    begin
      x1:=x+go[i,1];y1:=y+go[i,2];
      if(op[x1,y1]=false)and(x1>0)and(x1<=n)and(y1>0)and(y1<=n)and(c[x1,y1]<>-1)then
        dfs(x1,y1);
    end;
end;
procedure flagit(x,y:longint);
var i,x1,y1:longint;
begin
  can[x,y]:=true;
  for i:=1 to 8 do
    begin
      x1:=x+go[i,1];y1:=y+go[i,2];
      inc(b[x1,y1]);
    end;
end;
function check(x,y:longint):longint;
var i,x1,y1:longint;
begin
  check:=0;
  for i:=1 to 8 do
    begin
      x1:=x+go[i,1];y1:=y+go[i,2];
      if(c[x1,y1]<>-1)and(op[x1,y1])then
        inc(check);
    end;
end;
begin
  op[x,y]:=true;
  nw:=0;dfs(x,y);tw:=0;
  flag:=true;
  while flag do
    begin
      flag:=false;
      for i:=1 to n do
      for j:=1 to n do
      begin
        if(op[i,j])and(c[i,j]<>-1)and(c[i,j]<>0)and(done[i,j]=false)then
          begin
            k:=check(i,j);
            if k+c[i,j]=d[i,j] then
              begin
                flag:=true;
                for k:=1 to 8 do
                  begin
                    x1:=i+go[k,1];y1:=j+go[k,2];
                    if(c[x1,y1]=-1)and(can[x1,y1]=false)then
                      begin
                       flagit(x1,y1);
                       inc(tw);
                      end;
                  end;
                done[i,j]:=true;
              end
            else
            if b[i,j]=c[i,j]then
            begin
            flag:=true;
            for k:=1 to 8 do
              begin
                 x1:=i+go[k,1];y1:=j+go[k,2];
                 if(x1>0)and(x1<=n)and(y1>0)and(y1<=n)then
                 if(c[x1,y1]<>-1)and(op[x1,y1]=false)then
                   dfs(x1,y1);
              end;
              done[i,j]:=true;
            end;
          end;

      end;
    end;
  nw:=0;
  for i:=1 to n do
  for j:=1 to n do
    if op[i,j]and(c[i,j]<>-1) then
      inc(nw);
  if(tw=m)or(n*n-nw=m)then
    exit(true)
  else exit(false);
end;
begin
  assign(input,'winmine.in');reset(input);
  assign(output,'winmine.out');rewrite(output);
  readln(n,m,k);
  for i:=1 to n do
  for j:=1 to n do
    d[i,j]:=8;
  for i:=1 to n do
    begin
      d[1,i]:=5;d[i,1]:=5;
      d[n,i]:=5;d[i,n]:=5;
    end;
  d[1,1]:=3;d[1,n]:=3;d[n,1]:=3;d[n,n]:=3;
  for i:=1 to n do
    begin
      for j:=1 to n do
        begin
          read(ch);
          if ch='*' then
            begin
              c[i,j]:=-1;
              inc(now);
            end
          else
            c[i,j]:=ord(ch)-ord('0');
        end;
      readln;
    end;
  e:=c;f:=d;g:=b;
  for j:=1 to k do
    begin
      fillchar(op,sizeof(op),0);
      done:=op;
      can:=op;
      readln(x,y);
      if work(x,y) then
        writeln('Yes')
      else writeln('No');
      c:=e;d:=f;b:=g;
    end;
  close(input);close(output);
end.