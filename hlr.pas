{
我最高兴一件事，
是看见我递交的代码“Accepted”（通过）;
我更高兴的一件事,
是看见你的smile.
}
var
	map:array [0..200,0..20000] of boolean;
	la,lb,l:array [0..10000000] of integer;
	i,j,m,n,a,b,aa,bb,head,tail,ans:longint;
procedure swap(var x,y:longint);
var
	tmp:longint;
begin
	tmp:=x; x:=y; y:=tmp;
end;
begin
	readln(m);
	la[1]:=0;
	lb[1]:=1;
	head:=0;
	tail:=1;
	map[0,1]:=true;
	repeat
		inc(head);
		a:=la[head]; b:=lb[head];
		if (a=m) or (b=m) then
			begin
				ans:=l[head]; break;
			end;

		if a=0 then
			begin

				aa:=0; bb:=b+b;
				if (bb=m) or (aa=m) then
					begin
						ans:=l[head]+1; break;
					end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1;
						end;

				aa:=b; bb:=b+b;
				if (bb=m) or (aa=m) then
					begin
						ans:=l[head]+1; break;
					end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

					end else
						begin
							aa:=a+a; bb:=b;
							if aa>bb then swap(aa,bb);
							if (bb=m) or (aa=m) then
								begin
									ans:=l[head]+1; break;
								end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

				aa:=a; bb:=a+a;
				if aa>bb then swap(aa,bb);
					if (bb=m) or (aa=m) then
						begin
							ans:=l[head]+1; break;
						end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

				aa:=b; bb:=b+b;
				if aa>bb then swap(aa,bb);
					if (bb=m) or (aa=m) then
						begin
							ans:=l[head]+1; break;
						end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

				aa:=a; bb:=b+b;
				if aa>bb then swap(aa,bb);
					if (bb=m) or (aa=m) then
						begin
							ans:=l[head]+1; break;
						end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

				aa:=a; bb:=a+b;
				if aa>bb then swap(aa,bb);
					if (bb=m) or (aa=m) then
						begin
							ans:=l[head]+1; break;
						end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

				aa:=b; bb:=a+b;
				if aa>bb then swap(aa,bb);
					if (bb=m) or (aa=m) then
						begin
							ans:=l[head]+1; break;
						end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

				aa:=b-a; bb:=b;
				if aa>bb then swap(aa,bb);
					if (bb=m) or (aa=m) then
						begin
							ans:=l[head]+1; break;
						end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;

				aa:=b-a; bb:=a;
				if aa>bb then swap(aa,bb);
					if (bb=m) or (aa=m) then
						begin
							ans:=l[head]+1; break;
						end;
				if (aa<=200) and (bb<=20000) then
					if not map[aa,bb] then
						begin
							map[aa,bb]:=true;
							inc(tail); la[tail]:=aa; lb[tail]:=bb; l[tail]:=l[head]+1
						end;
		end;
	until head>=tail;
	writeln(ans);
end.