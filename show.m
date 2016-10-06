function show(beginDistance, endDistance)

beginTxt = ceil(beginDistance / 1000000);
endTxt = ceil(endDistance / 1000000);

for i = beginTxt : endTxt
    dir = num2str(ceil(i / 10), '%02d');
    txt = num2str(i, '%03d');
    eval(['p', txt, '=importdata(''.\100000000\', dir, '\', txt, ...
        '.txt'');']);
end

hold on;

beginIndex = num2str(ceil((beginDistance - (beginTxt - 1) * 1000000) / 2));
endIndex = num2str(ceil((endDistance - (endTxt - 1) * 1000000) / 2));

if beginTxt == endTxt
    txt = num2str(beginTxt, '%03d');
    eval(['plot(p', txt, '(', beginIndex, ':', endIndex, ',1),p', txt, ...
        '(', beginIndex, ':', endIndex, ',2),''.b'');']);
else
    txt = num2str(beginTxt, '%03d');
    eval(['plot(p', txt, '(', beginIndex, ':500000,1),p', txt, '(', ...
        beginIndex, ':500000,2),''.b'');']);
    
    for i = beginTxt + 1 : endTxt - 1
        txt = num2str(i, '%03d');
        eval(['plot(p', txt, '(:,1),p', txt, '(:,2),''.b'');']);
    end
    
    txt = num2str(endTxt, '%03d');
    eval(['plot(p', txt, '(1:', endIndex, ',1),p', txt, '(1:', ...
        endIndex, ',2),''.b'');']);
end

return;
