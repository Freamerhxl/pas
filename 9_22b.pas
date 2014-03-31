program dfx;
var
	i,j,k,l,n,m,ans:longint;
        f:array[0..100,0..100]of longint;
procedure go(o,who:longint);
var j:longint;
begin
        if o>=n then ans:=ans+1
        else
        begin
                for j:=who to 6 do
                go(o+1,j);
        end;
end;

begin
        {
        for i:=1 to 4 do
        begin
                n:=i;
                ans:=0;
                writeln(i);               k:=ans;
                for j:=1 to 6 do
                begin
                        go(1,j);
                        writeln(ans:10,ans-k:10);
                        k:=ans;
                end;    }
        read(n);
        for i:=1 to 6 do
                f[1,i]:=1;
        for i:=2 to n do
        for j:=1 to 6 do
                f[i,j]:=f[i,j-1]+f[i-1,j];
        ans:=0;
        for i:=6 downto 1 do
                ans:=ans+f[n,i];
        write(ans);
	close(input);		close(output);
end.