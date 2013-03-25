% values = orBodyGetCOM(bodyid)

function [com] = orBodyGetCOM(bodyid)
    [masses,offsets]=orBodyGetLinkMasses(bodyid,1);
    transforms=orBodyGetLinks(bodyid);
    mtotals=[0,0,0]';
    for k=1:length(masses)
        %slow way (not vetorized)
        T=[reshape(transforms(:,k),3,4);0,0,0,1];
        globaloffset=T(1:3,1:3)'*offsets(k,:)'+T(1:3,4);
        mtotals=mtotals+globaloffset*masses(k);

    end
    com=mtotals/sum(masses);

end
