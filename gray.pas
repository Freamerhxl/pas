var data,ans:array[0..100002]of ansistring;
    count:array[0..100002]of longint;
    i,j,n,m:longint;
procedure sort_1(t,w:longint);
  var i,j:longint;
      k:ansistring;
begin
  i:=t;j:=w;
  k:=data[(t+w)div 2];
  repeat
    while data[i]<k do inc(i);
    while data[j]>k do dec(j);
    if i<=j then
      begin
        data[0]:=data[i];data[i]:=data[j];data[j]:=data[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort_1(t,j);
  if i<w then sort_1(i,w);
end;
procedure sort_2(t,w:longint);
  var i,j,k1:longint;
      k2:ansistring;
begin
  i:=t;j:=w;
  k1:=count[(t+w)div 2];
  k2:=ans[(t+w)div 2];
  repeat
    while(count[i]>k1)or((count[i]=k1)and(ans[i]<k2))do inc(i);
    while(count[j]<k1)or((count[j]=k1)and(ans[j]>k2))do dec(j);
    if i<=j then
      begin
        ans[0]:=ans[i];ans[i]:=ans[j];ans[j]:=ans[0];
        count[0]:=count[i];count[i]:=count[j];count[j]:=count[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort_2(t,j);
  if i<w then sort_2(i,w);
end;
begin
  assign(input,'gray.in');reset(input);
  assign(output,'gray.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(data[i]);
  sort_1(1,n);
  data[0]:='';
  data[n+1]:='';
  j:=0;
  for i:=1 to n+1 do
    if data[i]<>data[i-1]then
      begin
        if j>2 then
          begin
            inc(m);
            ans[m]:=data[i-1];
            count[m]:=j;
          end;
        j:=1;
      end
    else
      inc(j);
  sort_2(1,m);
  writeln(m);
  for i:=1 to m do
    writeln(ans[i]);
  close(input);close(output);
end.