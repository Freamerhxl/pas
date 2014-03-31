var a:array['A'..'Z']of ansistring;
    out,f:array[0..101,'A'..'Z']of longint;
    done:array[0..101,'A'..'Z']of boolean;
    p:array[0..101]of longint;
    i,j,n,ans:longint;
    root,ch,op:char;
    opt:ansistring;
procedure work(root:char;k:longint);
var i,kk,j:longint;
begin
   done[k,root]:=true;
   kk:=0;f[k,root]:=0;j:=k;
   for i:=1 to length(a[root])do
    begin
      if(a[root][i]>='A')and(a[root][i]<='Z')then
        begin
          if done[j,a[root][i]]then
            begin
              f[k,root]:=(f[k,root]+f[j,a[root][i]])mod 10000;
       //       if f[k,root]>=10000 then f[k,root]:=f[k,root]-10000;
              j:=out[j,a[root][i]];
            end
          else
            begin
              work(a[root][i],j);
              f[k,root]:=(f[k,root]+f[j,a[root][i]])mod 10000;
             // if f[k,root]>=10000 then f[k,root]:=f[k,root]-10000;
              j:=out[j,a[root][i]];
            end;
        end
      else
        begin
          while(j>0)and(opt[j+1]<>a[root][i])do j:=p[j];
          if opt[j+1]=a[root][i]then inc(j);
          if j=length(opt)then
            begin
              inc(f[k,root]);
              f[k,root]:=f[k,root]mod 10000;
              j:=0;
            end;
        end;
    end;
   out[k,root]:=j;
end;
begin
  readln(n);
  readln(root);
  for i:=1 to n do
    begin
      read(op);read(ch);
      readln(a[op]);
    end;
  readln(opt);
  j:=0;
  for i:=2 to length(opt)do
    begin
      while(j>0)and(opt[j+1]<>opt[i])do j:=p[j];
      if opt[j+1]=opt[i]then inc(j);
      p[i]:=j;
    end;
  j:=0;
  work(root,0);
  writeln(f[0,root]mod 10000);
end.
