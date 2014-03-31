var a,b,f:array[0..20001]of longint;
    i,j,n,m,ans,flag:longint;
    ch:char;
    st:string;
procedure sort(t,w:longint);
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
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'data.in');reset(input);
  readln(n);
  readln(ch);
  readln(m);
  for i:=1 to n do
    begin
      read(a[i]);readln(st);
      while pos(' ',st)>0 do delete(st,pos(' ',st),1);
      b[i]:=length(st);
    end;
  if ch='L' then
    begin
      fillchar(f,sizeof(f),43);
      flag:=f[0];f[0]:=0;
      for i:=1 to n do
      for j:=m downto b[i]do
      if f[j-b[i]]<flag then
      if f[j-b[i]]+a[i]<f[j]then
      f[j]:=f[j-b[i]]+a[i];
      if f[m]<flag then
        writeln(f[m])
      else
        writeln('DIY');
    end
  else
    begin
      if n<m then
        begin
          writeln('DIY')
        end
      else
        begin
          sort(1,n);
          for i:=1 to m do
            ans:=ans+a[i];
          writeln(ans);
        end;
    end;
end.