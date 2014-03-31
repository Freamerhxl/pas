var f:array[0..1,0..2001,1..2]of int64;
    max:array[0..2001,0..2001]of integer;
    i,j,n,k,p,w1,w2,now,last:longint;
    ans:int64;
begin
  assign(input,'cirque.in');reset(input);
  assign(output,'cirque.out');rewrite(output);
  readln(n,k);
  for i:=1 to n do
    read(max[i,i]);
  for i:=1 to n do
  for j:=i+1 to n do
    begin
      max[i,j]:=max[i,j-1];
      if max[j,j]>max[i,j]then max[i,j]:=max[j,j];
      max[j,i]:=max[i,j];
    end;
  if 2*k+1>=n then
    begin
      for i:=1 to n do
        ans:=ans+max[i,i];
    end
  else
    begin
      fillchar(f,sizeof(f),43);
      f[0,n-k+1,1]:=max[1,1];
      f[0,n-k+1,2]:=max[1,1];
      ans:=f[0,0,1];
      for i:=1 to k do
        begin
          f[0,n-k+1,1]:=f[0,n-k+1,1]+max[1+i,1+i]+max[n-i+1,n-i+1];
          f[0,n-k+1,2]:=f[0,n-k+1,2]+max[1+i,1+i]+max[n-i+1,n-i+1];
        end;
      now:=0;
      for i:=1+k to n-k do
        begin
          for j:=n-k+1 downto i+1 do
            begin
              if i>1+k then
                begin
                  if f[last,j,1]+max[i,j-1]+max[i,i]<f[now,j,1]then
                    f[now,j,1]:=f[last,j,1]+max[i,j-1]+max[i,i];
                  if f[last,j,2]+max[i,j-1]*(n-j+i-2*k)+max[i,i]<f[now,j,1]then
                    f[now,j,1]:=f[last,j,2]+max[i,j-1]*(n-j+i-2*k)+max[i,i];
                end;
              if j<n-k+1 then
                begin
                  if f[now,j+1,2]+max[i+1,j]+max[j,j]<f[now,j,2]then
                    f[now,j,2]:=f[now,j+1,2]+max[i+1,j]+max[j,j];
                  if f[now,j+1,1]+max[i+1,j]*(n-j+i-2*k)+max[j,j]<f[now,j,2]then
                    f[now,j,2]:=f[now,j+1,1]+max[i+1,j]*(n-j+i-2*k)+max[j,j];
                end;
            end;
          if f[now,i+1,1]<ans then ans:=f[now,i+1,1];
          if f[now,i+1,2]<ans then ans:=f[now,i+1,2];
          now:=1-now;last:=1-now;
          fillchar(f[now],sizeof(f[now]),43);
        end;
    end;
  writeln(ans);
  close(input);close(output);
end.