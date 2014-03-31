var a:array[0..4000001]of longint;
    i,j,n,t,l,r,al,ar,aa:longint;
    ans,temp:qword;
procedure make;
var i,j,k:longint;
begin
  i:=t;j:=t+n-1;
  while i>0 do
    begin
      k:=i;
      while k<j do
        begin
          if a[k]<a[k+1]then a[k>>1]:=a[k] else a[k>>1]:=a[k+1];
          k:=k+2;
        end;
      if j and 1=0 then a[j>>1]:=a[j];
      i:=i>>1;j:=j>>1;
    end;
end;
function findl(y,op:longint):longint;
var i,j,k:longint;
begin
  if y=0 then exit(0);
  i:=t;j:=y+t-1;k:=0;
  while(i<=j)and(a[j]>=op)do
    begin
      if a[i]<op then k:=i;
      if i and 1=1 then inc(i);
      if j and 1=0 then dec(j);
      i:=i>>1;j:=j>>1;
    end;
  if i>j then
    begin
     if k=0 then
      exit(0);
     while k<t do
       begin
         if a[2*k+1]<op then k:=2*k+1
          else k:=2*k;
       end;
     exit(k-t+1);
    end;
  while j<t do
    begin
      if a[2*j+1]<op then j:=2*j+1
        else j:=2*j;
    end;
  exit(j-t+1);
end;
function findr(y,op:longint):longint;
var i,j,k:longint;
begin
  if y=n+1 then exit(n+1);
  i:=y+t-1;j:=n+t-1;k:=0;
  while(i<=j)and(a[i]>=op)do
    begin
      if a[j]<op then k:=j;
      if i and 1=1 then inc(i);
      if j and 1=0 then dec(j);
      i:=i>>1;j:=j>>1;
    end;
  if i>j then
  begin
    if k=0 then
      exit(n+1);
    while k<t do
       begin
         if a[2*k]<op then k:=2*k
          else k:=2*k+1;
       end;
     exit(k-t+1);
  end;
  while i<t do
    begin
      if a[2*i]<op then i:=2*i
        else i:=2*i+1;
    end;
  exit(i-t+1);
end;
begin
  assign(input,'contest.in');reset(input);
  assign(output,'contest.out');rewrite(output);
  t:=1;
  readln(n);
  for i:=1 to maxlongint do
    begin
      if t>=n then break;
      t:=t*2;
    end;
  for i:=t to t+n-1 do
    begin
     read(a[i]);
    end;
  if n=1 then
    writeln(a[1])
  else
    begin
      make;
      for i:=1 to n do
        begin
          l:=findl(i-1,a[t+i-1]);
          r:=findr(i+1,a[t+i-1]);
          temp:=qword(r-l-1)*a[t+i-1];
          if temp>ans then begin ans:=temp;{aa:=i;al:=l;ar:=r;}end;
        end;
       writeln(ans);
    end;
  close(input);close(output);
end.