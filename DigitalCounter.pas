const a:array[0..9]of integer=(6,2,5,5,4,5,6,3,7,5);
var n,tot,i:integer;
    ans,b:array[0..20]of longint;
    s:ansistring;
    ch:char;
procedure print;
var i,j:longint;
begin
  for i:=0 to n do
    ans[i]:=ans[i]-b[i];
  for i:=n downto 1 do
   if ans[i]<0 then
     begin
       ans[i]:=ans[i]+10;
       dec(ans[i-1]);
     end;
  for i:=0 to n do
   if ans[i]<>0 then break;
  j:=i;
  for i:=j to n do
    write(ans[i]);
  close(output);halt;
end;
procedure dfs(x:integer;bigger:boolean;now:integer);
var i:longint;
begin
  if x>n then
    begin
      if(now=0)and(bigger)then
        print;
      exit;
    end;
  if((n-x+1)*2>now)and(x<>0)then exit;
  if((n-x+1)*7<now)and(x<>0)then exit;
  if bigger then
    begin
      for i:=0 to 9 do
        if now>=a[i]then
          begin
            ans[x]:=i;
            if x<>0 then
            dfs(x+1,true,now-a[i])
            else dfs(x+1,true,now);
          end;
    end
  else
    begin
      for i:=b[x]to 9 do
        if now>=a[i]then
          begin
            ans[x]:=i;
            if x<>0 then
            dfs(x+1,i<>b[x],now-a[i])
            else dfs(x+1,i<>b[x],now);
          end;
    end;
end;
begin
  assign(input,'DigitalCounter.in');reset(input);
  assign(output,'DigitalCounter.out');rewrite(output);
  readln(n);
  readln(s);
  for i:=1 to length(s)do
    begin
      b[i]:=ord(s[i])-48;
      tot:=tot+a[b[i]];
    end;
  dfs(0,false,tot);
  close(input);close(output);
end.