var i,n,ans,now,j:longint;
    st,anss,s:ansistring;
begin
  assign(input,'rprp.in');reset(input);
  assign(output,'rprp.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      now:=0;
      readln(st);
      s:=st;
      if pos('reioxzsj',st)=0 then continue;
      for j:=1 to length(st)do
        if st[j]in['R','r','P','p']then
          now:=now+5;
      for j:=2 to length(st)do
        if(st[j]in['R','r'])and(st[j-1]in['P','p'])then
          now:=now+20;
      j:=pos('woc',st);
      while j>0 do
        begin
          now:=now+5;
          delete(st,j,3);
          j:=pos('woc',st);
        end;
      if now>ans then
        begin
         ans:=now;anss:=s;
        end
      else
      if(now=ans)and(s<anss)then
        anss:=s;
    end;
  writeln(anss);
  writeln(ans);
  close(input);close(output);
end.