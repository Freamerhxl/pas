var f:array[0..255]of char;
    a,b:array[0..10001]of longint;
    i,j,n,m,k,t,w,mid,op,ans:longint;
    st,ss:ansistring;
procedure sort_a(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=a[(t+w)>>1];
  repeat
     while a[i]<k do inc(i);
     while a[j]>k do dec(j);
     if i<=j then
       begin
         a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
         inc(i);dec(j);
       end;
  until i>j;
  if j>t then sort_a(t,j);
  if i<w then sort_a(i,w);
end;
procedure sort_b(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=b[(t+w)>>1];
  repeat
     while b[i]<k do inc(i);
     while b[j]>k do dec(j);
     if i<=j then
       begin
         b[0]:=b[i];b[i]:=b[j];b[j]:=b[0];
         inc(i);dec(j);
       end;
  until i>j;
  if j>t then sort_b(t,j);
  if i<w then sort_b(i,w);
end;
begin
  assign(input,'T1029_p2.in');reset(input);
  assign(output,'T1029_p2.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(st);
      ss:=copy(st,1,pos(' ',st)-1);
      delete(st,1,pos(' ',st));
      val(st,a[i],a[i]);
      k:=0;
      for j:=1 to length(ss)do
        f[j]:=chr(255);
      f[0]:=chr(0);
      for j:=1 to length(ss)do
        begin
          t:=0;w:=k;
          mid:=(t+w)>>1;
          repeat
            if f[mid]<ss[j]then
              begin
                op:=mid;t:=mid+1;
              end
            else w:=mid-1;
            mid:=(t+w)>>1;
          until t>w;
          if op+1>k then k:=op+1;
          if ss[j]<f[op+1]then f[op+1]:=ss[j];
        end;
      b[i]:=k;
    end;
  sort_a(1,n);
  sort_b(1,n);
  for i:=1 to n do
    ans:=ans+a[i]*b[n-i+1];
  writeln(ans);
close(output);
end.
