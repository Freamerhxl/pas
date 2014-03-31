var a:array[0..100001]of longint;
    i,j,n,m:longint;
    ans:int64;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
function fmax(a,b:longint):longint;
begin
  if a<b then exit(b)else exit(a);
end;
begin
  assign(input,'travel.in');reset(input);
  assign(output,'travel.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  for i:=2 to n-1 do
    begin
      if(a[i]>=a[i-1])and(a[i]>=a[i+1])then
        begin
          ans:=ans+a[i]-fmax(a[i-1],a[i+1]);
          a[i]:=fmax(a[i-1],a[i+1]);
        end
      else
      if(a[i]<=a[i-1])and(a[i]<=a[i+1])then
        begin
          ans:=ans+fmin(a[i-1],a[i+1])-a[i];
          a[i]:=fmin(a[i-1],a[i+1]);
        end;
      ans:=ans+abs(a[i]-a[i-1]);
    end;
  writeln(ans+abs(a[n]-a[n-1]));
  close(input);close(output);
end.
