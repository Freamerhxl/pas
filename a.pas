program dfx;
var
	i,j,k,l,n,m,x,ans,le,ri,lef,rig:longint;
        flag:boolean;
        a:array[0..10001]of longint;
begin
        //assign(input,'a.in');	reset(input);
	//assign(output,'a.out');	rewrite(output);
                readln(n);
                ans:=-maxlongint;  l:=0;  k:=0;
                flag:=false;
                fillchar(a,sizeof(a),0);
                for i:=1 to n do
                begin
                        read(a[i]);
                        if a[i]>=0 then flag:=true;
                end;


                for i:=1 to n do
                begin
                        if i>1 then if a[i]+a[i-1]>ans then ans:=a[i]+a[i-1];
                        l:=l+a[i];  k:=k+1;
				if k=1 then le:=i;
                        if (l>ans)and(k>1)then
                        begin
                                ans:=l;
					lef:=le;	rig:=i;
                        end;
                        if (l<0)and
                           ((a[i+1]<=0)or(a[i+1]>0)and(i+2<=n))then
                        begin
                                l:=0;
                                k:=0;
                        end;
                end;
                if flag then
			begin
				writeln(lef,' ',rig);
                        write(ans)
			end
                else
                        write(0);
	//close(input);		close(output);
end.
X