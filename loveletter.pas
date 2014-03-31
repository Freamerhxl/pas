var count:array['A'..'z']of longint;
    a:array[0..60000]of char;
    c:array['A'..'z']of char;
    n,i,j,max,t:longint;
    ch,ansc,cc:char;
begin
  assign(input,'loveletter.in');reset(input);
  assign(output,'loveletter.out');rewrite(output);
  n:=0;max:=0;
  while not eof do
    begin
      inc(n);read(a[n]);
      if a[n]in['a'..'z']then inc(count[a[n]]);
    end;
  max:=0;
  for ch:='a' to 'z' do
    if count[ch]>max then
      begin
        ansc:=ch;max:=count[ch];
      end;
  ch:=ansc;
  if 'e'>=ch then
    t:=ord('e')-ord(ch)
  else
    t:=ord('z')-ord(ch)+5;
  c['a']:=chr(ord('a')+t);cc:=c['a'];c['A']:=upcase(c['a']);
  for ch:='b' to 'z' do
    begin
      cc:=chr(ord(cc)+1);if cc>'z' then cc:='a';
      c[ch]:=cc; c[upcase(ch)]:=upcase(cc);
    end;
  for i:=1 to n do
    if a[i]in['A'..'Z','a'..'z']then
      write(c[a[i]])
    else write(a[i]);
  close(input);close(output);
end.