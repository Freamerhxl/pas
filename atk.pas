var data:Array[0..50001,1..3]of longint;
    i,j,n,m,k,op,ans:longint;
    ch:char;
begin
  readln(n,m);
  for i:=1 to m do
    begin
      read(ch);
      if ch in['w','W']then
        begin
          inc(op);
          readln(data[op,1],data[op,2],data[op,3]);
        end
      else
        begin
          readln(k);
          ans:=0;
          for j:=1 to op do
            if(k>=data[j,1])and(k<=data[j,2])then
              inc(ans,data[j,3]);
          writeln(ans);
        end;
    end;
end.