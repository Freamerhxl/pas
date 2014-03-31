var t,tt:array[0..1003,1..3]of longint;
    i,j,n,m,k,a,b,c,op,fuck:longint;
begin
  assign(input,'paste.in');reset(input);
  assign(output,'paste.out');rewrite(output);
  readln(n,k);
  for i:=1 to k do
    begin
      readln(t[i,1],t[i,2],t[i,3]);
   {   if t[i,3]>=t[i,1]then
        begin
        //  op:=t[i,1]-1;t[i,1]:=t[i,2]+1;t[i,2]:=t[i,3];t[i,3]:=op;
        op:=t[i,1]-1;t[i,1]:=t[i,2]+1;t[i,2]:=c+t[i,2]-op;t[i,3]:=op;
        end;  }
    end;
  for i:=1 to 10 do
    begin
      op:=i;
      for j:= k downto 1 do
        begin
          a:=t[j,1];b:=t[j,2];c:=t[j,3];
          m:=b-a+1;
          if c<a-1 then
            begin
              if(op>c)and(op<=c+m)then
                op:=a+op-c-1
              else
              if(op>=c+m+1)and(op<=b)then
                op:=op-m;
            end
          else
          if c>=a then
          begin
            fuck:=b+c-a+1;
            if(op>=a+fuck-b)and(op<=fuck)then
              op:=op-fuck+b
            else
            if(op>=a)and(op<=a+fuck-b-1)then
              op:=op+m;
          end;
        end;
      writeln(op);
    end;
  close(input);close(output)
end.