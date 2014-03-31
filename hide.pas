var //f:array[0..1001,0..1001]of boolean;
    a:array[0..1001]of longint;
    i,j,n,m,k,p,pp,st:longint;
    can:boolean;
procedure done;
begin
  writeln('Yes');
  close(input);close(output);
  halt;
end;
begin
  assign(input,'hide.in');reset(input);
  assign(output,'hide.out');rewrite(output);
  readln(n,k,p);
  for i:=1 to n do
    begin
      read(a[i]);
      for j:=i-1 downto 1 do
        if a[j+1]<a[j]then
          begin
            a[j]:=a[j]xor a[j+1];
            a[j+1]:=a[j]xor a[j+1];
            a[j]:=a[j]xor a[j+1];
          end
        else break;
    end;
  pp:=1;st:=1;
  while pp<=k do
    begin
      if a[n]-a[st]<=p then done;
      for i:=st+1 to n do
        if a[i]-a[st]>p then break;
      st:=i;inc(pp);
    end;
  writeln('No');
  close(input);close(output);
end.