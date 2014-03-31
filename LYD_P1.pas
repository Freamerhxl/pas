const maxn=4037915;
var st:ansistring;
    a:array[0..11]of longint;
    out,op:array[0..11]of longint;
    done:array[0..11]of boolean;
    i,j,n,m,k,ans:longint;
procedure dfs(n,ii,now,l:longint);
var i:longint;
begin
  if n=0 then
    begin
      if now>ans then
        begin
          ans:=now;
          out:=op;out[0]:=l;
        end;
      exit;
    end;
  for i:=ii to m do
    if a[i]<=n then
      begin
        op[l+1]:=i;
        dfs(n-a[i],i+1,now+i,l+1);
      end;
end;
begin
  a[0]:=1;
  for i:=1 to 10 do
    a[i]:=a[i-1]*i;
  readln(st);
  if length(st)>7 then
    writeln('No!')
  else
    begin
     val(st,n,n);
     if(n>maxn)or(n=0)then
       writeln('No!')
     else
       begin
         m:=10;
         while a[m]>n do dec(m);
         ans:=0;
         dfs(n,0,0,0);
         if ans=0 then writeln('No!')
         else
           begin
             write(n,'=');
             for i:=1 to out[0]-1do
               write(out[i],'!','+');
             writeln(out[out[0]],'!');
           end;
       end;
    end;
end.