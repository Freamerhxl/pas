var count:array[0..32768]of longint;
    data:array[0..1000001]of longint;
    ans,i,j,n,d,minl,temp,t:longint;
begin
  assign(input,'happy.in');reset(input);
  assign(output,'happy.out');rewrite(output);
  readln(n,d);
  t:=1; minl:=maxlongint;
  for i:=1 to n do
    begin
      read(data[i]);
      inc(count[data[i]]);
      if count[data[i]]=1 then
        inc(temp);
      while(count[data[t]]>1)or(i-t+1>d)do
        begin
          dec(count[data[t]]);
          if count[data[t]]=0 then dec(temp);
          inc(t);
        end;
      if temp>ans then
        begin
          ans:=temp;
          minl:=i-t+1;
        end
      else
        if(temp=ans)and(i-t+1<minl)then
          minl:=i-t+1;
    end;
  writeln(ans,' ',minl);
  close(input);close(output);
end.