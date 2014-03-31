var can:array[0..200]of boolean;
    count:array['A'..'z']of longint;
    s:string;
    i,j,n,m,k,maxn,minn:longint;
    flag:boolean;
begin
  assign(input,'word.in');reset(input);
  assign(output,'word.out'); rewrite(output);
  can[2]:=true;
  for i:=3 to 120 do
  begin
  flag:=true;
  for j:=2 to trunc(sqrt(i))do
    if i mod j=0 then
      begin
        flag:=false;
        break;
      end;
    can[i]:=flag;
  end;
  readln(s);
  s:=upcase(s);
  for i:=1 to length(s)do
    if s[i]in['A'..'Z']then
      inc(count[s[i]]);
  minn:=maxlongint;
  for i:=1 to length(s)do
    if s[i]in['A'..'Z']then
    begin
      if count[s[i]]>maxn then maxn:=count[s[i]];
      if count[s[i]]<minn then minn:=count[s[i]];
    end;
  if can[maxn-minn]then
    begin
      writeln('Lucky Word');
      writeln(maxn-minn);
    end
  else
    begin
      writeln('No Answer');
      writeln(0);
    end;
  close(input);close(output);
end.