var h:array[0..600001]of qword;
    i,j,n,m,k,a,b,size:longint;
    ans,tt:qword;
procedure up(j:longint);
var i:longint;
    t:qword;
begin
  i:=j>>1;t:=h[j];
  while i>0 do
    begin
      if t<h[i]then
        begin
          h[j]:=h[i];j:=i;i:=j>>1;
        end
      else break;
    end;
  h[j]:=t;
end;
procedure down(i:longint);
var j:longint;
    t:qword;
begin
  t:=h[i];j:=i<<1;
  while j<=size do
    begin
      if(j+1<=size)and(h[j+1]<h[j])then j:=j+1;
      if t>h[j]then
        begin
          h[i]:=h[j];i:=j;j:=i<<1;
        end
      else break;
    end;
  h[i]:=t;
end;
begin
  assign(input,'d.in');reset(input);
  assign(output,'d.out');rewrite(output);
  readln(n,k,m);
  for i:=1 to k do
    begin
      readln(a,b);
      if b=1 then
        h[i]:=a-1
      else
        h[i]:=n-a+n-1;
      inc(size);up(size);
    end;
  for i:=1 to m div k do
    tt:=tt+n-1;
  tt:=tt+tt;
  for i:=1 to k do
    begin
      h[1]:=h[1]+tt;
      down(1);
    end;
  for i:=1 to m mod k do
    begin
      h[1]:=h[1]+(n-1)*2;
      down(1);
    end;
  ans:=0;
  for i:=1 to k do
    if h[i]>ans then ans:=h[i];
  writeln(ans-n+1);
  close(input);close(output);
end.