var num:array['A'..'Z']of integer;
    can:array[0..30]of boolean;
    s:array[0..5]of ansistring;
    i,j,n:longint;
    ch,r:char;
procedure dfs(k,p,jin:integer);
var i,j:integer;
    ch:char;
begin
 if p=1 then
  for i:=1 to n do
    if(num[s[1,i]]>-1)and(num[s[2,i]]>-1)and(num[s[3,i]]>-1)then
    if((num[s[1,i]]+num[s[2,i]])mod n<>num[s[3,i]])and((num[s[1,i]]+num[s[2,i]]+1)mod n<>num[s[3,i]])then exit;
  if(k=0)then
    begin
      if jin>0 then exit;
      write(num['A']);
      for ch:='B' to r do
        write(' ',num[ch]);
      close(output);halt;
    end;
  if p=3 then
    begin
      i:=(num[s[1][k]]+num[s[2][k]]+jin)mod n;
      if num[s[p][k]]>-1 then
        begin
          if i=num[s[p][k]]then
            dfs(k-1,1,(num[s[1][k]]+num[s[2][k]]+jin)div n)
        end
      else
        if can[i]then
          begin
            num[s[p][k]]:=i;can[i]:=false;
            dfs(k-1,1,(num[s[1][k]]+num[s[2][k]]+jin)div n);
            num[s[p][k]]:=-1;can[i]:=true;
          end;
    end
  else
    begin
      if num[s[p][k]]>-1 then
        dfs(k,p+1,jin)
      else
      for i:=n-1 downto 0 do
        if can[i]then
          begin
            can[i]:=false;num[s[p][k]]:=i;
            dfs(k,p+1,jin);
            can[i]:=true;num[s[p][k]]:=-1;
          end;
    end;
end;
begin
  assign(input,'alpha.in');reset(input);
  assign(output,'alpha.out');rewrite(output);
  readln(n);
  r:=chr(ord('A')+n-1);
  for i:=1 to 3 do
    readln(s[i]);
  for ch:='A' to r do
    num[ch]:=-1;
  fillchar(can,sizeof(can),true);
  dfs(n,1,0);
  close(input);close(output);
end.