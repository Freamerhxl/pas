var data:array[0..50001,0..2]of longint;
       a,b:array[0..50001]of longint;
    i,j,n,ans,temp:longint;
	abcd:longint;
begin
  assign(input,'fire.in');reset(input);
  assign(output,'fire.out');rewrite(output);
  readln(n);
  for i:=1to n do
    readln(data[i,1],data[i,2]);
  for i:=1 to n do
  for j:=1 to 2 do
    if(data[data[i,j],1]<>i)and(data[data[i,j],2]<>i)then
      begin
        writeln(-1);
        close(output);
        halt;
      end;
  a[1]:=1;a[2]:=data[1,1];
  for i:=3 to n do
    if data[a[i-1],1]<>a[i-2]then
      a[i]:=data[a[i-1],1]
    else a[i]:=data[a[i-1],2];
  for i:=1 to n do
    if i>a[i]then
      inc(b[n-i+a[i]])
    else inc(b[a[i]-i]);
  for i:=1 to n do
    if b[i]>ans then ans:=b[i];
  fillchar(b,sizeof(b),0);
  i:=1;j:=n;
  while i<j do
    begin
      a[i]:=a[i]xor a[j];
      a[j]:=a[i]xor a[j];
      a[i]:=a[i]xor a[j];
      inc(i);dec(j);
    end;
  for i:=1 to n do
    if i>a[i]then
      inc(b[n-i+a[i]])
    else inc(b[a[i]-i]);
  for i:=1 to n do
    if b[i]>ans then ans:=b[i];
  writeln(n-ans);
  close(input);close(output);
end.