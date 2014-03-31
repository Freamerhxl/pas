var ans:array[0..501,0..501]of longint;
      z:array[0..501*501,1..2]of longint;
    i,j,n,m,a,b,t,s,x,y:longint;
begin
  assign(input,'scarlet.in');reset(input);
  assign(output,'scarlet.out');rewrite(output);
  readln(n,m,a,b);
  fillchar(ans,sizeof(ans),43);
  for i:=1 to a do
    begin
      readln(x,y);
      ans[x,y]:=0;
      z[s,1]:=x;z[s,2]:=y;inc(s);
    end;
  for i:=0 to n+1 do
    begin
      ans[i,0]:=0;ans[i,m+1]:=0;
    end;
  for i:=0 to m+1 do
    begin
      ans[0,i]:=0;ans[n+1,i]:=0;
    end;
  repeat
    x:=z[t,1];y:=z[t,2];
    if ans[x,y]+1<ans[x-1,y]then
      begin
        ans[x-1,y]:=ans[x,y]+1;
        z[s,1]:=x-1;z[s,2]:=y;
        inc(s);
      end;
    if ans[x,y]+1<ans[x+1,y]then
      begin
        ans[x+1,y]:=ans[x,y]+1;
        z[s,1]:=x+1;z[s,2]:=y;
        inc(s);
      end;
    if ans[x,y]+1<ans[x,y+1]then
      begin
        ans[x,y+1]:=ans[x,y]+1;
        z[s,1]:=x;z[s,2]:=y+1;
        inc(s);
      end;
    if ans[x,y]+1<ans[x,y-1]then
      begin
        ans[x,y-1]:=ans[x,y]+1;
        z[s,1]:=x;z[s,2]:=y-1;
        inc(s);
      end;
    inc(t);
  until t>=s;
  for i:=1 to b do
    begin
      readln(x,y);
      writeln(ans[x,y]);
    end;
  close(input);close(output);
end.