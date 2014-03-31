var c:array[0..1000001]of longint;
    price,tree,left,right,size,fa:array[0..100001]of longint;
    i,j,n,m,k,p,maxprice,treesize,root,pp:longint;
procedure right_rotate(var x:longint);
var k:longint;
begin
  k:=left[x];
  left[x]:=right[k];
  right[k]:=x;
  size[k]:=size[x];
  size[x]:=size[left[x]]+size[right[x]]+1;
  x:=k;
end;
procedure left_rotate(var x:longint);
var k:longint;
begin
  k:=right[x];
  right[x]:=left[k];
  left[k]:=x;
  size[k]:=size[x];
  size[x]:=size[left[x]]+size[right[x]]+1;
  x:=k;
end;
procedure maintain(var x:longint;flag:boolean);
begin
  if flag then
    begin
      if size[right[right[x]]]>size[left[x]]then
        left_rotate(x)
      else
      if size[left[right[x]]]>size[left[x]]then
        begin
        right_rotate(right[x]);
        left_rotate(x);
        end
      else exit;
    end
  else
    begin
      if size[left[left[x]]]>size[right[x]]then
        right_rotate(x)
      else
      if size[right[left[x]]]>size[right[x]]then
        begin
        left_rotate(left[x]);
        right_rotate(x);
        end
      else exit;
    end;
  maintain(left[x],false);
  maintain(right[x],true);
  maintain(x,false);
  maintain(x,true);
end;
procedure insert(x:longint;var t:longint);
begin
  if t=0 then
    begin
      inc(treesize);tree[treesize]:=x;
      t:=treesize;size[treesize]:=1;
    end
  else
    begin
      if x>tree[t]then
        begin
          insert(x,left[t]);
        end
      else
        begin
          insert(x,right[t]);
        end;
      inc(size[t]);
    maintain(t,x<=tree[t]);
    end;
end;
function find(k,t:longint):longint;
begin
  if size[left[t]]=k-1 then exit(tree[t]);
  if size[left[t]]>=k then exit(find(k,left[t]))
  else exit(find(k-size[left[t]]-1,right[t]));
end;
begin
  assign(input,'buchaqian.in');reset(input);
  assign(output,'buchaqian.out');rewrite(output);
  readln(maxprice);k:=0;m:=0;n:=0;
  read(p);root:=0;
  while p<>0 do
    begin
      read(k);
      if p=1 then
        begin
          inc(n);price[n]:=k;inc(c[k]);
          insert(k,root);
        end
      else
     if p=2 then
      begin
        if c[price[k]]>0 then dec(c[price[k]]);
      end
      else
      if p=3 then
      begin
       if k>n then pp:=0 else
        pp:=find(k,root);
        if(pp=0)or(pp>maxprice)then
          writeln('Dui bu qi,Mei you.')
        else
        if c[pp]=0 then
          writeln('Mei you. Zhe ge ke yi you. Zhe ge zhen mei you!')
        else
        writeln('You. ',pp,' Yuan.');
      end;
      read(p);
    end;
  close(input);close(output);
end.