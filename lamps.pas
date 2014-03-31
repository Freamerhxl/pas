var ans:array[0..10001]of ansistring;
    a,b:array[0..101]of longint;
    i,j,n,m,l1,l2,k,c:longint;
    s:ansistring;
    can1,can2,can:boolean;
procedure dfs(now:ansistring;count,doi:longint);
  var temp:ansistring;
      i:longint;
begin
  if doi>4 then
    begin
      for i:=1 to l1 do
        if now[a[i]]='0' then exit;
      for i:=1 to l2 do
        if now[b[i]]='1' then exit;
      if m-count<0 then exit;
      if m-count=1 then exit;
      inc(c);ans[c]:=now;
      exit;
    end;
  dfs(now,count,doi+1);
  case doi of
    1:begin
      for i:=1 to n do
        if now[i]='1' then
          now[i]:='0'
        else now[i]:='1';
      dfs(now,count+1,doi+1);
      end;
    2:begin
      for i:=1 to n do
       if odd(i)then
       begin
        if now[i]='1' then
          now[i]:='0'
        else now[i]:='1';
       end;
      dfs(now,count+1,doi+1);
      end;
    3:begin
      for i:=1 to n do
      if not(odd(i))then
        begin
        if now[i]='1' then
          now[i]:='0'
        else now[i]:='1';
        end;
      dfs(now,count+1,doi+1);
      end;
    4:begin
      for i:=1 to n do
      if(i-1)mod 3=0 then
      begin
        if now[i]='1' then
          now[i]:='0'
        else now[i]:='1';
      end;
      dfs(now,count+1,doi+1);
      end;
  end;
end;
begin
  assign(input,'lamps.in');reset(input);
  assign(output,'lamps.out');rewrite(output);
  readln(n);readln(m);
  for i:=1 to n do
   s:=s+'1';
  l1:=0;
  read(k);
  while k<>-1 do
    begin
      inc(l1);a[l1]:=k;
      read(k);
    end;
  read(k);
  while k<>-1 do
    begin
      inc(l2);b[l2]:=k;
      read(k);
    end;
  c:=0;
  dfs(s,0,1);
  if c=0 then
    writeln('IMPOSSIBLE')
  else
    begin
      for i:=1 to c-1 do
      for j:=1 to c-i do
        if(ans[j]>ans[j+1])then
          begin
            ans[0]:=ans[j];ans[j]:=ans[j+1];ans[j+1]:=ans[0];
          end;
      ans[0]:='';
      for i:=1 to c do
        if ans[i]<>ans[i-1]then
          writeln(ans[i]);
    end;
  close(input);close(output);
end.