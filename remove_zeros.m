a=image_ro;                    
[sz1,sz2]=size(a);         
new_sz2=zeros(1,sz1);
for i=1:sz1
    new_mat{i}= nonzeros(a(i,:));
    new_row_sz(i)=size(new_mat{i},1);
end
if range(new_row_sz) == 0
    new_mat=cell2mat(new_mat);
end