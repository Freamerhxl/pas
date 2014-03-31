var map:array[0..1001,0..1001]of boolean;
    minp,color,a,st1,st2:array[0..1001]of longint;
    i,j,n,m,k,top1,top2:longint;
procedure na;
begin
  writeln(0);
  close(output);
  halt;
end;
procedure draw(x,co:longint);
var i,k:longint;
begin
  if co=1 then k:=2
    else k:=1;
  color[x]:=co;
  for i:=1 to n do
    if map[x,i]then
      begin
        if color[i]=0 then draw(i,k)
          else  if color[i]=color[x]then na;
      end;
end;
begin
  assign(input,'twostack.in');reset(input);
  assign(output,'twostack.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  minp[n]:=a[n];
  for i:=n-1 downto 1 do
    if a[i]<minp[i+1]then
      minp[i]:=a[i]
    else minp[i]:=minp[i+1];
  for i:=1 to n do
  for j:=i+1 to n do
    if(minp[j]<a[i])and(minp[j]<a[j])and(a[i]<a[j])then
      begin
        map[i,j]:=true;
        map[j,i]:=true;
      end;
  for i:=1 to n do
    if color[i]=0 then
      draw(i,1);
  inc(top1);
  st1[top1]:=a[1];
  write('a');
  m:=1;
  if a[1]=1 then
    begin
      inc(m);top1:=0;
      write(' b');
    end;
  for i:=2 to n do
    begin
      if color[i]=1 then
        begin
          inc(top1);st1[top1]:=a[i];
          write(' a');
        end
      else
        begin
          inc(top2);st2[top2]:=a[i];
          write(' c');
        end;
      while((top1>0)and(st1[top1]=m))or((top2>0)and(st2[top2]=m))do
        begin
          if st1[top1]=m then
            begin
              write(' b');dec(top1);
            end
          else
            begin
              write(' d');dec(top2);
            end;
          inc(m);
        end;
    end;
  close(input);close(output);
end.