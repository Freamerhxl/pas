var s,a,b:ansistring;
    n,m,p,i,j:longint;
    cha:array['A'..'z']of char;
    ch:char;
begin
  assign(input,'lock.in');reset(input);
  assign(output,'lock.out');rewrite(output);
  readln(s);
  readln(m,n,p);
  b:=s;a:=copy(s,1,m-1);delete(b,1,m-1);
  case n of
    1:begin
        for i:=1 to length(s)do
          if s[i]in['a'..'z']then
            s[i]:=chr(ord(s[i])-ord('a')+ord('A'))
          else
          if s[i]in['A'..'Z']then
            s[i]:=chr(ord(s[i])-ord('A')+ord('a'));
        s:=s+'Immorta1';
      end;
    2:begin
        i:=pos(b,s);
        while i<>0 do
        begin
          delete(s,i,length(b));
          i:=pos(b,s);
        end;
        i:=pos('1013',s);
        while i<>0 do
          begin
            delete(s,i,4);
            insert('hh4742',s,i);
            i:=pos('1013',s);
          end;
      end;
    3:begin
        insert(b,a,abs(n-m));
        s:=a;
      end;
  end;
  for i:=1 to length(s)do
  for j:=1 to p+1 do
    write(s[i]);
  close(input);close(output);
end.