var name,s,ansname,temp:string;
    i,n,ans,tot,as,j,k,count,now:longint;
    c1,c2:char;
begin
  assign(input,'scholar.in');reset(input);
  assign(output,'scholar.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(s); s:=s+' ';
      name:=copy(s,1,pos(' ',s)-1);
      delete(s,1,pos(' ',s));
      while s[1]=' ' do delete(s,1,1);
      temp:=copy(s,1,pos(' ',s)-1);
      val(temp,as,k);
      delete(s,1,pos(' ',s));
      while s[1]=' ' do delete(s,1,1);
      temp:=copy(s,1,pos(' ',s)-1);
      val(temp,j,k);
      delete(s,1,pos(' ',s));
      while s[1]=' ' do delete(s,1,1);
      c1:=s[1];
      delete(s,1,pos(' ',s));
      while s[1]=' ' do delete(s,1,1);
      c2:=s[1];
      delete(s,1,pos(' ',s));
      while s[1]=' ' do delete(s,1,1);
      temp:=copy(s,1,pos(' ',s)-1);
      val(temp,count,k);
      now:=0;
      if(as>80)and(count>0)then inc(now,8000);
      if(as>85)and(j>80)then inc(now,4000);
      if(as>90)then inc(now,2000);
      if(as>85)and(c2 in['Y','y'])then inc(now,1000);
      if(j>80)and(c1 in['Y','y'])then inc(now,850);
      inc(tot,now);
      if now>ans then
        begin
          ans:=now;
          ansname:=name;
        end;
    end;
  writeln(ansname);
  writeln(ans);
  writeln(tot);
  close(input);close(output);
end.