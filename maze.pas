const go:array[1..3,1..4,1..2]of integer=(((1,0),(-1,0),(0,1),(0,-1)),((2,0),(-2,0),(0,2),(0,-2)),((1,1),(1,-1),(-1,1),(-1,-1)));
      cost:array[1..3]of 1..2=(1,1,2);
      p=1400*1400;
var f1,f2:array[0..1401,0..1401]of longint;
        q:array[0..1400*1400,1..2]of integer;
      map:array[0..1401,0..1401]of integer;
      i,j,n,m,x,y,l,r,flag:longint;
      s:ansistring;
begin
  assign(input,'maze.in');reset(input);
  assign(output,'maze.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(s);
      s:=upcase(s);
      for j:=1 to n do
        if s[j]in['A'..'C']then
          map[i,j]:=ord(s[j])-ord('A')+1
        else map[i,j]:=-1;
    end;
  for i:=0 to n+1 do
    begin
      map[0,i]:=-1;map[n+1,i]:=-1;
      map[i,0]:=-1;map[i,n+1]:=-1;
    end;
  r:=3;
  fillchar(f1,sizeof(f1),43);
  fillchar(f2,sizeof(f2),43);
  flag:=f1[0,0];
  l:=-1;
  if map[1,1]<>-1 then
  begin
  inc(l);
  q[l,1]:=1;q[l,2]:=1;
  f1[1,1]:=0;f2[1,1]:=1;
  end;
  if map[1,n]<>-1 then
  begin
  inc(l);
  q[l,1]:=1;q[l,2]:=n;
  f1[1,n]:=0;f2[1,n]:=1;
  end;
  if map[n,1]<>-1 then
  begin
  inc(l);
  q[l,1]:=n;q[l,2]:=1;
  f1[n,1]:=0;f2[n,1]:=1;
  end;
  if l=-1 then
    begin
      writeln('No answer');
      close(output);halt;
    end;
  r:=l+1;
  l:=0;
  repeat
    for i:=1 to 4 do
      begin
        x:=q[l,1]+go[map[q[l,1],q[l,2]],i,1];
        y:=q[l,2]+go[map[q[l,1],q[l,2]],i,2];
        if map[x,y]in[1..3]then
          begin
            if(f1[q[l,1],q[l,2]]+1<f1[x,y])or((f1[q[l,1],q[l,2]]+1=f1[x,y])and(f2[q[l,1],q[l,2]]+cost[map[q[l,1],q[l,2]]]<f2[x,y]))then
              begin
                f1[x,y]:=f1[q[l,1],q[l,2]]+1;
                f2[x,y]:=f2[q[l,1],q[l,2]]+cost[map[q[l,1],q[l,2]]];
                q[r,1]:=x;q[r,2]:=y;inc(r);if r>p then r:=0;
              end;
          end;
      end;
    inc(l);if l>p then l:=0;
  until l=r;
  if f1[n,n]<flag then
    writeln(f2[n,n])
  else writeln('No answer');
  close(input);close(output);
end.