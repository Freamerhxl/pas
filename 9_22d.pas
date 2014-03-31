program dfx;
var
	i,j,k,len,n,m,ans:longint;
	f:array[0..100]of longint;
        s1,s2:string;

procedure kk;
var i,len:longint;
begin
        len:=f[0];
        for i:=1 to len do
        begin
                f[i+1]:=f[i+1]+(f[i] div 10);
                f[i]:=f[i] mod 10;
        end;
        if f[len+1]>0 then len:=len+1;
        f[0]:=len;
end;

procedure add;
var i,j,len:longint;
begin
        len:=f[0];
        for i:=1 to len do
                f[i]:=f[i]*2;
        kk;
end;

begin
        read(n);
        if n<3 then
                write(0)
        else
        begin
                f[0]:=1; f[1]:=0;
                for i:=3 to n do
                begin
                        add;
                        if i and 1=1 then
                                f[1]:=f[1]+1;
                end;
                kk;
                for i:=f[0] downto 1 do
                write(f[i]);
        end;
end.