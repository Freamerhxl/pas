var sum:array[0..32,0..51,0..51]of longint;
    i,j,k,ii,jj,h,n,m,temp,ans:longint;
begin
  assign(input,'matrix.in');reset(input);
  assign(output,'matrix.out');rewrite(output);
  readln(h,n,m);
  for i:=1 to h do
    begin
      for ii:=1 to n do
      for jj:=1 to m do
        begin
          read(sum[i,ii,jj]);
          sum[i,ii,jj]:=sum[i,ii,jj]+sum[i-1,ii,jj]+sum[i,ii-1,jj]-sum[i-1,ii-1,jj];
        end;
      for ii:=i downto 1 do
      for j:=1 to n do
      for jj:=j downto 1 do
        begin
          temp:=0;
          for k:=1 to m do
            begin
              if temp<0 then temp:=sum[i,j,k]-sum[i,jj-1,k]-sum[ii-1,j,k]+sum[ii-1,jj-1,k]
                   else temp:=temp+sum[i,j,k]-sum[i,jj-1,k]-sum[ii-1,j,k]+sum[ii-1,jj-1,k];
              if temp>ans then ans:=temp;
            end;
        end;
    end;
  writeln(ans);
  close(input);close(output);
end.