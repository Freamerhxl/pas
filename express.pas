var x,y,s:array[0..200001]of longint;
    l,r,mid,ans:extended;
    i,n:longint;
function can(v:extended):boolean;
var i:longint;
    t:extended;
begin
  t:=0;
  for i:=1 to n do
    begin
      t:=t+s[i]/v;
      if t>y[i]then exit(false);
      if t<x[i]then t:=x[i];
    end;
  exit(true);
end;
begin
  assign(input,'express.in');reset(input);
  assign(output,'express.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(x[i],y[i],s[i]);
  l:=0.01;r:=1e20;
  mid:=(l+r)/2;
  repeat
    if can(mid)then
      begin
        ans:=mid;
        r:=mid-0.001;
      end
    else
      l:=mid+0.001;
    mid:=(l+r)/2;
  until l>r;
  writeln(ans:0:2);
  close(input);close(output);
end.