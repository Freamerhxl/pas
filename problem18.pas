const p=1e-8;
var a:array[0..5]of longint;
    i,j,n,k,num:longint;
    st1,s,st2:ansistring;
    ans1,ans2:extended;
procedure out(x:longint);
begin
  if x in[1..2]then
    begin
      writeln(x);
      if x=1 then writeln(ans1+p:0:5)
      else
      writeln(ans1+p:0:5,' ',ans2+p:0:5);
    end
  else
    begin
    if x=3 then
    writeln('181818181818')
    else writeln(0);
    end;
end;
procedure ins(s:ansistring;k:longint);
var i,j:longint;
begin
  if s='' then exit;
  if pos('x^2',s)>0 then
    begin
      j:=1;
      delete(s,pos('x^2',s),3);
    end
  else
  if pos('x',s)>0 then
    begin
      j:=2;delete(s,pos('x',s),1);
    end
  else j:=3;
  if(j<3)and(s='')then
    i:=1
  else val(s,i,i);
  a[j]:=a[j]+k*i;
end;
procedure work;
var detal:extended;
begin
  if abs(a[1])<p then
    begin
      ans1:=-a[3]/a[2];
      out(1);
    end
  else
    begin
      detal:=a[2]*a[2]-4*a[1]*a[3];
      if detal<-p then out(0)
      else
      if abs(detal)<p then
        begin
          ans1:=-a[2]/(2*a[1]);
          out(1);
        end
      else
        begin
          detal:=sqrt(detal);
          ans1:=(-a[2]+detal)/(2*a[1]);
          ans2:=(-a[2]-detal)/(2*a[1]);
          if ans2<ans1 then
            begin
              detal:=ans1;ans1:=ans2;ans2:=detal;
            end;
          out(2);
        end;
    end;
end;
begin
  assign(input,'problem.in');reset(input);
  assign(output,'problem.out');rewrite(output);
  readln(st1);
  st2:=copy(st1,pos('=',st1)+1,length(st1));
  delete(st1,pos('=',st1),length(st1));
  k:=1;
  st1:=st1+' ';st2:=st2+' ';s:='';
  for i:=1 to length(st1)do
    begin
      if st1[i]in['0'..'9','x','^']then
        s:=s+st1[i]
      else
        begin
          ins(s,k);
          if st1[i]='+' then k:=1
          else if st1[i]='-' then k:=-1;
          s:='';
        end;
    end;
  st1:=st2;k:=-1;s:='';
  for i:=1 to length(st1)do
    begin
      if st1[i]in['0'..'9','x','^']then
        s:=s+st1[i]
      else
        begin
          ins(s,k);
          if st1[i]='+' then k:=-1
          else if st1[i]='-' then k:=1;
          s:='';
        end;
    end;
  if(abs(a[1])<p)and(abs(a[2])<p)then
    begin
      if abs(a[3])<p then out(3)
        else out(0);
    end
  else
    work;
  close(input);close(output);
end.