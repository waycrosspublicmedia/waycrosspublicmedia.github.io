function onEvent(name,v1)
if name == 'Trigger' and v1 == 'renderin' then
        doTweenAlpha('logoshit3','b',1,2,'quadOut')
        doTweenX('logoshit5','b',650,1.75,'circOut')
        doTweenAlpha('logoshit','logo',1,2,'quadOut')
elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenX('logoshit6','b',1350,2,'quadIn')
        doTweenAlpha('logoshit4','b',0,2,'quadOut')
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
end
end