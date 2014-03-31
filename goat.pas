var f:array[0..1,0..101]of longint;
    i,j,s,p,now,last,max,t,k,bp:longint;
begin
  assign(input,'goat.in');reset(input);
  assign(output,'goat.out');rewrite(output);
  readln(s,p);
  bp:=0;
  if p<2 then
    begin
      writeln(s);
      close(output);
      halt;
    end;
  if s>1000 then
    begin
      k:=s-1000;
      if p<5 then
        begin
          if k>6 then
            begin
              t:=(k div 7)*3;
              k:=k mod 7;
            end;
        end
      else
        begin
          if k>14 then
            begin
              t:=(k div 15)*6;
              k:=k mod 15;
            end;
        end;
      s:=1000+k;
    end;
  f[0,0]:=0;
  for i:=1 to maxlongint do
    begin
      now:=i and 1;last:=1-now;
      for j:=0 to p do
        begin
          if j<p then
            begin
              if f[last,j+1]+1>f[now,j]then f[now,j]:=f[last,j+1]+1;
            end;
          if j>0 then
            begin
              if(j>1)and(f[last,j-2]+5>f[now,j])then f[now,j]:=f[last,j-2]+5;
              if(j>4)and(f[last,j-5]+10>f[now,j])then f[now,j]:=f[last,j-5]+10;
            end;
          if f[now,j]>max then max:=f[now,j];
        end;
      if max>=s then break;
    end;
  writeln(i+t);
  close(input);close(output);
end.
