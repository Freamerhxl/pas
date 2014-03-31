program dfx;
const daidai=10000;
type arr=array[0..1000]of longint;
var
        i,j,k,l,n,m,qq:longint;
        zhi:array[0..10000]of longint;
        f:array[0..1,0..10000]of longint;
        ans:arr;

procedure add(j,o:longint);
begin
                k:=1;
                while zhi[k]<=j do
                begin
                        if j mod zhi[k]=0 then
                        begin
                                j:=j div zhi[k];
                                inc(f[o,zhi[k]]);
                        end
                        else    k:=k+1;
                end;
end;

procedure cheng(x:longint);
var i,j,len:longint;
begin
        len:=ans[0];
        for i:=1 to len do
                ans[i]:=ans[i]*x;
        for i:=1 to len do
        begin
                ans[i+1]:=ans[i+1]+(ans[i] div daidai);
                ans[i]:=ans[i] mod daidai;
        end;
        while ans[len+1]>0 do
        begin
                 len:=len+1;
                 ans[len+1]:=ans[len+1]+(ans[len] div daidai);
                 ans[len]:=ans[len] mod daidai;
        end;
        ans[0]:=len;
end;

begin
	assign(input,'b.in');	reset(input);
                read(m,n);
                if m<n then
                begin
                        write(0);       halt;
                end;
                if n=0 then
                begin
                        write(1);       halt;
                end;

                i:=2;
                zhi[0]:=1;      zhi[1]:=2;
                while i<m+n do
                begin
                        i:=i+1; k:=0;
                        for j:=1 to zhi[0] do
                        if i mod zhi[j]=0 then
                        begin
                                k:=-1;  break;
                        end;
                        if k<0 then
                        else
                        begin
                                zhi[0]:=zhi[0]+1;
                                zhi[zhi[0]]:=i;
                        end;
                end;

                ans[0]:=1;    ans[1]:=1;
                add(m-n+1,0);

                for i:=m+n downto m+2 do
                        add(i,0);
                for i:=2 to n do
                        add(i,1);

                j:=1;
                while (zhi[j]<=m+n)and(j<=zhi[0]) do
                begin
                        f[0,zhi[j]]:=f[0,zhi[j]]-f[1,zhi[j]];
                        if f[0,zhi[j]]>0 then
                        for k:=1 to  f[0,zhi[j]] do
                                cheng(zhi[j]);
                        j:=j+1;
                end;

                l:=ans[0];
                write(ans[l]);
                for i:=l-1 downto 1 do
                begin
                        k:=trunc(ln(ans[i])/ln(10))+1;
                        for j:=1 to 4-k do
                                write(0);
                        write(ans[i]);
                end;
	close(input);		close(output);
end.