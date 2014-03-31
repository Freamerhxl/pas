const op:array['A'..'Z']of integer=(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
var a,b,c:array[0..101,0..26]of longint;
    d:array[0..101,0..26,0..5]of longint;
    i,j,n,m,k,s,x,y,x1,y1,x2,y2:longint;
    st,ss,s3:string;
    ch:char;
procedure change(x,y,x1,y1,x2,y2,p:longint);
var i,j,temp:longint;
begin
  temp:=0;
  a[x,y]:=0; b[x,y]:=p;
  for i:=x1 to x2 do
  for j:=y1 to y2 do
    begin
      inc(temp);
      if b[i,j]>1 then
        change(i,j,d[i,j,1],d[i,j,2],d[i,j,3],d[i,j,4],b[i,j]);
      a[x,y]:=a[x,y]+a[i,j];
    end;
 if p=3 then a[x,y]:=a[x,y]div temp;
 d[x,y,1]:=x1;d[x,y,2]:=y1;d[x,y,3]:=x2;d[x,y,4]:=y2;
end;
procedure indata(x,y,data:longint);
begin
  b[x,y]:=1;
  a[x,y]:=data;
end;
procedure outdata(x,y:longint);
begin
  if b[x,y]>1 then
    change(x,y,d[x,y,1],d[x,y,2],d[x,y,3],d[x,y,4],b[x,y]);
  writeln(a[x,y]);
end;
begin
  assign(input,'excel.in');reset(input);
  assign(output,'excel.out');rewrite(output);
  readln(m,n);
  readln(s);
  for i:=1 to s do
    begin
      readln(st);
      st:=st+' ';
      while st[1]=' ' do delete(st,1,1);
      ch:=st[1];delete(st,1,1);ss:=copy(st,1,pos(' ',st)-1);delete(st,1,pos(' ',st));
      y:=op[ch];val(ss,x,x);while st[1]=' ' do delete(st,1,1);ss:=copy(st,1,pos(' ',st)-1);
      ss:=upcase(ss);
      if ss='OUTPUT' then
        outdata(x,y)
      else
      if ss='INPUT'then
        begin
          delete(st,1,pos(' ',st));
          while pos(' ',st)<>0 do
            delete(st,pos(' ',st),1);
          val(st,j,j);
          indata(x,y,j);
        end
      else
        begin
          delete(st,1,pos(' ',st));
          while st[1]=' ' do delete(st,1,1);
          s3:=copy(st,1,pos(' ',st)-1);
          y1:=op[s3[1]];delete(s3,1,1);val(s3,x1,x1);
          delete(st,1,pos(' ',st));
          while st[1]=' ' do delete(st,1,1);
          s3:=copy(st,1,pos(' ',st)-1);
          y2:=op[s3[1]];delete(s3,1,1);val(s3,x2,x2);
          if ss='SUM' then
            change(x,y,x1,y1,x2,y2,2)
          else change(x,y,x1,y1,x2,y2,3);
        end;
    end;
  close(input);close(output);
end.