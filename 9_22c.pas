{program dfx;
var
        i,j,k,l,n,m,ans:longint;
        a:array[0..9]of longint;
begin
        for i:=1000 to 9999 do
        begin
                j:=i;   k:=0;
                while j>0 do
                begin
                        if j mod 10=7 then k:=k+1;
                        j:=j div 10;
                end;
                if k and 1=0 then
                begin
                        ans:=ans+1;
                        inc(a[i div 100]);
//                        write(i:5);
                end;
        end;
        for i:=1 to 9 do
        writeln(i,a[i]:10);
        write(ans);
end.
       }

program dfx;
var
	i,j,l,n,m,ans:longint;
	f,tot:array[0..18]of int64;
        k:int64;
begin
        readln(n);
        f[0]:=1;        f[1]:=8;
        tot[1]:=10;
        for i:=2 to n do
        begin
                tot[i]:=tot[i-1]*10;
                //f[i]:=8*f[i-1]+1*(xxx-1-f[i-1]);
                k:=0;
                for j:=i-1 downto 0 do
                        k:=k+f[j];
                f[i]:=f[i]+8*k;
                k:=tot[i-1]-k;
                f[i]:=f[i]+k;
        end;
        write(f[n]);
end.