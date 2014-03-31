program dfx;
var
	i,j,k,l,n,m,ans,len:longint;
        s:string;
        f:array[0..101,0..101]of longint;

function min(x,y:longint):longint;
begin
        if x<y then min:=x      else min:=y;
end;

procedure main;
begin
end;

begin
	assign(input,'d.in');	reset(input);
                n:=0;
                readln(s);
                n:=length(s);

                for i:=1 to n do
                        f[i,i]:=1;

                for i:=1 to n-1 do
                for j:=i+1 to n do
                begin
                        len:=j-i+1;
                        f[i,j]:=len;
                        for k:=len downto 2 do
                        if len mod k=0 then
                        begin
                                l:=i;   m:=len div k;
                                while l<j do
                                begin
                                        if (l+m>j)or(copy(s,l,m)=copy(s,l+m,m)) then
                                        l:=l+m
                                        else
                                        l:=200;
                                end;
                                if l<>200 then
                                begin
                                        IF (k div 10)+1+2+m<f[i,j] THEN
                                                f[i,j]:=(k div 10)+1+2+m;
                                end;
                        end;
                end;

                for i:=n-1 downto 1 do
                for j:=i+1 to n do
                begin
                        for k:=i to j-1 do
                        f[i,j]:=min(f[i,j],f[i,k]+f[k+1,j]);
                end;

                {for i:=1 to n do
                begin
                        write(i,'     ');
                        for j:=i to n do
                        write(f[i,j]:3);
                        writeln;
                end;}
                write(f[1,n]);
        close(input);		close(output);
end.
