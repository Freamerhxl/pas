var f:array[0..1101,0..51,0..51]of boolean;
    map:array[0..51,0..51]of boolean;
    i,j,k,n,m,p,pp:longint;
    st:string;
begin
  assign(input,'SEARCH.in');reset(input);
  assign(output,'SEARCH.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  begin
    readln(st);
    for j:=1 to m do
     begin
       map[i,j]:=true;
       if st[j]in['X','x']then map[i,j]:=false;
       if st[j]='*' then f[0,i,j]:=true;
     end;
  end;
  readln(k);
  for p:=1 to k do
    begin
      readln(st);
      st:=upcase(st);
      for i:=1 to n do
      for j:=1 to m do
      if f[p-1,i,j]=true then
        begin
          if st[1]='N' then for pp:=i-1 downto 1 do if map[pp,j]then f[p,pp,j]:=true else break;
          if st[1]='W' then for pp:=j-1 downto 1 do if map[i,pp]then f[p,i,pp]:=true else break;
          if st[1]='S' then for pp:=i+1     to n do if map[pp,j]then f[p,pp,j]:=true else break;
          if st[1]='E' then for pp:=j+1     to m do if map[i,pp]then f[p,i,pp]:=true else break;
        end;
    end;
  for i:=1 to n do
    begin
      for j:=1 to m do
        if map[i,j]=false then write('X')
      else
        begin
          if f[k,i,j]then write('*')
          else write('.');
        end;
      writeln;
    end;
  close(input);close(output);
end.