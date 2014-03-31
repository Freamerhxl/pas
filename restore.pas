var l,r:array['a'..'z',0..26]of char;
    s:array[1..3,0..1,0..10001]of char;
    i,j,n,k,p:longint;
    ch,c1,c2:char;
    flag:boolean;
begin
  assign(input,'restore.in');reset(input);
  assign(output,'restore.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(s[1][0,i]);readln;
  for i:=1 to n do
    read(s[2][0,i]);readln;
  for i:=1 to n do
    read(s[3][0,i]);readln;
  for ch:='a' to 'z' do
    begin
    c1:=ch;c2:=ch;
    for j:=0 to 25 do
      begin
        r[ch,j]:=c1;c1:=chr(ord(c1)+1);if c1>'z' then c1:='a';
        l[ch,j]:=c2;c2:=chr(ord(c2)-1);if c2<'a' then c2:='z';
      end;
    end;
  j:=n; s[1][1]:=s[1][0];s[2][1]:=s[2][0];s[3][1]:=s[3][0];
  for i:=1 to n>>1 do
    begin
      s[1][1,i]:=s[1][0,j];s[1][1,j]:=s[1][0,i];
      s[2][1,i]:=s[2][0,j];s[2][1,j]:=s[2][0,i];
      s[3][1,i]:=s[3][0,j];s[3][1,j]:=s[3][0,i];
      dec(j);
    end;
  for k:=0 to 25 do
  for i:=1 to 3 do
  for j:=1 to 3 do
  if(i<>j)then
    begin
      flag:=true;
      for p:=1 to n do
        if(l[s[i,0,p],k]<>r[s[j,0,p],k])or(l[s[i,0,p],k]<>s[6-i-j,1,p])or(r[s[j,0,p],k]<>s[6-i-j,1,p])then
          begin
            flag:=false;
            break;
          end;
      if flag then
      begin
        for p:=1 to n do
          write(s[6-i-j,1,p]);
        close(output);halt;
      end;
    end;
  close(input);close(output);
end.