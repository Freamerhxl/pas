const a:array[0..17]of longint=(1,1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786, 208012, 742900, 2674440, 9694845, 35357670, 129644790);
var n,i,k:longint;
function get(x,y:longint):ansistring;
  var i,x1,y1,x2,y2,k:longint;
      lc,rc:ansistring;
begin
  if x=0 then exit('');
  if x=1 then exit('X');
  k:=y;
  for i:=x-1 downto 0 do
    if k<=a[i]*a[x-1-i] then
      break
    else
      k:=k-a[i]*a[x-1-i];
  x2:=i; x1:=x-1-i;
  if k mod a[x2]=0 then
    begin
      y1:=k div a[x2];
      y2:=a[x2];
    end
  else
    begin
      y1:=k div a[x2]+1;
      y2:=k mod a[x2];
    end;
  lc:='';rc:='';
  if x1>0 then
    lc:='('+get(x1,y1)+')';
  if x2>0 then
    rc:='('+get(x2,y2)+')';
  exit(lc+'X'+rc);
end;
begin
  assign(input,'tree.in');reset(input);
  assign(output,'tree.out');rewrite(output);
  readln(n);
  while n<>0 do
    begin
      k:=n;
      for i:=1 to 17 do
        if a[i]<k then
          k:=k-a[i]
        else break;
      writeln(get(i,k));
      readln(n);
    end;
  close(input);close(output);
end.
