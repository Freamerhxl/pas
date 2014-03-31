const pp=9999973;
var f:array[0..101,-2..102,-2..102]of qword;
    n,m,i,j,now,last,k,p:longint;
    ans:qword;
begin
  assign(input,'b.in');reset(input);
  assign(output,'b.out');rewrite(output);
  readln(n,m);
  f[0,m,0]:=1;
  for p:=1 to n do
    begin
//      now:=1-now;next:=1-next;fillchar(f[now],sizeof(f[now]),0);
      for i:=0 to m do
      for j:=0 to m-i do
        f[p,i,j]:=(f[p-1,i+2,j-2]*(i+2)*(i+1)div 2+
                  f[p-1,i,j+2]*(j+2)*(j+1)div 2+
                  f[p-1,i+1,j]*(i+1)*j+
                  f[p-1,i+1,j-1]*(i+1)+
                  f[p-1,i,j+1]*(j+1)+
                  f[p-1,i,j])mod pp;
    end;
  for  i:=0 to m do
  for  j:=0 to m-i do
    ans:=(ans+f[n,i,j])mod pp;
  writeln(ans);
  close(input);close(output);
end.