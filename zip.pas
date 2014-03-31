type point=^node;
node=record
     ch:char;
     next:point;
end;
var a,b,ans:array[0..10001]of char;
         id:array[0..10001]of longint;
    son:array[char]of point;
    sta:array[char]of longint;
    i,j,n,m,k:longint;
    ch:char;
    p:point;
procedure sort(t,w:longint);
var i,j,k:longint;
    ch:char;
begin
  i:=t;j:=w;ch:=b[(t+w)>>1];k:=id[(t+w)>>1];
  repeat
    while(b[i]<ch)or((b[i]=ch)and(id[i]<k))do inc(i);
    while(b[j]>ch)or((b[j]=ch)and(id[j]>k))do dec(j);
    if i<=j then
      begin
        b[0]:=b[i];b[i]:=b[j];b[j]:=b[0];
        id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'zip.in');reset(input);
  assign(output,'zip.out');rewrite(output);
  readln(n);
  for i:=1 to n do
  begin
    read(a[i]);b[i]:=a[i];
    id[i]:=i;
  end;
  readln;
  readln(m);
  sort(1,n);
  for i:=1 to n do
    begin
      new(p);p^.ch:=a[i];
      p^.next:=son[b[i]];son[b[i]]:=p;
      if sta[b[i]]=0 then sta[b[i]]:=i;
    end;
  ans[1]:=a[m];
  ans[n]:=a[sta[a[m]]];
  for i:=n-1 downto 2 do
    begin
      ch:=ans[i+1];
      ans[i]:=son[ch]^.ch;
      son[ch]:=son[ch]^.next;
    end;
  for i:=1 to n do
    write(ans[i]);
  close(input);close(output);
end.