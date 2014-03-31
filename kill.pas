var ct,t:array[0..101]of longint;
    map:array[0..101,0..101]of boolean;
    p:array[0..101]of ansistring;
    d:array[0..101]of longint;
    done:array[0..101]of boolean;
    i,j,n,k1,k2,ans:longint;
    st,ss:ansistring;
begin
  assign(input,'kill.in');reset(input);
  assign(output,'kill.out');rewrite(output);
  while  not eof do
    begin
      readln(st);st:=upcase(st);
      while st[1]=' ' do delete(st,1,1);
      ss:=copy(st,1,pos(' ',st)-1);
      delete(st,1,length(ss)+1);
      while pos(' ',st)>0 do delete(st,pos(' ',st),1);
      for i:=n downto 0 do
        if p[i]=ss then break;
      k1:=i;
      if i=0 then
        begin
          inc(n);p[n]:=ss;k1:=n;
        end;
      if st[1]in['0'..'9']then
        val(st,ct[k1],ct[k1])
      else
        begin
          for i:=n downto 0 do
            if p[i]=st then break;
          k2:=i;
          if i=0 then
            begin
             inc(n);p[n]:=st;k2:=n;
            end;
          map[k1,k2]:=true;inc(d[k2]);
        end;
    end;
  for i:=1 to n do
    t[i]:=ct[i];
  for i:=1 to n do
     begin
       for j:=1 to n do
         if(done[j]=false)and(d[j]=0)then
           break;
       k1:=j;done[k1]:=true;
       for j:=1 to n do
       if map[k1,j]then
         begin
           dec(d[j]);if t[k1]+ct[j]>t[j]then t[j]:=t[k1]+ct[j];
         end;
     end;
  for i:=1 to n do
    if t[i]>ans then ans:=t[i];
  writeln(ans);
  close(input);close(output);
end.