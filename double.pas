var f:array[0..4,0..4,0..4,0..4,0..4,0..4,0..4,0..4,0..4]of extended;
    a:array[0..9,0..4]of longint;
    ii,de:array[0..9]of longint;
    i,j,k:longint;
    st:ansistring;
begin
  assign(input,'double.in');reset(input);
  assign(output,'double.out');rewrite(output);
  for i:=1 to 9 do
    begin
      readln(st);st:=upcase(st);
      for j:=1 to 4 do
        begin
          while st[1]=' ' do delete(st,1,1);
          k:=1;
          if st[k] in['2'..'9']then
            a[i,j]:=ord(st[k])-48
          else
          begin
            if st[k]='A' then
              a[i,j]:=1;
            if st[k]='T' then
              a[i,j]:=10;
            if st[k]='J' then
              a[i,j]:=11;
            if st[k]='Q' then
              a[i,j]:=12;
            if st[k]='K' then
              a[i,j]:=13;
          end;
          delete(st,1,2);
        end;
    end;
  for i:=1 to 9 do
    a[i,0]:=-i;
  fillchar(f,sizeof(f),0);
  f[4,4,4,4,4,4,4,4,4]:=1;
  fillchar(de,sizeof(de),0);
  for ii[1]:=4 downto 0 do
  for ii[2]:=4 downto 0 do
  for ii[3]:=4 downto 0 do
  for ii[4]:=4 downto 0 do
  for ii[5]:=4 downto 0 do
  for ii[6]:=4 downto 0 do
  for ii[7]:=4 downto 0 do
  for ii[8]:=4 downto 0 do
  for ii[9]:=4 downto 0 do
  if f[ii[1],ii[2],ii[3],ii[4],ii[5],ii[6],ii[7],ii[8],ii[9]]>0 then
    begin
      k:=0;
      for i:=1 to 8 do
      for j:=i+1 to 9 do
      if a[i,ii[i]]=a[j,ii[j]]then inc(k);
      for i:=1 to 8 do
      for j:=i+1 to 9 do
      if a[i,ii[i]]=a[j,ii[j]]then
        begin
          de[i]:=1;de[j]:=1;
          f[ii[1]-de[1],ii[2]-de[2],ii[3]-de[3],ii[4]-de[4],ii[5]-de[5],ii[6]-de[6],ii[7]-de[7],ii[8]-de[8],ii[9]-de[9]]:=
          f[ii[1]-de[1],ii[2]-de[2],ii[3]-de[3],ii[4]-de[4],ii[5]-de[5],ii[6]-de[6],ii[7]-de[7],ii[8]-de[8],ii[9]-de[9]]+f[ii[1],ii[2],ii[3],ii[4],ii[5],ii[6],ii[7],ii[8],ii[9]]*(1/k);
          de[i]:=0;de[j]:=0;
        end;
    end;
  writeln(f[0,0,0,0,0,0,0,0,0]:0:6);
  close(input);close(output);
end.